--create a table
CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    acronym VARCHAR(255),
    loc_team VARCHAR(255),
    loc VARCHAR(255),
    team VARCHAR(255)
);

--
\copy teams(acronym, loc_team, loc, team) FROM '../csvs/teams_locations_acronyms.csv' DELIMITER ',' CSV HEADER;

--copy a table to a csv including the header (remove HEADER to not include it in the csv)
COPY persons TO 'C:\tmp\persons_db.csv' DELIMITER ',' CSV HEADER;

--copy certain columns from a table to a csv with the header
COPY persons(first_name,last_name,email) 
TO 'C:\tmp\persons_partial_db.csv' DELIMITER ',' CSV HEADER;

--copy the results of a query to a csv 
\copy (SELECT * FROM persons) to 'C:\tmp\persons_client.csv' with csv












