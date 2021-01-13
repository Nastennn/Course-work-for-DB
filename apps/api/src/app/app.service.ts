import {Injectable} from '@nestjs/common';
import postgres from 'postgres';
import {v4 as uuid} from 'uuid';
import {User} from '../../../hogwarts/src/app/_models';
import conf from '../../../../database.json';

const dbConfig = conf.dev;
const user = dbConfig.user;
const password = dbConfig.password;
const host = dbConfig.host || 'localhost';
const port = dbConfig.port || 5432;
const database = dbConfig.database || 'hogwarts';

const sql = postgres(`postgres://${user}:${password}@${host}:${port}/${database}`);

const PROFESSOR_ID = 3;
const STUDENT_ID = 2;

@Injectable()
export class AppService {
    /**
     * @param {number} sid
     */
    async getUsers(sid: number) {
        const [character] = await sql`
            SELECT characters.id, character_roles.role_id, students.year AS year
            FROM characters
                     JOIN character_roles ON characters.id = character_roles.character_id
                     JOIN students ON characters.id = students.character_id
            WHERE sid = ${sid}
        `;
        // Professor
        if (character.role_id === PROFESSOR_ID) {
            return await sql`
                SELECT exams.points                      AS points,
                       subject_professor_year.year       AS year,
                       characters.name                   AS name,
                       subjects.name                     AS subject_name,
                       subject_professor_year.id_subject AS subject_id,
                       exams.student_id                  AS student_id,
                       exams.id                          AS exam_id
                FROM exams
                         LEFT JOIN students ON students.id = exams.student_id
                         LEFT JOIN characters ON students.character_id = characters.id
                         LEFT JOIN subject_professor_year ON subject_professor_year.id = exams.subject_professor_year_id
                         LEFT JOIN subjects ON subjects.id = subject_professor_year.id_subject
                WHERE subject_professor_year.id_professor = ${character.id};

            `;
        }

        if (character.role_id === STUDENT_ID) {
            return await sql`
                SELECT exams.points                      AS points,
                       subject_professor_year.year       AS year,
                       characters.name                   AS name,
                       subjects.name                     AS subject_name,
                       subject_professor_year.id_subject AS subject_id,
                       exams.student_id                  AS student_id,
                       exams.id                          AS exam_id
                FROM exams
                         LEFT JOIN students ON students.id = exams.student_id
                         LEFT JOIN characters ON students.character_id = characters.id
                         LEFT JOIN subject_professor_year ON subject_professor_year.id = exams.subject_professor_year_id
                         LEFT JOIN subjects ON subjects.id = subject_professor_year.id_subject
                WHERE students.id = ${character.id}
                  AND subject_professor_year.year = ${character.year};
            `;
        }

    }

    async getExamMarks(sid: number) {
        const [character] = await sql`
            SELECT characters.id,
                   character_roles.role_id,
                   students.year AS year
            FROM characters
                     JOIN character_roles ON characters.id = character_roles.character_id
                     JOIN students ON characters.id = students.character_id
            WHERE sid = ${sid}
        `;

        return await sql`
            SELECT exams.id        AS id,
                   exams.points    AS points,
                   subjects.name   AS subject_name,
                   exam_types.name AS type,
                   subjects.year   AS subject_year
            FROM exams
                     LEFT JOIN students ON students.id = exams.student_id
                     LEFT JOIN subjects ON subjects.id = exams.subject_id
                     LEFT JOIN exam_types on exam_types.id = exams.type_id
            WHERE students.id = ${character.id};
        `;
    }

    async getStudents(sid: number, year: number, faculty: string) {
        const [character] = await sql`
            SELECT characters.id,
                   character_roles.role_id,
                   students.year AS year
            FROM characters
                     JOIN character_roles ON characters.id = character_roles.character_id
                     JOIN students ON characters.id = students.character_id
            WHERE sid = ${sid}
        `;

        return await sql`
            SELECT exams.points     AS points,
                   characters.name  AS name,
                   subjects.name    AS subject_name,
                   exams.student_id AS student_id,
                   exam_types.name  AS type
            FROM exams
                     LEFT JOIN students ON students.id = exams.student_id
                     LEFT JOIN characters ON students.character_id = characters.id
                     LEFT JOIN subjects ON subjects.id = exams.subject_id
                     LEFT JOIN exam_types on exam_types.id = exams.type_id
                     LEFT JOIN professors on subjects.id = professors.subject_id
                     LEFT JOIN faculties on students.faculty_id = faculties.id
            WHERE professors.id = ${character.id}
              and students.id = ${year}
              and faculties.name = ${faculty}
            ;
        `;
    }

    async putExamMark(examId: number, points: number) {
        return await sql`
            UPDATE exams
            SET points = ${points}
            WHERE exams.id = ${examId};
        `;
    }

    async authenticateUser(username: string, password: string): Promise<User> {
        let [user] = await sql`
            SELECT *
            FROM characters
            WHERE username = ${username}`;

        if (!user) {
            return null;
        }

        if (user.password === password) {
            const sessionId = uuid();
            await sql`
                UPDATE characters
                SET sid = ${sessionId}
                WHERE id = ${user.id}`;

            [user] = await sql`
                SELECT *
                FROM characters
                         JOIN character_roles cr ON characters.id = cr.character_id
                WHERE id = ${user.id}`;

            return user;
        }

        return null;
    }
}
