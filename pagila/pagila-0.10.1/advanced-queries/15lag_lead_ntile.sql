
/*  Use lag to reference rows behind */
select
   department,
   salary,
   lag(salary) over (partition by department order by salary desc)
from
   staff

/* Use lead to reference rows ahead */
select
   department,
   salary,
   lead(salary) over (partition by department order by salary desc)
from
   staff

/* Use ntiles to assign "buckets" to rows */
/* Include quartiles in list of salaries by department */
--this will break each staff member up by department and list whether they're paid low, paid ok, paid well, paid excellent relative their industry 
select
   department,
   salary,
   ntile(4) over (partition by department order by salary asc) as quartile
from
   staff;

-- this one does the samething but it's not broken up by department
select
   department,
   salary,
   ntile(4) over (order by salary asc) as quartile
from
   staff;
