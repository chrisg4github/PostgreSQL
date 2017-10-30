-- both are the same

	-- subquery
	SELECT *
	FROM customer 
	WHERE customer_id in (1,3,5);

	-- not a subquery
	SELECT *
	FROM customer 
	WHERE customer_id = 1 OR customer_id = 3 OR customer_id = 5;

	-- not a subquery 
	SELECT *
	FROM customer 
	WHERE customer_id BETWEEN 1 AND 5;

	SELECT *
		FROM customer 
		WHERE customer_id >= 1 AND customer_id <= 5;

-- using an aggregate:
	SELECT AVG(p.amount)
	FROM payment p;

	SELECT p.customer_id, c.first_name, c.last_name, p.amount
	FROM payment p
	LEFT JOIN customer c
	ON p.customer_id = c.customer_id
	WHERE p.amount > (SELECT AVG(p.amount)
	FROM payment p);

