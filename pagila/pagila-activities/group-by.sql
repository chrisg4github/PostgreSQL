--which store has had the most customers (not transactions)
























SELECT s.store_id, count(s.store_id)
FROM customer c
LEFT JOIN store s
ON c.store_id = s.store_id
GROUP BY s.store_id;