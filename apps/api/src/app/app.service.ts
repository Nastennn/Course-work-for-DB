import {Injectable} from '@nestjs/common';
import postgres from 'postgres';
import {v4 as uuid} from 'uuid';
import {User} from '../../../hogwarts/src/app/_models';
import conf from '../../../../database.json';

const dbConfig = conf.dev;
const user = dbConfig.user;
const password = dbConfig.password
const host = dbConfig.host || 'localhost';
const port = dbConfig.port || 5432;
const database = dbConfig.database || 'hogwarts';

const sql = postgres(`postgres://${user}:${password}@${host}:${port}/${database}`);

@Injectable()
export class AppService {
  async getUsers() {
    return await sql`
      SELECT exams.points     AS points,
             students.year    AS year,
             characters.name  AS name,
             subjects.name    AS subject_name,
             exams.subject_id AS subject_id,
             exams.student_id AS student_id
      FROM exams
             LEFT JOIN students ON students.id = exams.student_id
             LEFT JOIN characters ON students.character_id = characters.id
             LEFT JOIN subjects ON subjects.id = exams.subject_id
             LEFT JOIN professors ON subjects.id = professors.subject_id;

    `;
  }

  async putExamMark(studentId: number, subjectId: number, points: number) {
    return await sql`
      UPDATE exams
      SET points = ${points}
      WHERE exams.student_id = ${studentId}
        AND exams.subject_id = ${subjectId};
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
               join character_roles cr on characters.id = cr.character_id
        WHERE id = ${user.id}`;

      return user;
    }

    return null;
  }
}
