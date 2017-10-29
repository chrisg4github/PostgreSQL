/* Select name, salary and department from staff table */
select
   last_name,
   salary,
   department
from
   staff;

/* Use an alias on table names so that one table can be queried in */
/* subqueries and top level queries */
select
   s1.last_name,
   s1.salary,
   s1.department
from
   staff s1;

-- use s2 in the subquery
-- show the last name, salary, department of the current row and then get the rounded average from the staff table for the particular department we're looking at in the row
select
  s1.last_name,
  s1.salary,
  s1.department,
  (select round(avg(salary)) from staff s2 where s1.department = s2.department) dept_avg
from
  staff s1;

-- using a sub query where we'd normally use a table name
  -- Find the average of executive salaries, defined as salaries > 100,000
  select
     department,
     round(avg(salary))
  from
      (select
           s2.department,
           s2.salary
       from
           staff s2
       where
           salary > 100000) s1
  group by
      department;


-- use a subquery in the where clause
select
  s1.department
from
  staff s1
where
  (select max(salary) from staff s2) = salary;

-- use a subquery in where

select
  s1.department
from
  staff s1
where id in 
  (
    -- you can include a select here but it needs to return staff ids
  );