DROP TABLE IF EXISTS subjects CASCADE;
DROP TABLE IF EXISTS professors CASCADE;

CREATE TABLE IF NOT EXISTS subjects
(
    id   serial PRIMARY KEY,
    name text
);

DROP TABLE IF EXISTS subject_professor_year CASCADE;

CREATE TABLE IF NOT EXISTS subject_professor_year
(
    id           serial PRIMARY KEY,
    id_subject   int REFERENCES subjects,
    id_professor int REFERENCES characters,
    year         int,
    is_mandatory boolean DEFAULT TRUE,
    UNIQUE (id_subject, id_professor, year)
);

INSERT INTO subjects(id, name)
VALUES (1, 'Зельеварение');
INSERT INTO subjects(id, name)
VALUES (2, 'Трансфигурация');
INSERT INTO subjects(id, name)
VALUES (3, 'Заклинания');
INSERT INTO subjects(id, name)
VALUES (4, 'Защита от Темных Искусств');
INSERT INTO subjects(id, name)
VALUES (5, 'Травология');
INSERT INTO subjects(id, name)
VALUES (6, 'Уход за магическими существами');
INSERT INTO subjects(id, name)
VALUES (7, 'Прорицания');
INSERT INTO subjects(id, name)
VALUES (8, 'Древние руны');
INSERT INTO subjects(id, name)
VALUES (9, 'Астрономия');
INSERT INTO subjects(id, name)
VALUES (10, 'История магии');
INSERT INTO subjects(id, name)
VALUES (11, 'Курс трансгрессии');
INSERT INTO subjects(id, name)
VALUES (12, 'Полёты на мётлах');


INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (6, 5, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (9, 1, 1);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (5, 5, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (3, 1, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (7, 1, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (1, 6, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (11, 2, 7);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (5, 1, 6);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (9, 7, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (12, 6, 3);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (1, 7, 3);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (10, 4, 4);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (8, 6, 7);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (10, 3, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (4, 7, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (5, 3, 3);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (10, 3, 1);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (12, 2, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (7, 7, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (4, 5, 7);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (6, 6, 4);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (3, 6, 6);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (2, 5, 1);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (5, 1, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (5, 7, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (10, 1, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (12, 3, 6);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (2, 3, 1);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (6, 1, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (1, 6, 4);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (7, 1, 1);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (12, 2, 6);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (8, 5, 3);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (4, 1, 3);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (11, 6, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (2, 2, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (6, 3, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (6, 7, 3);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (11, 3, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (1, 4, 1);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (3, 4, 4);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (7, 2, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (6, 2, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (8, 7, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (11, 1, 3);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (3, 6, 1);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (1, 2, 4);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (9, 3, 6);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (10, 3, 4);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (2, 6, 6);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (5, 4, 6);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (6, 1, 1);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (6, 4, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (2, 2, 3);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (10, 4, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (4, 6, 4);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (8, 6, 3);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (6, 4, 6);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (9, 2, 6);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (3, 2, 6);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (5, 5, 1);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (10, 5, 3);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (3, 2, 4);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (3, 3, 3);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (4, 2, 1);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (2, 7, 7);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (1, 2, 6);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (8, 4, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (7, 4, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (10, 3, 6);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (2, 1, 4);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (7, 2, 1);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (9, 4, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (4, 1, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (4, 7, 4);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (12, 6, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (5, 1, 4);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (9, 3, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (9, 2, 1);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (10, 6, 1);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (7, 7, 6);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (5, 7, 4);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (9, 3, 7);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (6, 1, 4);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (12, 2, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (5, 1, 1);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (4, 6, 3);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (2, 1, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (11, 7, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (9, 5, 3);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (9, 2, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (8, 1, 5);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (7, 6, 7);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (6, 1, 6);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (1, 7, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (5, 4, 2);
INSERT INTO subject_professor_year(id_subject, id_professor, year)
VALUES (9, 4, 3);

DROP TABLE IF EXISTS exams CASCADE;

CREATE TABLE exams
(
    id                        serial PRIMARY KEY,
    student_id                int NOT NULL
        REFERENCES students,
    type_id                   int NOT NULL
        REFERENCES exam_types,
    subject_professor_year_id int REFERENCES subject_professor_year,
    points                    int NOT NULL
);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 3, 1, 56);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 84, 1, 30);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 87, 3, 15);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 74, 2, 76);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 81, 1, 30);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 35, 3, 73);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 97, 3, 22);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 21, 1, 4);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 14, 3, 46);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 16, 1, 90);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 44, 2, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 36, 3, 88);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 62, 1, 19);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 21, 1, 84);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 88, 1, 74);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 84, 3, 51);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 25, 1, 86);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 63, 1, 44);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 91, 1, 54);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 24, 2, 13);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 96, 1, 31);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 35, 3, 53);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 13, 3, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 43, 2, 16);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 24, 3, 33);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 49, 2, 44);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 67, 3, 90);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 33, 2, 90);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 56, 2, 33);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 69, 2, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 24, 1, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 64, 1, 34);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 31, 2, 76);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 31, 3, 74);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 22, 3, 74);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 56, 2, 46);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 4, 1, 25);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 3, 2, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 75, 1, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 79, 3, 27);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 62, 3, 77);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 21, 3, 37);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 13, 2, 1);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 14, 2, 72);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 61, 3, 53);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 4, 1, 19);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 34, 1, 98);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 58, 3, 31);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 97, 3, 72);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 35, 3, 15);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 84, 3, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 35, 1, 81);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 65, 3, 44);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 95, 3, 80);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 49, 3, 41);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 42, 3, 13);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 35, 3, 23);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 22, 1, 27);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 69, 1, 32);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 58, 3, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 78, 2, 83);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 18, 3, 12);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 46, 2, 87);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 52, 2, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 28, 3, 31);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 86, 1, 66);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 84, 1, 93);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 39, 1, 80);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 57, 3, 34);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 17, 2, 62);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 3, 2, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 72, 2, 1);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 42, 2, 19);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 23, 2, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 75, 2, 93);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 57, 2, 81);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 18, 1, 28);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 20, 3, 99);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 71, 1, 71);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 33, 2, 15);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 24, 1, 4);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 49, 1, 20);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 59, 2, 11);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 52, 2, 50);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 56, 2, 71);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 95, 2, 87);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 6, 3, 4);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 59, 1, 67);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 6, 2, 72);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 12, 3, 61);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 82, 2, 67);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 30, 1, 74);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 87, 2, 61);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 94, 2, 10);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 76, 2, 51);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 40, 3, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 61, 3, 76);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 53, 3, 88);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 87, 2, 23);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 4, 3, 82);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 1, 1, 36);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 93, 2, 28);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 57, 3, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 24, 2, 24);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 92, 2, 27);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 85, 1, 96);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 76, 3, 39);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 47, 1, 15);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 91, 3, 49);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 3, 1, 25);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 73, 3, 61);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 29, 3, 25);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 96, 3, 20);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 64, 3, 26);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 86, 2, 53);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 46, 2, 8);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 19, 3, 96);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 70, 2, 15);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 23, 2, 49);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 12, 2, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 90, 2, 98);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 27, 3, 76);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 20, 3, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 31, 2, 66);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 79, 3, 22);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 3, 1, 44);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 88, 1, 50);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 59, 3, 54);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 77, 2, 24);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 4, 1, 16);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 66, 2, 28);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 93, 3, 26);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 62, 2, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 53, 2, 86);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 90, 3, 66);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 52, 2, 93);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 96, 1, 51);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 90, 3, 79);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 51, 2, 99);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 35, 1, 55);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 14, 2, 18);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 69, 2, 21);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 64, 3, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 91, 1, 24);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 40, 3, 96);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 2, 3, 97);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 69, 2, 66);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 51, 2, 19);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 44, 2, 92);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 74, 1, 15);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 73, 2, 80);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 15, 2, 81);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 85, 2, 16);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 83, 3, 34);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 24, 2, 86);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 63, 3, 12);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 62, 3, 51);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 66, 2, 44);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 93, 1, 14);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 49, 2, 4);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 54, 3, 96);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 24, 2, 75);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 34, 2, 17);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 19, 1, 81);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 42, 2, 70);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 1, 3, 88);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 27, 1, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 10, 2, 90);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 75, 2, 63);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 48, 3, 88);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 52, 3, 8);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 62, 2, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 16, 1, 91);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 50, 2, 49);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 51, 3, 11);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 9, 2, 63);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 13, 3, 3);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 29, 1, 97);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 1, 1, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 27, 1, 26);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 70, 1, 84);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 75, 2, 78);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 28, 3, 58);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 19, 1, 20);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 20, 2, 57);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 46, 2, 49);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 20, 1, 8);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 13, 1, 70);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 4, 2, 5);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 47, 2, 9);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 77, 3, 76);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 29, 2, 86);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 18, 2, 68);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 20, 3, 53);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 26, 3, 86);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 46, 2, 74);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 45, 1, 98);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 50, 3, 74);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 23, 2, 96);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 72, 2, 1);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 3, 1, 40);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 67, 3, 25);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 66, 2, 100);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 30, 3, 64);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 33, 1, 75);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 14, 2, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 75, 3, 50);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 62, 1, 8);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 41, 3, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 48, 2, 61);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 83, 1, 95);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 46, 3, 96);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 29, 1, 77);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 54, 3, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 76, 1, 5);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 97, 3, 9);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 3, 2, 20);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 53, 3, 12);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 25, 3, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 34, 2, 8);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 50, 1, 4);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 5, 2, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 74, 1, 42);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 81, 2, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 59, 1, 49);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 35, 3, 80);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 75, 3, 41);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 69, 2, 91);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 73, 1, 49);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 85, 2, 55);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 33, 3, 86);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 36, 1, 77);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 10, 3, 35);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 79, 3, 94);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 7, 1, 77);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 21, 1, 36);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 58, 1, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 27, 2, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 56, 1, 12);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 16, 1, 41);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 13, 1, 49);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 88, 2, 55);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 16, 3, 45);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 47, 2, 20);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 97, 2, 48);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 24, 2, 46);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 8, 1, 44);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 92, 2, 40);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 63, 2, 42);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 3, 2, 18);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 81, 1, 82);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 55, 2, 71);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 24, 2, 39);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 3, 1, 18);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 97, 1, 49);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 13, 1, 50);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 41, 1, 47);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 67, 3, 93);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 8, 1, 50);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 54, 3, 83);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 27, 1, 21);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 7, 1, 84);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 86, 1, 13);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 21, 2, 37);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 83, 2, 51);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 11, 3, 55);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 48, 2, 27);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 82, 2, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 76, 3, 91);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 6, 3, 21);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 18, 3, 9);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 12, 3, 67);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 69, 1, 77);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 56, 1, 10);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 50, 3, 90);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 6, 3, 84);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 76, 1, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 10, 1, 10);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 38, 3, 81);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 53, 1, 66);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 65, 2, 1);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 61, 1, 75);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 42, 1, 83);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 57, 2, 17);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 84, 1, 70);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 82, 1, 48);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 1, 2, 17);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 53, 1, 15);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 85, 2, 40);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 52, 2, 30);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 12, 2, 83);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 22, 3, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 19, 3, 39);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 25, 3, 87);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 50, 1, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 7, 2, 31);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 27, 3, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 93, 3, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 63, 3, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 89, 2, 13);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 11, 2, 66);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 10, 1, 1);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 25, 2, 18);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 37, 2, 42);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 29, 3, 81);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 25, 3, 29);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 16, 2, 43);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 39, 1, 98);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 28, 1, 75);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 1, 1, 73);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 94, 3, 74);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 19, 3, 26);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 89, 2, 54);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 67, 3, 48);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 6, 3, 64);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 13, 2, 24);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 10, 2, 80);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 94, 2, 66);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 13, 1, 25);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 18, 3, 3);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 89, 2, 58);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 8, 2, 60);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 64, 1, 12);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 87, 3, 22);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 14, 1, 17);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 8, 3, 18);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 42, 1, 99);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 35, 2, 71);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 55, 3, 86);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 16, 1, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 22, 3, 95);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 88, 2, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 25, 3, 10);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 89, 3, 23);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 11, 2, 1);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 43, 1, 26);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 3, 2, 5);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 51, 1, 96);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 26, 1, 23);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 22, 3, 44);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 55, 2, 14);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 95, 1, 83);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 63, 1, 47);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 94, 3, 35);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 75, 1, 8);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 80, 1, 22);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 65, 1, 44);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 45, 2, 83);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 22, 2, 76);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 65, 2, 91);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 73, 2, 91);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 52, 3, 32);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 33, 1, 37);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 60, 2, 57);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 69, 2, 98);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 16, 2, 81);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 62, 2, 35);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 17, 3, 5);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 29, 1, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 57, 2, 16);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 22, 1, 84);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 45, 2, 37);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 87, 1, 81);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 73, 1, 64);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 79, 3, 13);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 90, 3, 43);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 22, 3, 13);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 90, 1, 77);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 39, 2, 78);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 50, 2, 26);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 23, 2, 19);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 66, 1, 47);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 54, 1, 31);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 56, 2, 3);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 81, 2, 70);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 68, 2, 73);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 80, 2, 67);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 94, 3, 11);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 20, 2, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 93, 2, 97);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 8, 2, 24);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 79, 1, 71);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 57, 3, 31);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 81, 1, 84);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 36, 1, 100);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 62, 1, 11);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 1, 2, 58);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 34, 1, 79);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 41, 1, 20);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 92, 2, 27);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 19, 1, 94);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 42, 3, 73);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 64, 1, 69);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 95, 2, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 45, 3, 43);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 40, 2, 46);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 2, 2, 11);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 52, 2, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 94, 2, 67);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 62, 1, 80);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 10, 3, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 20, 2, 67);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 46, 3, 6);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 44, 3, 64);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 30, 1, 12);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 8, 2, 28);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 96, 3, 21);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 58, 1, 29);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 91, 1, 53);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 30, 1, 42);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 69, 2, 92);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 32, 2, 24);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 47, 1, 5);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 1, 1, 16);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 19, 3, 84);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 90, 3, 24);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 85, 3, 60);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 68, 1, 97);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 53, 1, 53);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 90, 3, 55);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 27, 3, 24);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 55, 1, 63);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 36, 3, 14);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 93, 2, 93);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 51, 3, 75);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 85, 1, 67);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 55, 2, 39);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 60, 3, 26);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 74, 2, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 12, 1, 96);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 71, 2, 26);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 78, 1, 97);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 59, 1, 22);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 61, 1, 68);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 58, 2, 84);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 95, 2, 83);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 86, 1, 30);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 50, 2, 73);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 32, 1, 21);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 11, 2, 58);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 14, 1, 90);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 72, 2, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 20, 1, 51);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 66, 3, 22);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 91, 3, 97);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 75, 1, 22);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 83, 1, 97);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 38, 2, 97);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 27, 1, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 84, 3, 15);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 92, 1, 44);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 38, 1, 55);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 53, 2, 10);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 11, 3, 99);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 64, 1, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 22, 3, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 14, 1, 14);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 44, 2, 44);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 78, 1, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 36, 2, 57);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 58, 3, 16);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 20, 2, 62);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 82, 1, 29);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 67, 3, 58);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 56, 2, 18);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 14, 1, 72);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 60, 1, 87);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 95, 2, 91);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 40, 1, 42);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 52, 2, 51);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 5, 2, 66);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 90, 2, 68);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 36, 2, 76);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 54, 2, 1);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 88, 2, 70);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 45, 1, 90);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 80, 3, 49);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 92, 1, 70);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 14, 2, 67);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 7, 3, 81);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 71, 1, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 37, 1, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 52, 1, 71);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 72, 1, 16);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 46, 3, 1);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 46, 2, 76);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 91, 1, 6);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 72, 2, 51);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 28, 3, 82);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 68, 3, 96);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 5, 3, 25);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 64, 1, 86);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 87, 1, 6);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 49, 3, 85);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 1, 2, 23);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 75, 1, 75);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 92, 1, 73);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 93, 2, 16);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 30, 1, 59);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 50, 3, 11);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 14, 3, 14);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 56, 2, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 23, 3, 44);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 87, 2, 46);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 2, 1, 69);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 44, 2, 19);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 66, 2, 50);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 47, 3, 37);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 96, 3, 66);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 52, 2, 20);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 40, 3, 48);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 61, 1, 4);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 42, 2, 8);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 55, 1, 11);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 73, 2, 53);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 84, 3, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 68, 3, 40);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 30, 1, 57);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 67, 3, 45);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 87, 1, 29);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 29, 2, 48);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 55, 1, 62);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 81, 2, 75);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 12, 2, 39);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 15, 2, 26);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 23, 2, 58);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 22, 2, 55);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 27, 2, 27);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 19, 1, 76);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 31, 1, 4);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 21, 3, 5);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 81, 1, 69);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 17, 3, 32);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 92, 1, 64);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 75, 3, 90);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 34, 3, 84);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 62, 3, 62);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 30, 1, 19);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 97, 3, 93);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 65, 3, 31);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 5, 3, 47);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 30, 1, 58);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 37, 3, 25);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 53, 2, 39);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 17, 3, 75);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 30, 2, 100);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 9, 2, 47);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 82, 2, 81);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 28, 3, 58);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 34, 2, 42);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 14, 3, 18);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 32, 1, 81);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 88, 2, 87);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 11, 1, 43);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 8, 1, 22);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 83, 1, 45);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 87, 1, 85);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 68, 1, 25);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 57, 3, 40);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 12, 1, 60);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 78, 2, 83);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 56, 1, 36);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 73, 3, 32);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 14, 3, 93);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 72, 3, 56);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 48, 2, 14);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 75, 1, 83);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 43, 2, 62);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 67, 1, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 41, 3, 63);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 49, 2, 93);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 28, 1, 4);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 2, 2, 66);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 43, 1, 15);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 68, 3, 66);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 68, 1, 1);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 31, 3, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 70, 3, 66);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 72, 3, 62);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 94, 2, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 21, 1, 72);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 53, 3, 6);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 2, 1, 41);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 65, 2, 62);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 89, 2, 61);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 1, 2, 78);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 31, 2, 25);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 39, 1, 87);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 66, 3, 74);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 11, 2, 1);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 35, 1, 23);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 43, 1, 19);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 13, 1, 15);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 6, 3, 28);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 15, 1, 43);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 87, 3, 4);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 78, 1, 88);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 93, 3, 46);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 38, 3, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 15, 2, 63);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 12, 3, 5);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 76, 3, 70);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 28, 3, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 44, 1, 31);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 64, 1, 99);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 81, 1, 70);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 19, 2, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 90, 2, 92);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 35, 3, 20);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 60, 1, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 36, 1, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 15, 3, 11);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 96, 1, 75);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 70, 1, 79);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 90, 1, 44);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 65, 1, 98);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 17, 1, 5);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 59, 1, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 29, 1, 23);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 5, 1, 45);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 82, 2, 91);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 71, 3, 18);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 55, 3, 9);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 36, 2, 28);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 51, 3, 70);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 93, 3, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 64, 2, 6);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 17, 2, 98);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 20, 1, 54);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 14, 1, 6);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 56, 1, 10);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 25, 1, 42);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 83, 1, 41);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 15, 3, 64);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 15, 1, 19);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 1, 1, 26);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 72, 1, 58);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 41, 2, 9);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 5, 1, 99);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 25, 1, 35);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 63, 2, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 60, 3, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 62, 3, 59);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 92, 2, 91);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 34, 1, 40);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 2, 1, 1);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 11, 1, 81);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 44, 1, 45);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 72, 2, 91);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 66, 2, 25);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 26, 1, 85);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 64, 1, 30);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 1, 3, 63);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 72, 2, 86);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 36, 2, 67);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 25, 2, 33);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 25, 2, 34);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 94, 3, 6);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 57, 3, 99);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 32, 1, 90);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 45, 2, 82);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 78, 3, 94);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 3, 2, 56);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 20, 2, 3);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 45, 1, 97);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 49, 3, 49);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 12, 3, 3);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 90, 3, 46);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 67, 1, 6);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 79, 3, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 80, 3, 75);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 25, 1, 70);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 9, 1, 78);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 12, 2, 11);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 46, 1, 43);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 69, 3, 75);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 48, 2, 68);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 83, 1, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 97, 1, 13);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 20, 3, 88);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 35, 1, 44);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 69, 1, 29);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 62, 2, 74);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 59, 2, 97);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 25, 1, 93);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 84, 1, 98);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 78, 1, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 90, 2, 79);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 30, 3, 3);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 74, 3, 57);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 34, 3, 64);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 44, 1, 98);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 17, 1, 99);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 91, 2, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 41, 2, 77);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 48, 3, 14);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 23, 1, 21);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 32, 1, 31);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 67, 3, 23);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 79, 3, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 59, 2, 93);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 16, 3, 87);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 68, 3, 14);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 57, 1, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 16, 1, 94);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 82, 1, 64);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 24, 1, 67);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 82, 3, 71);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 78, 1, 53);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 2, 2, 73);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 53, 2, 64);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 12, 2, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 37, 3, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 75, 3, 76);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 41, 1, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 3, 2, 54);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 8, 3, 51);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 80, 1, 90);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 68, 1, 13);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 77, 1, 73);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 6, 1, 82);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 1, 1, 69);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 85, 1, 55);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 35, 3, 12);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 4, 1, 53);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 10, 2, 73);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 6, 3, 30);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 26, 1, 76);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 37, 2, 75);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 5, 2, 6);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 53, 3, 84);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 28, 2, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 74, 3, 54);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 17, 3, 8);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 53, 2, 27);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 25, 2, 56);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 28, 2, 95);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 11, 3, 62);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 93, 3, 55);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 85, 3, 60);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 18, 1, 63);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 48, 2, 50);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 46, 1, 5);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 31, 1, 4);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 56, 1, 4);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 73, 2, 97);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 91, 3, 5);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 21, 1, 64);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 36, 3, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 59, 3, 20);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 46, 1, 18);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 48, 1, 26);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 66, 1, 5);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 33, 1, 77);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 67, 2, 39);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 16, 3, 19);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 13, 1, 9);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 19, 3, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 8, 1, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 32, 2, 90);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 74, 3, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 84, 1, 42);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 26, 1, 64);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 43, 2, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 61, 1, 25);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 51, 2, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 34, 2, 4);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 49, 1, 55);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 73, 2, 43);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 35, 1, 99);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 33, 3, 99);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 86, 1, 48);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 88, 2, 47);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 21, 2, 42);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 26, 1, 70);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 49, 1, 51);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 96, 2, 39);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 15, 1, 24);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 10, 2, 39);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 69, 1, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 6, 1, 21);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 45, 3, 60);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 18, 2, 8);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 13, 1, 4);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 1, 1, 79);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 5, 3, 19);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 45, 1, 77);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 30, 2, 67);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 58, 1, 42);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 17, 3, 17);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 90, 2, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 11, 2, 32);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 95, 1, 96);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 12, 1, 67);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 25, 1, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 10, 1, 84);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 92, 3, 94);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 70, 1, 84);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 42, 1, 93);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 72, 2, 71);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 67, 1, 70);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 4, 2, 92);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 4, 1, 32);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 77, 3, 71);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 76, 3, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 24, 1, 68);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 67, 1, 59);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (12, 23, 1, 15);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 33, 3, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 82, 3, 70);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 68, 1, 11);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 11, 2, 73);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 26, 2, 51);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 37, 3, 92);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 90, 2, 73);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 66, 3, 87);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 60, 1, 74);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 73, 1, 67);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 96, 2, 13);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 72, 2, 30);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 21, 3, 71);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 14, 3, 85);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 43, 2, 71);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 10, 2, 29);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 86, 3, 92);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 91, 2, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 12, 3, 22);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 6, 3, 73);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 14, 2, 28);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 97, 1, 97);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 33, 2, 3);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 80, 1, 97);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 33, 3, 75);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 29, 2, 20);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 62, 2, 35);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 84, 2, 93);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 59, 3, 84);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 32, 1, 74);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 95, 2, 85);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 58, 2, 76);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 60, 1, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 2, 3, 5);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 22, 1, 99);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 48, 2, 12);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 75, 3, 21);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 45, 2, 77);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 78, 3, 49);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 68, 1, 14);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 45, 3, 40);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 36, 1, 71);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 96, 1, 11);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 79, 2, 81);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 41, 2, 34);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 41, 3, 58);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 82, 1, 94);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 41, 2, 86);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 66, 1, 43);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 79, 3, 39);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 55, 2, 55);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 45, 1, 23);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 81, 3, 70);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 90, 2, 79);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 81, 3, 59);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 80, 3, 33);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 42, 2, 91);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 5, 1, 93);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 57, 1, 81);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 52, 3, 33);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 77, 1, 57);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 60, 2, 19);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 90, 2, 99);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 65, 2, 30);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 80, 1, 5);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 59, 3, 29);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 51, 3, 74);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 18, 2, 61);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 53, 3, 1);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 54, 3, 62);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 5, 3, 68);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 76, 2, 86);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 39, 1, 25);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 86, 1, 9);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 53, 2, 4);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 13, 1, 50);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 21, 1, 60);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 31, 2, 33);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 67, 3, 29);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 21, 2, 77);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 43, 2, 32);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 80, 1, 46);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 68, 3, 25);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 28, 1, 49);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 88, 3, 78);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 15, 3, 94);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 49, 1, 96);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 22, 2, 66);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 92, 3, 39);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 89, 2, 25);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 11, 2, 32);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 68, 1, 74);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 96, 2, 57);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 32, 2, 29);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 16, 2, 13);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 88, 1, 40);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 79, 1, 20);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 60, 1, 68);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 37, 2, 87);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 25, 2, 25);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 84, 2, 83);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 16, 3, 39);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 72, 1, 86);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 74, 3, 79);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 50, 3, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 11, 3, 29);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 82, 2, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 26, 2, 88);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 18, 2, 23);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 36, 2, 69);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 82, 3, 13);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 83, 3, 64);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 81, 1, 80);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 95, 3, 17);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 85, 2, 12);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 14, 1, 93);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 63, 1, 14);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 13, 1, 9);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 5, 1, 58);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 45, 1, 98);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 3, 1, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (24, 56, 2, 84);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (25, 34, 2, 6);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 75, 1, 28);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 65, 2, 37);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 47, 2, 82);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 46, 3, 88);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 52, 1, 46);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 11, 3, 30);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (16, 19, 2, 83);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 18, 2, 29);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (8, 1, 1, 44);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 2, 3, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 43, 2, 88);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (18, 18, 1, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 61, 2, 88);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 21, 2, 76);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 41, 3, 99);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 18, 1, 97);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 83, 2, 33);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 58, 2, 73);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (15, 11, 2, 28);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 78, 1, 46);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 68, 1, 51);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 45, 1, 70);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 72, 2, 89);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 57, 1, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 89, 1, 36);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (19, 25, 1, 94);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 51, 2, 48);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 92, 1, 21);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 65, 3, 43);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 17, 2, 50);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 18, 2, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 22, 1, 38);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (31, 49, 3, 11);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 9, 1, 43);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 37, 1, 61);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 64, 3, 56);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 71, 1, 7);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 42, 2, 88);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 81, 1, 27);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 20, 3, 75);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 3, 1, 95);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 37, 2, 12);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 93, 1, 80);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 9, 3, 41);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (20, 80, 3, 90);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 25, 2, 77);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 26, 1, 66);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 89, 1, 16);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (10, 15, 1, 2);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (27, 15, 3, 76);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (30, 70, 1, 91);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (29, 80, 1, 87);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 1, 3, 26);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (26, 16, 3, 92);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 29, 3, 79);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 57, 1, 15);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (13, 66, 1, 26);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (22, 87, 2, 78);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (33, 7, 3, 51);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (23, 33, 3, 52);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (11, 39, 2, 5);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 25, 3, 95);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (32, 30, 2, 77);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (28, 67, 2, 65);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (9, 65, 1, 85);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (14, 5, 2, 47);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (17, 58, 2, 92);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (34, 96, 1, 17);
INSERT INTO exams(student_id, subject_professor_year_id, type_id, points)
VALUES (21, 17, 3, 85);
