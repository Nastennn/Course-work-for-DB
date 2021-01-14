DROP TABLE IF EXISTS character_roles CASCADE;
DROP TABLE IF EXISTS characters CASCADE;
DROP TABLE IF EXISTS exams CASCADE;
DROP TABLE IF EXISTS exam_types CASCADE;
DROP TABLE IF EXISTS faculties CASCADE;
DROP TABLE IF EXISTS places CASCADE;
DROP TABLE IF EXISTS professors CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS schedule CASCADE;
DROP TABLE IF EXISTS subjects CASCADE;
DROP TABLE IF EXISTS staff CASCADE;
DROP TABLE IF EXISTS locations CASCADE;


CREATE TABLE characters
(
    id            serial PRIMARY KEY,
    name          text NOT NULL UNIQUE,
    date_of_birth date,
    password      text NOT NULL,
    sid           text UNIQUE,
    username      text NOT NULL UNIQUE
);

CREATE TABLE roles
(
    id   serial PRIMARY KEY,
    name varchar(20) NOT NULL
);

CREATE TABLE character_roles
(
    role_id      int
        REFERENCES roles
            ON UPDATE CASCADE,
    character_id int
        REFERENCES characters
            ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (role_id, character_id)
);

CREATE TABLE locations
(
    id   serial PRIMARY KEY,
    name varchar(30) NOT NULL UNIQUE
);

CREATE TABLE places
(
    id          serial PRIMARY KEY,
    name        text NOT NULL,
    location_id int
                     REFERENCES locations
                         ON UPDATE CASCADE ON DELETE SET NULL,
    capacity    integer CHECK ( capacity > 0 )
);

CREATE TABLE faculties
(
    id   serial PRIMARY KEY,
    name varchar(15) NOT NULL UNIQUE
);

CREATE TABLE staff
(
    id           serial PRIMARY KEY,
    character_id int
        REFERENCES characters
            ON UPDATE CASCADE ON DELETE CASCADE,
    place_id     int
        REFERENCES places
            ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE subjects
(
    id     serial PRIMARY KEY,
    name   text    NOT NULL,
    year   int     NOT NULL CHECK ( year >= 1 AND year <= 7 ),
    chosen boolean NOT NULL
);

CREATE TABLE professors
(
    id           serial PRIMARY KEY,
    character_id int
        REFERENCES characters
            ON UPDATE CASCADE ON DELETE CASCADE,
    subject_id   int UNIQUE
        REFERENCES subjects
            ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE students
(
    id           serial PRIMARY KEY,
    character_id int
        REFERENCES characters
            ON UPDATE CASCADE ON DELETE CASCADE,
    year         int NOT NULL CHECK ( year >= 1 AND year <= 7 ),
    points       int DEFAULT 0,
    faculty_id   int NOT NULL
        REFERENCES faculties
            ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE schedule
(
    id         serial PRIMARY KEY,
    day        varchar(15) NOT NULL,
    subject_id int         NOT NULL
        REFERENCES subjects
            ON UPDATE CASCADE ON DELETE CASCADE,
    time       time        NOT NULL,
    place_id   int
                           REFERENCES places
                               ON UPDATE CASCADE ON DELETE SET NULL,
    UNIQUE (day, time, place_id)
);

CREATE TABLE exam_types
(
    id   serial PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE exams
(
    id         serial PRIMARY KEY,
    student_id int NOT NULL
        REFERENCES students (id)
            ON UPDATE CASCADE ON DELETE CASCADE,
    type_id    int NOT NULL
        REFERENCES exam_types
            ON UPDATE CASCADE,
    subject_id int NOT NULL
        REFERENCES subjects
            ON UPDATE CASCADE,
    points     int NOT NULL
);

CREATE OR REPLACE FUNCTION ins_character(n text, dob date, un text, p text)
    RETURNS void
    LANGUAGE plpgsql AS
$$
BEGIN
    INSERT INTO characters (name, date_of_birth, username, password) VALUES (n, dob, un, p);
END;
$$;

CREATE OR REPLACE FUNCTION del_character(n text, dob date)
    RETURNS void
    LANGUAGE plpgsql AS
$$
BEGIN
    DELETE FROM characters WHERE (name, date_of_birth) = (n, dob);
END
$$;

CREATE OR REPLACE FUNCTION add_student(n text, un text, dob date, y int, f varchar)
    RETURNS void
    LANGUAGE plpgsql AS
$$
BEGIN
    INSERT INTO characters (name, username, date_of_birth, password) VALUES (n, un, dob, 'password');
    INSERT INTO character_roles (role_id, character_id)
    VALUES (2, (
        SELECT id
        FROM characters
        WHERE name = n
          AND date_of_birth = dob));
    INSERT INTO students (character_id, year, faculty_id)
    VALUES ((
                SELECT id
                FROM characters
                WHERE name = n
                  AND date_of_birth = dob
            ),
            y,
            (SELECT id FROM faculties WHERE name = f));
END
$$;

CREATE OR REPLACE FUNCTION add_staff(n text, dob date, pl_name text, un text, p text)
    RETURNS void
    LANGUAGE plpgsql AS
$$
BEGIN
    INSERT INTO characters (name, date_of_birth, username, password) VALUES (n, dob, un, p);
    INSERT INTO character_roles (role_id, character_id)
    VALUES (3, (
        SELECT id
        FROM characters
        WHERE name = n
          AND date_of_birth = dob));
    INSERT INTO staff (character_id, place_id)
    VALUES ((
                SELECT id
                FROM characters
                WHERE name = n
                  AND date_of_birth = dob
            ), (
                SELECT places.id
                FROM places
                         JOIN locations ON places.location_id = locations.id
                WHERE places.name = pl_name
            ));
END
$$;

CREATE OR REPLACE FUNCTION find_student(n text)
    RETURNS table
            (
                name text,
                year int
            )
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY
        SELECT characters.name, students.year
        FROM characters
                 JOIN students ON characters.id = students.character_id
        WHERE characters.name = n;
END
$$;

CREATE OR REPLACE FUNCTION add_professor(n text, dob date, subj int)
    RETURNS void
    LANGUAGE plpgsql AS
$$
DECLARE
    char_id int;
BEGIN
    INSERT INTO characters (name, date_of_birth) VALUES (n, dob);
    char_id = (
        SELECT id
        FROM characters
        WHERE name = n
          AND date_of_birth = dob
    );
    INSERT INTO character_roles (role_id, character_id)
    VALUES (3, char_id);
    INSERT INTO professors (character_id, subject_id)
    VALUES (char_id, subj);
END
$$;

CREATE OR REPLACE FUNCTION add_professor_subject(char_id int, subj int)
    RETURNS void
    LANGUAGE plpgsql AS
$$
BEGIN
    IF EXISTS(
            SELECT *
            FROM professors
            WHERE character_id = char_id
              AND subject_id = subj
        ) THEN
        RETURN;
    END IF;
    INSERT INTO professors (character_id, subject_id)
    VALUES (char_id, subj);
END
$$;

CREATE OR REPLACE FUNCTION add_points(n text, p int)
    RETURNS void
    LANGUAGE plpgsql AS
$$
BEGIN
    UPDATE students
    SET points = points + p
    WHERE id = (SELECT id FROM characters WHERE name = n);
END
$$;

CREATE OR REPLACE FUNCTION drop_points()
    RETURNS void
    LANGUAGE plpgsql AS
$$
BEGIN
    UPDATE students SET points=0;
END
$$;

CREATE OR REPLACE FUNCTION remove_points(n text, p int)
    RETURNS void
    LANGUAGE plpgsql AS
$$
BEGIN
    UPDATE students
    SET points=points - p
    WHERE id = (SELECT id FROM characters WHERE name = n);
END
$$;

-- ROLES
INSERT INTO roles(name)
VALUES ('персонал');
INSERT INTO roles(name)
VALUES ('студент');
INSERT INTO roles(name)
VALUES ('преподаватель');
INSERT INTO roles(name)
VALUES ('директор');
-- FACULTIES
INSERT INTO faculties(name)
VALUES ('Гриффиндор');
INSERT INTO faculties(name)
VALUES ('Слизерин');
INSERT INTO faculties(name)
VALUES ('Пуффендуй');
INSERT INTO faculties(name)
VALUES ('Когтевран');
-- EXAM_TYPES
INSERT INTO exam_types(name)
VALUES ('ЖАБА');
INSERT INTO exam_types(name)
VALUES ('СОВ');
INSERT INTO exam_types(name)
VALUES ('годовой');
-- LOCATIONS
INSERT INTO locations (name)
VALUES ('замок Хогвартс');
INSERT INTO locations (name)
VALUES ('территория Хогвартса');
INSERT INTO locations (name)
VALUES ('Хогсмид');

-- PLACES
INSERT INTO places(name, location_id, capacity)
VALUES ('больничное крыло', 1, 100);
INSERT INTO places(name, location_id, capacity)
VALUES ('кафе мадам Паддифут', 3, 50);
INSERT INTO places(name, location_id)
VALUES ('запретный лес', 2);
INSERT INTO places(name, location_id, capacity)
VALUES ('хижина Хагрида', 2, 10);
INSERT INTO places(name, location_id, capacity)
VALUES ('теплицы Хогвартса', 2, 35);
INSERT INTO places(name, location_id, capacity)
VALUES ('квиддичный стадион', 2, 10000);
INSERT INTO places(name, location_id, capacity)
VALUES ('астрономический читальный зал', 1, 300);
INSERT INTO places(name, location_id, capacity)
VALUES ('внутренний двор', 1, 3000);
INSERT INTO places(name, location_id, capacity)
VALUES ('кабинет 11', 1, 30);
INSERT INTO places(name, location_id, capacity)
VALUES ('класс заклинаний', 1, 30);
INSERT INTO places(name, location_id, capacity)
VALUES ('класс Защиты от Тёмных искусств', 1, 30);
INSERT INTO places(name, location_id, capacity)
VALUES ('класс зельеварения', 1, 30);
INSERT INTO places(name, location_id, capacity)
VALUES ('класс изучения древних рун', 1, 30);
INSERT INTO places(name, location_id, capacity)
VALUES ('класс истории магии', 1, 30);
INSERT INTO places(name, location_id, capacity)
VALUES ('класс музыки', 1, 200);
INSERT INTO places(name, location_id, capacity)
VALUES ('класс прорицаний', 1, 30);
INSERT INTO places(name, location_id, capacity)
VALUES ('класс травологии', 1, 30);
INSERT INTO places(name, location_id, capacity)
VALUES ('класс трансфигурации', 1, 50);
INSERT INTO places(name, location_id, capacity)
VALUES ('класс ухода за магическими существами', 1, 30);
INSERT INTO places(name, location_id, capacity)
VALUES ('астрономическая башня', 1, 60);
INSERT INTO places(name, location_id, capacity)
VALUES ('поле для тренировок', 2, 600);
INSERT INTO places(name, location_id, capacity)
VALUES ('класс Флоренца', 1, 30);
INSERT INTO places(name, location_id, capacity)
VALUES ('большой зал', 1, 500);
INSERT INTO places (name, location_id, capacity)
VALUES ('кухня Хогвартса', 1, 150);
INSERT INTO places (name, location_id, capacity)
VALUES ('библиотека', 1, 500);
INSERT INTO places (name, location_id, capacity)
VALUES ('Хогвартс', 1, NULL);
-- CHARACTERS
INSERT INTO characters(id, name, date_of_birth, username, password)
VALUES (1, 'Минерва Макгонагалл', '1935-10-4', 'minerva', 'password');
INSERT INTO characters(id, name, date_of_birth, username, password)
VALUES (2, 'Римус Люпин', '1960-3-10', 'lupin', 'password');
INSERT INTO characters(id, name, username, password)
VALUES (3, 'Валерия Мириадд', 'miriadd', 'password');
INSERT INTO characters(id, name, username, password)
VALUES (4, 'Аластор Грюм', 'grum', 'password');
INSERT INTO characters(id, name, date_of_birth, username, password)
VALUES (5, 'Рубеус Хагрид', '1928-12-06', 'hagrid', 'password');
INSERT INTO characters(id, name, date_of_birth, username, password)
VALUES (6, 'Северус Снегг', '1960-1-9', 'snegg', 'password');
INSERT INTO characters(id, name, date_of_birth, username, password)
VALUES (7, 'Патриция Рейкпик', '1955-05-12', 'raykpick', 'password');
INSERT INTO characters(id, name, date_of_birth, username, password)
VALUES (8, 'Альбус Дамблдор', '1881-07-10', 'headmaster', 'password');
-- CHARACTER_ROLES
INSERT INTO character_roles(role_id, character_id)
VALUES ('3', '1');
INSERT INTO character_roles(role_id, character_id)
VALUES ('3', '2');
INSERT INTO character_roles(role_id, character_id)
VALUES ('3', '3');
INSERT INTO character_roles(role_id, character_id)
VALUES ('3', '4');
INSERT INTO character_roles(role_id, character_id)
VALUES ('3', '5');
INSERT INTO character_roles(role_id, character_id)
VALUES ('3', '6');
INSERT INTO character_roles(role_id, character_id)
VALUES ('3', '7');
INSERT INTO character_roles(role_id, character_id)
VALUES ('4', '8');
-- STUDENTS
INSERT INTO students(id, character_id, year, points, faculty_id)
VALUES (1, 1, 1, 10, 1);
INSERT INTO students(id, character_id, year, points, faculty_id)
VALUES (2, 2, 2, 11, 2);
INSERT INTO students(id, character_id, year, points, faculty_id)
VALUES (3, 3, 3, 12, 3);
INSERT INTO students(id, character_id, year, points, faculty_id)
VALUES (4, 4, 4, 16, 4);
INSERT INTO students(id, character_id, year, points, faculty_id)
VALUES (5, 5, 5, 75, 1);
INSERT INTO students(id, character_id, year, points, faculty_id)
VALUES (6, 6, 6, 4, 2);
INSERT INTO students(id, character_id, year, points, faculty_id)
VALUES (7, 7, 7, 32, 3);
-- SUBJECTS
INSERT INTO subjects(name, year, chosen)
VALUES ('Зельеварение', '1', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Зельеварение', '2', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Зельеварение', '3', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Зельеварение', '4', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Зельеварение', '5', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Зельеварение', '6', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('Зельеварение', '7', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('Трансфигурация', '1', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Трансфигурация', '2', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Трансфигурация', '3', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Трансфигурация', '4', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Трансфигурация', '5', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Трансфигурация', '6', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('Трансфигурация', '7', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('Заклинания', '1', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Заклинания', '2', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Заклинания', '3', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Заклинания', '4', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Заклинания', '5', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Защита от Темных Искусств', '1', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Защита от Темных Искусств', '2', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Защита от Темных Искусств', '3', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Защита от Темных Искусств', '4', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Защита от Темных Искусств', '5', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Травология', '1', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Травология', '2', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Травология', '3', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Травология', '4', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Травология', '5', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Травология', '6', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Уход за магическими существами', '3', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('Уход за магическими существами', '4', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('Уход за магическими существами', '5', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('Прорицания', '3', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('Прорицания', '4', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('Прорицания', '5', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('Древние руны', '3', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('Древние руны', '4', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('Древние руны', '5', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('Астрономия', '1', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Астрономия', '2', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Астрономия', '3', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Астрономия', '4', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Астрономия', '5', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Астрономия', '6', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('Астрономия', '7', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('История магии', '1', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('История магии', '2', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('История магии', '3', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('История магии', '4', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('История магии', '5', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Полёты на мётлах', '1', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Полёты на мётлах', '2', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Полёты на мётлах', '3', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Полёты на мётлах', '4', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Полёты на мётлах', '5', 'false');
INSERT INTO subjects(name, year, chosen)
VALUES ('Курс трансгрессии', '6', 'true');
INSERT INTO subjects(name, year, chosen)
VALUES ('Курс трансгрессии', '7', 'true');
-- EXAMS
INSERT INTO exams (student_id, type_id, subject_id, points)
VALUES (2, 3, 1, 100);
INSERT INTO exams (student_id, type_id, subject_id, points)
VALUES (1, 3, 8, 80);
INSERT INTO exams (student_id, type_id, subject_id, points)
VALUES (1, 3, 15, 90);
INSERT INTO exams (student_id, type_id, subject_id, points)
VALUES (1, 3, 20, 86);
INSERT INTO exams (student_id, type_id, subject_id, points)
VALUES (1, 3, 40, 74);
INSERT INTO exams (student_id, type_id, subject_id, points)
VALUES (6, 3, 25, 100);
INSERT INTO exams (student_id, type_id, subject_id, points)
VALUES (1, 3, 1, 100);
-- PROFESSORS
INSERT INTO professors(character_id, subject_id)
VALUES (1, 8);
INSERT INTO professors(character_id, subject_id)
VALUES (1, 9);
INSERT INTO professors(character_id, subject_id)
VALUES (1, 10);
INSERT INTO professors(character_id, subject_id)
VALUES (1, 11);
INSERT INTO professors(character_id, subject_id)
VALUES (1, 12);
INSERT INTO professors(character_id, subject_id)
VALUES (1, 13);
INSERT INTO professors(character_id, subject_id)
VALUES (1, 14);
-- SCHEDULE
INSERT INTO schedule (day, subject_id, time, place_id)
VALUES ('понедельник', 25, '8:00', 5);
INSERT INTO schedule (day, subject_id, time, place_id)
VALUES ('вторник', 26, '8:00', 5);
INSERT INTO schedule (day, subject_id, time, place_id)
VALUES ('понедельник', 27, '10:00', 5);
INSERT INTO schedule (day, subject_id, time, place_id)
VALUES ('понедельник', 28, '12:00', 5);
INSERT INTO schedule (day, subject_id, time, place_id)
VALUES ('вторник', 29, '10:00', 5);
INSERT INTO schedule (day, subject_id, time, place_id)
VALUES ('вторник', 30, '12:00', 5);

-- STAFF
SELECT SETVAL('characters_id_seq', (SELECT MAX(id) FROM characters));
SELECT SETVAL('students_id_seq', (SELECT MAX(id) FROM students));
INSERT INTO staff(character_id, place_id)
VALUES (5, 4);
select add_staff('Винки', '1967-6-15', 'кухня Хогвартса', 'winky', 'password');
select add_staff('Добби', '1965-6-28', 'кухня Хогвартса', 'dobby', 'password');
select add_staff('Ирма Пинс', '1947-8-13', 'библиотека', 'irmapince', 'password');
select add_staff('Питтс', '1970-11-19', 'кухня Хогвартса', 'pitts', 'password');

select add_staff('Поппи Помфри', '1940-3-20', 'больничное крыло', 'poppypomfrey', 'password');
select add_staff('Аглая Уайнскотт', '1970-2-10', 'больничное крыло', 'aglayawainscott', 'password');
select add_staff('Мария Марон', '1975-5-11', 'больничное крыло', 'mariamarron', 'password');
select add_staff('Ксения Ульянова', '1975-9-3', 'больничное крыло', 'kseniyaulyanova', 'password');
select add_staff('Линдси Койзи', '1963-6-28', 'больничное крыло', 'lindseycozy', 'password');
select add_staff('Финея Лакур', '1951-11-24', 'больничное крыло', 'finealacur', 'password');

select add_staff('Аргус Филч', '1952-7-18', 'Хогвартс', 'argusfilch', 'password');
-- STUDENTS
select add_student('Сэм Морондо', 'morondo', '1980-10-16', 1, varchar 'Слизерин');
select add_student('Дэн Фердинанд', 'ferdinand', '1980-09-01', 1, varchar 'Гриффиндор');
select add_student('Ксения Вап', 'vap', '1980-02-10', 1, varchar 'Когтевран');
select add_student('Оливия Вайт', 'white', '1980-12-05', 1, varchar 'Пуффендуй');
select add_student('Сара Земнухова', 'zemnuhova', '1979-05-07', 2, varchar 'Гриффиндор');
select add_student('Даниель Свон', 'svon', '1979-08-23', 2, varchar 'Слизерин');
select add_student('Робби Синец', 'sinec', '1979-11-21', 2, varchar 'Пуффендуй');
select add_student('Джон Вараццо', 'varacco', '1979-01-03', 2, varchar 'Когтевран');
select add_student('Сэм Зирис', 'ziris', '1978-07-15', 3, varchar 'Гриффиндор');
select add_student('Михаил Вольнис', 'volnis', '1978-12-26', 3, varchar 'Пуффендуй');
select add_student('Агата Дро', 'user1', '1978-06-22', 3, varchar 'Когтевран');
select add_student('Анна Фауль', 'user2', '1978-10-23', 3, varchar 'Слизерин');
select add_student('Кирилл Крески', 'user3', '1977-02-12', 4, varchar 'Слизерин');
select add_student('Аглая Фивуальеро', 'user4', '1977-12-24', 4, varchar 'Пуффендуй');
select add_student('Семен Новиков', 'user5', '1977-05-11', 4, varchar 'Гриффиндор');
select add_student('Денис Валиев', 'user7', '1977-06-03', 4, varchar 'Когтевран');
select add_student('Ян Петренко', 'user8', '1976-03-08', 5, varchar 'Слизерин');
select add_student('Варвара Сэлф', 'user9', '1976-10-20', 5, varchar 'Гриффиндор');
select add_student('Владимир Ацкев', 'user10', '1976-07-18', 5, varchar 'Пуффендуй');
select add_student('Аллан Родимич', 'user11', '1976-04-30', 5, varchar 'Когтевран');
select add_student('Дерина Солли', 'user12', '1975-12-25', 6, varchar 'Когтевран');
select add_student('Николас Бракон', 'user13', '1975-06-16', 6, varchar 'Пуффендуй');
select add_student('Денис Арован', 'user14', '1975-02-01', 6, varchar 'Гриффиндор');
select add_student('Пегги Мэнсон', 'user15', '1975-05-14', 6, varchar 'Слизерин');
select add_student('Натали Далонс', 'user16', '1974-06-06', 7, varchar 'Гриффиндор');
select add_student('Сара Дигинс', 'user17', '1974-08-07', 7, varchar 'Слизерин');
select add_student('Мария Краланс', 'user18', '1974-12-03', 7, varchar 'Пуффендуй');
select add_student('Опра Маффон', 'user19', '1974-04-23', 7, varchar 'Когтевран');


CREATE INDEX join_prof ON professors (character_id);
CREATE INDEX join_staff ON staff (character_id);
CREATE INDEX join_stud ON students (character_id);

CREATE OR REPLACE FUNCTION add_exam_points()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS
$$
BEGIN

    IF NEW.points != OLD.points THEN
        UPDATE students
        SET points = OLD.points + NEW.points
        WHERE new.student_id = students.id;
    END IF;

    RETURN NEW;
END;
$$;


CREATE TRIGGER check_related_tables
    AFTER INSERT OR UPDATE
    ON exams
    FOR EACH ROW
EXECUTE PROCEDURE add_exam_points();

CREATE OR REPLACE FUNCTION add_schedule()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS
$$
DECLARE
    people_counter int;
BEGIN
    people_counter = (
        SELECT COUNT(*)
        FROM students
        WHERE year = (
            SELECT year
            FROM subjects
            WHERE subjects.id = new.subject_id
        )
    );
    IF people_counter > (SELECT capacity FROM places WHERE id = new.place_id) THEN
        RAISE 'Not enough capacity of the place';
    END IF;
    RETURN new;
END;
$$;

CREATE TRIGGER check_place
    BEFORE INSERT OR UPDATE
    ON schedule
    FOR EACH ROW
EXECUTE PROCEDURE add_schedule();
