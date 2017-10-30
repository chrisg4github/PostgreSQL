--Signifyd (it deals with credit card fraud prevention)

-- Question 1

-- List the difference between an order and the previous order for that particular employee

-- Question 2

-- Get the total number of orders that had a cancelled action after the approved action 

-- QUESTION 1
	
	SELECT employee_id, order_date, action, order_id,
	lag(order_date) over (partition by employee_id order by order_date desc)
	FROM shipments
	WHERE action = 'ordered'
	ORDER BY employee_id, order_date;

-- QUESTION 2 ANSWERS

	--ANSWER question 2 with self join

		-- answer
		WITH s1 AS (
		SELECT s.order_id, s.order_date, s.action
		FROM shipments s
		WHERE s.action = 'approved'
		), s2 AS (
		SELECT s.order_id, s.order_date, s.action
		FROM shipments s
		WHERE s.action = 'cancelled'
		)
		SELECT count(*)
		FROM s1 
		LEFT JOIN s2
		ON s1.order_id = s2.order_id
		WHERE s1.order_date < s2.order_date;

		--building up to answer
		WITH s1 AS (
		SELECT s.order_id, s.order_date, s.action
		FROM shipments s
		WHERE s.action = 'approved'
		), s2 AS (
		SELECT s.order_id, s.order_date, s.action
		FROM shipments s
		WHERE s.action = 'cancelled'
		)
		SELECT s1.order_id, s1.order_date AS approved_order_date, s2.order_date AS cancelled_order_date 
		FROM s1 
		LEFT JOIN s2
		ON s1.order_id = s2.order_id
		WHERE s1.order_date < s2.order_date;

	--ANSWER question 2 without self join
	
		-- gives 4 the correct answer
		SELECT COUNT(DISTINCT order_id)
		FROM shipments
		WHERE 
		action IN ('approved', 'cancelled') 
		AND
		order_id IN (SELECT s.order_id FROM shipments s
		WHERE action = 'approved' AND 
		order_id IN 
		(SELECT s1.order_id 
		FROM shipments s1 
		WHERE action = 'cancelled' 
		AND s1.order_date > s.order_date));

		--I can count 4 with a manual check
		SELECT *
		FROM shipments
		WHERE 
		action IN ('approved', 'cancelled') 
		AND
		order_id IN (SELECT s.order_id FROM shipments s
		WHERE action = 'approved' AND 
		order_id IN 
		(SELECT s1.order_id FROM shipments s1 WHERE action = 'cancelled'));

		SELECT s.order_id FROM shipments s
		WHERE action = 'approved' AND 
		order_id IN 
		(SELECT s1.order_id FROM shipments s1 WHERE action = 'cancelled');

		--grouping by order id and counting how many actions each one has
		SELECT s.order_id, COUNT(*)
		FROM shipments s
		GROUP BY s.order_id
		ORDER BY s.order_id;

		--50
		SELECT COUNT(*) 
		FROM shipments;

		--see different actions
		SELECT DISTINCT action
		FROM shipments; 

		--see all the columns
		SELECT *
		FROM shipments; 
