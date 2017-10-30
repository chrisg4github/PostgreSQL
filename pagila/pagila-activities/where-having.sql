--WHERE vs HAVING

	SELECT p.staff_id, COUNT(p.staff_id) AS transaction_count
	FROM payment p
	LEFT JOIN customer c
	ON p.customer_id = c.customer_id
	LEFT JOIN staff s
	ON p.staff_id = s.staff_id
	WHERE s.first_name = 'Mike'
	GROUP BY p.staff_id;

	--ERROR:  column "transaction_count" does not exist
	--LINE 7:  WHERE transaction_count < 8000
		SELECT p.staff_id, COUNT(p.staff_id) AS transaction_count 
		FROM payment p
		LEFT JOIN customer c
		ON p.customer_id = c.customer_id
		LEFT JOIN staff s
		ON p.staff_id = s.staff_id
		WHERE transaction_count < 8000
		GROUP BY p.staff_id;

	--ERROR:  aggregate functions are not allowed in WHERE
	--LINE 7:  WHERE COUNT(p.staff_id) < 8000
		SELECT p.staff_id, COUNT(p.staff_id) AS transaction_count 
		FROM payment p
		LEFT JOIN customer c
		ON p.customer_id = c.customer_id
		LEFT JOIN staff s
		ON p.staff_id = s.staff_id
		WHERE COUNT(p.staff_id) < 8000
		GROUP BY p.staff_id;

	SELECT p.staff_id, COUNT(p.staff_id) AS transaction_count 
	FROM payment p
	LEFT JOIN customer c
	ON p.customer_id = c.customer_id
	LEFT JOIN staff s
	ON p.staff_id = s.staff_id
	GROUP BY p.staff_id
	HAVING COUNT(p.staff_id) < 8000;
		-- doing 
		-- HAVING transaction_count < 8000 won't work












	--which customers (first name and last name) have spent over 190 dollars

















		SELECT p.customer_id, c.first_name, c.last_name, SUM(p.amount)
		FROM payment p
		LEFT JOIN customer c
		ON p.customer_id = c.customer_id
		GROUP BY p.customer_id, c.first_name, c.last_name
		HAVING SUM(p.amount) > 190;

		SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount)
		FROM payment p
		LEFT JOIN customer c
		ON p.customer_id = c.customer_id
		GROUP BY c.customer_id
		HAVING SUM(p.amount) > 190;
