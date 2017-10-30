--unions-intersects

-- in joins db

SELECT * FROM pets;

SELECT * FROM powers;

SELECT student_id
FROM pets
UNION
SELECT student_id
FROM powers
ORDER BY student_id;

SELECT student_id
FROM pets
INTERSECT
SELECT student_id
FROM powers
ORDER BY student_id;

SELECT * FROM students WHERE id IN (SELECT student_id
FROM pets
UNION
SELECT student_id
FROM powers
ORDER BY student_id);