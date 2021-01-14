import { Injectable } from '@nestjs/common';
import postgres from 'postgres';
import { v4 as uuid } from 'uuid';
import { User } from '../../../hogwarts/src/app/_models';
import conf from '../../../../database.json';

const dbConfig = conf.dev;
const user = dbConfig.user;
const password = dbConfig.password;
const host = dbConfig.host || 'localhost';
const port = dbConfig.port || 5432;
const database = dbConfig.database || 'hogwarts';

const sql = postgres(`postgres://${user}:${password}@${host}:${port}/${database}`);

const HEADMASTER_ID = 4;
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
        // Headmaster
        if (character.role_id === HEADMASTER_ID) {
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
                ;
            `;
        }
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

    async getProfessors() {
        return await sql`
            SELECT characters.name          AS name,
                   characters.date_of_birth AS date_of_birth,
                   string_agg(distinct subjects.name, ', ') AS subject_name
            FROM characters
                     JOIN subject_professor_year AS spy ON spy.id_professor = characters.id
                     JOIN subjects ON spy.id_subject = subjects.id
            GROUP BY characters.name, characters.date_of_birth

        `;
    }

    async getStaff(sid: number) {
        return await sql`
            SELECT characters.name          AS name,
                   characters.date_of_birth AS date_of_birth,
                   places.name              AS place,
                   locations.name           AS location,
                   characters.id            AS id
            FROM characters
                     JOIN staff s ON characters.id = s.character_id
                     LEFT JOIN places ON s.place_id = places.id
                     LEFT JOIN locations ON places.location_id = locations.id
        `;
    }

    async getStudents(sid: number) {
        return await sql`
            SELECT characters.name          AS name,
                   characters.date_of_birth AS date_of_birth,
                   students.year            AS year,
                   faculties.name           AS faculty
            FROM characters
                     JOIN students ON characters.id = students.character_id
                     JOIN faculties ON students.faculty_id = faculties.id
        `;
    }

    async putExamMark(examId: number, points: number) {
        return await sql`
            UPDATE exams
            SET points = ${points}
            WHERE exams.id = ${examId};
        `;
    }

    async putProfessor(name: string, dob: string, place: string, un: string, p: string) {
        return await sql`

        `;
    }

    async putStaff(name: string, dob: string, place: string, un: string, p: string) {
        return await sql`
            CALL add_staff(${name}, ${dob}, ${place}, ${un}, ${p});
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
