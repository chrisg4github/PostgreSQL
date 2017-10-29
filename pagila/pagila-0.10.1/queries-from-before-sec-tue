SELECT * from students LIMIT 3;


SELECT * from students LIMIT 3 OFFSET 1;

DELETE FROM students WHERE id = 2;
--ERROR:  update or delete on table "students" violates foreign key constraint "country_visits_student_id_fkey" on table "country_visits"
DETAIL:  Key (id)=(2) is still referenced from table "country_visits".

DELETE FROM country_visits WHERE student_id = 2;

DELETE FROM skills WHERE student_id = 2;

DELETE FROM students WHERE id = 2;

SELECT * 
FROM actor
WHERE last_name = 'GUINESS'
ORDER BY first_name ASC;
-- DESC

--order this by first_name 
--last name to be either GUINESS or CRUZ
SELECT * 
FROM actor
WHERE last_name = 'GUINESS' OR last_name = 'CRUZ'
ORDER BY first_name ASC;

--order this by first_name 
--last name to be either GUINESS or CRUZ
SELECT * 
FROM actor
WHERE last_name in ('GUINESS', 'CRUZ')
ORDER BY first_name ASC;

-- select all the actors with an id of 1, 5, 7, 9, 45
SELECT * 
FROM actor
WHERE actor_id IN (1,5,7,9,45)
ORDER BY first_name ASC;

-- select all the actors with an id of 1, 5, 7, 9, 45
SELECT * 
FROM actor
WHERE actor_id = 1 OR actor_id = 5 OR actor_id = 7 OR actor_id = 9 OR actor_id = 45
ORDER BY first_name ASC;

SELECT *
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id;

SELECT a.*, fa.film_id
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id;

SELECT a.*, fa.film_id
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id
LEFT JOIN film f
ON f.film_id = fa.film_id;

SELECT a.*, fa.film_id, f.title, f.description
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id
LEFT JOIN film f
ON f.film_id = fa.film_id;

CREATE OR REPLACE VIEW actors_and_films AS
SELECT a.*, fa.film_id, f.title, f.description
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id
LEFT JOIN film f
ON f.film_id = fa.film_id;

SELECT * FROM actors_and_films WHERE last_name = 'GUINESS';

SELECT * FROM payment;

SELECT p.*, c.first_name AS customer_first_name, s.first_name AS staff_first_name, f.title AS film_title, f.description AS film_description, a.first_name AS actor_first_name, a.last_name AS actor_lastname
FROM payment p
LEFT JOIN customer c
ON p.customer_id = c.customer_id
LEFT JOIN staff s
ON p.staff_id = s.staff_id
LEFT JOIN rental r
ON p.rental_id = r.rental_id
LEFT JOIN inventory inv
ON inv.inventory_id = r.inventory_id
LEFT JOIN film_actor fa
ON fa.film_id = inv.film_id
LEFT JOIN film f
ON f.film_id = fa.film_id
LEFT JOIN actor a
ON a.actor_id = fa.actor_id;

 
--QUESTION 1
-- get the me the number of transactions each staff member served
-- things to look up with your partners: group by, count

--QUESTION 2
-- get me all the customers and how much they've spent in total on rentals
-- things to look up with your partners: group by, SUM (edited)


--question 1 answer:

SELECT p.staff_id, COUNT(p.staff_id)
FROM payment p
LEFT JOIN customer c
ON p.customer_id = c.customer_id
LEFT JOIN staff s
ON p.staff_id = s.staff_id
LEFT JOIN rental r
ON p.rental_id = r.rental_id
LEFT JOIN inventory inv
ON inv.inventory_id = r.inventory_id
LEFT JOIN film f
ON f.film_id = inv.film_id
GROUP BY p.staff_id;


--Question 1 another way

Select s.staff_id,s.first_name,s.last_name,count(c.customer_id)
from staff as s
inner join payment as p
on s.staff_id = p.staff_id
inner join customer as c
on c.customer_id = p.customer_id
group by s.staff_id,s.first_name,s.last_name

--question 1 another way

[1:25] 
SELECT COUNT(customer_id), staff_id
  FROM payment
 GROUP BY staff_id
 ORDER BY COUNT(customer_id) DES


--question 2

SELECT p.customer_id, c.first_name, SUM(p.amount)
FROM payment p
LEFT JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id, c.first_name;


--http://www.postgresqltutorial.com/postgresql-having/
--postgresqltutorial.com

--https://www.postgresql.org/docs/8.1/static/tutorial-agg.html
 
--https://www.postgresql.org/docs/9.3/static/functions-matching.html


--1. find all the customers with a first_name or last_name with the word "in" in it

--answer to 1:

SELECT * 
FROM customer
WHERE first_name iLIKE '%IN%' OR last_name iLIKE '%IN%';

--iLIKE is case insensitive

--LIKE is case sensitive


-- this query breaks - why? - how do you fix it?
SELECT p.staff_id, COUNT(p.staff_id)
FROM payment p
LEFT JOIN customer c
ON p.customer_id = c.customer_id
LEFT JOIN staff s
ON p.staff_id = s.staff_id
GROUP BY p.staff_id
WHERE s.first_name = 'Mike';


--where clause  comes before the group by


SELECT p.staff_id, COUNT(p.staff_id)
FROM payment p
LEFT JOIN customer c
ON p.customer_id = c.customer_id
LEFT JOIN staff s
ON p.staff_id = s.staff_id
WHERE s.first_name = 'Mike'
GROUP BY p.staff_id;