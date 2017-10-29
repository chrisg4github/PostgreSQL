--https://www.w3resource.com/PostgreSQL/postgresql-similar-operator.php

--https://www.postgresql.org/docs/9.0/static/functions-matching.html

/* Select list of unique job titles */
select distinct
    job_title
from
    staff;

/* Select lis of job titles that begin wiht Assistant */
select distinct
    job_title
from
    staff
where
   job_title like 'Assistant%';


 select 'xyz' SIMILAR TO 'xyz';      
 select 'xyz' SIMILAR TO 'x';     

-- Parentheses () can be used to group items into a single logical item
select 'xyz' SIMILAR TO '%(y|a)%';  
select 'xyz' SIMILAR TO '(y|z)%';   
select 'xzaddf' SIMILAR TO '%(y|a|l)%';   





-- Select a list of job titles that include Assistant II or IV

-- | is the regular expression OR operator

-- Parentheses () can be used to group items into a single logical item

select distinct
    job_title
from
    staff
where
   job_title similar to '%Assistant%(II|IV)';



--An underscore (_) in pattern stands for (matches) any single character

select distinct
    job_title
from
    staff
where
   job_title similar to '%Assistant I_';

/* Select a list of job titles that begin with E, P, or S */
/* |[] are used to list characters that can match */
--a percent sign (%) matches any sequence of zero or more characters.
select distinct
    job_title
from
    staff
where
   job_title similar to '[EPS]%';


--Get all the job titles which do not end in  II, III, IV or V
--^ means not this
select distinct
job_title
from
staff
where
job_title similar to '%[^II][^III][^IV][^V]';


-- get jobs that end in er
  --\M matches only at the end of a word
  -- ~: case-sensitive regular expression match.
  -- ~*: case-insensitive regular expression match.
    SELECT DISTINCT job_title
    FROM staff
    WHERE job_title ~* 'er\M';

      --the above is the same as
      SELECT DISTINCT job_title
      FROM staff
      WHERE job_title SIMILAR TO '%er\M';

-- does not include the word Human in the job title
  -- ~: case-sensitive regular expression match.
  select distinct
     job_title
  from
     staff
  where
    job_title !~ 'Human';

select distinct
    job_title
from
    staff
where
   job_title similar to ‘[EPS][nl]%‘;

-- select job title that contains Developer and 'I' appears 0 to 3 times
select distinct
    job_title
from
    staff
where
   job_title similar to '%Developer%[I]{0,3}';

select distinct job_title
from staff
where job_title similar to '(A%){2}'