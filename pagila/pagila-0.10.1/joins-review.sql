DROP DATABASE IF EXISTS joins_db;

CREATE DATABASE joins_db;
\connect joins_db

DROP TABLE IF EXISTS students, country_visits, skills, powers;

CREATE TABLE students(
id SERIAL PRIMARY KEY,
name VARCHAR(255),
hobby VARCHAR(255),
favorite_nickleback_song VARCHAR(255)
);

CREATE TABLE country_visits (
id SERIAL PRIMARY KEY,
student_id INTEGER references students(id),
num_countries_visited INTEGER
);

CREATE TABLE skills (
id SERIAL PRIMARY KEY,
student_id INTEGER references students(id),
skill VARCHAR(255)
);

CREATE TABLE powers (
id SERIAL PRIMARY KEY,
student_id INTEGER references students(id),
power VARCHAR(255)
);

-- do not do references students(id),
CREATE TABLE pets (
id SERIAL PRIMARY KEY,
student_id INTEGER,
pet_name VARCHAR(255)
);






CREATE TABLE technologies (
id SERIAL PRIMARY KEY,
tech VARCHAR(255)
);

INSERT INTO students (name, hobby, favorite_nickleback_song) VALUES('Angela','sleeping','Trying Not to Love You');

INSERT INTO students (name, hobby, favorite_nickleback_song) VALUES('Anu','tennis','Rock Star');
INSERT INTO students (name, hobby, favorite_nickleback_song) VALUES('Chris','golf','Wide Awake');
INSERT INTO students (name, hobby, favorite_nickleback_song) VALUES('Shafali','traveling','Malibu');

INSERT INTO country_visits (student_id, num_countries_visited) VALUES( 1, 4);
INSERT INTO country_visits (student_id, num_countries_visited) VALUES( 2, 6);
INSERT INTO country_visits (student_id, num_countries_visited) VALUES( 3, 1);
INSERT INTO country_visits (student_id, num_countries_visited) VALUES( 4, 4);

INSERT INTO skills (student_id, skill) VALUES (1, 'typing');
INSERT INTO skills (student_id, skill) VALUES (2, 'Excel');
INSERT INTO skills (student_id, skill) VALUES (3, 'database');
INSERT INTO skills (student_id, skill) VALUES (4, 'dreaming');

INSERT INTO powers (student_id, power) VALUES (1, 'can stand on 1 foot while writing sql');
INSERT INTO powers (student_id, power) VALUES (4, 'can sing any taylor swift song while juggling');

INSERT INTO pets (student_id, pet_name) VALUES (2, 'crocodile named fred');
INSERT INTO pets (student_id, pet_name) VALUES (3, 'pterodactyl named tina');
INSERT INTO pets (student_id, pet_name) VALUES (7, 'cat named pranav');

INSERT INTO technologies (tech) VALUES ('Python');
INSERT INTO technologies (tech) VALUES ('Pandas');
INSERT INTO technologies (tech) VALUES ('JavaScript');
INSERT INTO technologies (tech) VALUES ('SQL');
