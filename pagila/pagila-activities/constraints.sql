--With Constraints you can make sure your data in the database is clean


--https://www.postgresql.org/docs/9.1/static/datatype-numeric.html
CREATE TABLE employees (
 id serial PRIMARY KEY,
 first_name VARCHAR (50),
 last_name VARCHAR (50),
 birth_date DATE CHECK (birth_date > '1900-01-01'),
 joined_date DATE CHECK (joined_date > birth_date),
 salary numeric CHECK(salary > 0)
);

	INSERT INTO employees (first_name, last_name, birth_date, joined_date, salary ) VALUES ('John', 'Doe', '1972-01-01', '2015-07-01', -100000)

		--[Err] ERROR:  new row for relation "employees" violates check constraint "employees_salary_check"
		--DETAIL:  Failing row contains (1, John, Doe, 1972-01-01, 2015-07-01, -100000).

--NOT NULL
	CREATE TABLE prices_list (
	 id serial PRIMARY KEY,
	 product_id INT NOT NULL,
	 price NUMERIC NOT NULL,
	 discount NUMERIC NOT NULL,
	 valid_from DATE NOT NULL,
	 valid_to DATE NOT NULL
	);

	-- instead of doing a CHECK at the table level
	-- you can ALTER a table and add a named CHECK (called a CONSTRAINT) after the table was created
	ALTER TABLE prices_list ADD CONSTRAINT price_discount_check CHECK (
	 price > 0
	 AND discount >= 0
	 AND price > discount
	);




-- making a column UNIQUE

	CREATE TABLE person (
	 id serial PRIMARY KEY,
	 first_name VARCHAR (50),
	 last_name VARCHAR (50),
	 email VARCHAR (50) UNIQUE
	);

	CREATE TABLE person (
	 id SERIAL  PRIMARY KEY,
	 first_name VARCHAR (50),
	 last_name  VARCHAR (50),
	 email      VARCHAR (50),
	 UNIQUE(email) --with this way you can add the UNIQUE CONSTRAINT on multiple columns
	);


CREATE TABLE users (
 id serial PRIMARY KEY,
 username VARCHAR (50),
 password VARCHAR (50),
 email VARCHAR (50),
 CONSTRAINT username_email_notnull CHECK (
	 (
	 username IS NOT NULL
	 AND email IS NULL
	 )
	 OR (
	 username IS NULL
	 AND email IS NOT NULL
	 )
 )
);

INSERT INTO users (username, email, password) VALUES ('a', NULL,'a');

INSERT INTO users (username, email, password) VALUES (NULL, 'a','a');

	--after the fact
		ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;
