--get all records for year 2008 and month 5
select date_trunc('month', start_date) as date
from staff
where date_trunc('month', start_date) = '2008-04-01 00:00:00-05';

--SELECT PARTS OF A DATE
select * from staff s
where date_part('month', s.start_date) = '10'
limit 10