http://www.postgresqltutorial.com/postgresql-alter-table/

--adding a column
	ALTER TABLE students ADD COLUMN active boolean;

	SELECT * FROM students;

--dropping a column
	ALTER TABLE students DROP COLUMN active;

	SELECT * FROM students;

--renaming a column
	ALTER TABLE students ADD COLUMN active boolean;

	ALTER TABLE students RENAME COLUMN active TO awake;

	SELECT * FROM students;

-- setting a default value after the fact
	ALTER TABLE students ADD COLUMN grade varchar(10);

	ALTER TABLE students ALTER COLUMN grade
	SET DEFAULT 'A';

	SELECT * FROM students;

	INSERT INTO students (name, hobby, favorite_nickleback_song) VALUES('Pavan', 'sleeping', 'Rock Star');

	INSERT INTO students (name, hobby, favorite_nickleback_song, grade) VALUES('Dan', 'sleeping', 'Rock Star', 'A+');

	select * from students WHERE grade IS NOT NULL;

	select * from students WHERE grade IS NULL;
