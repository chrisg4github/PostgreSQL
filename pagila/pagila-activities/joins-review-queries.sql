-- great graphics here: https://www.w3schools.com/sql/sql_join.asp

difference between LEFT and RIGTH joins
	SELECT st.*, sk.skill
	FROM students st
	LEFT JOIN skills sk
	ON st.id = sk.student_id;

	SELECT st.*, po.power
	FROM students st
	LEFT OUTER JOIN powers po
	ON st.id = po.student_id;

	SELECT st.*, sk.skill
	FROM students st
	RIGHT JOIN skills sk
	ON st.id = sk.student_id;

	SELECT st.*, sk.skill
	FROM students st
	RIGHT OUTER JOIN skills sk
	ON st.id = sk.student_id;

-- why do those above two queries return the same results

-- why do these two queries return different results?

SELECT st.*, po.power
FROM students st
LEFT JOIN powers po
ON st.id = po.student_id;

SELECT st.*, po.power
FROM students st
RIGHT JOIN powers po
ON st.id = po.student_id;

-- what do these do?

	SELECT st.*, po.power
	FROM students st
	INNER JOIN powers po
	ON st.id = po.student_id;

	SELECT st.*, po.power
	FROM students st
	JOIN powers po
	ON st.id = po.student_id;







	-- in postgresql joins are inner joins by default unless specified otherwise







-- what does a full join do? When does it return results different from a left join/right join?






	
	SELECT st.*, p.pet_name
	FROM students st
	INNER JOIN pets p
	ON st.id = p.student_id;

	SELECT st.*, p.pet_name
	FROM students st
	FULL OUTER JOIN pets p
	ON st.id = p.student_id;

	SELECT st.*, p.pet_name
	FROM students st
	LEFT JOIN pets p
	ON st.id = p.student_id;

	SELECT st.*, p.pet_name
		FROM students st
		RIGHT JOIN pets p
		ON st.id = p.student_id;



-- http://www.postgresqltutorial.com/postgresql-cross-join/

	SELECT s.id, s.name, t.tech
	FROM students s
	CROSS JOIN technologies t
	ORDER BY s.name;












