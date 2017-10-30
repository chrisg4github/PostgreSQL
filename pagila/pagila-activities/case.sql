SELECT DISTINCT rental_duration
FROM film;


SELECT
(CASE rental_duration
WHEN 7 THEN 'best deal'
WHEN 6 THEN 'good deal'
WHEN 5 THEN 'good deal'
WHEN 4 THEN 'ok deal'
WHEN 3 THEN 'ok deal'
END) AS djfk, *
FROM film;











--re-write this so that it's less redundant




SELECT (
        CASE 
            WHEN rental_duration >= 7
                THEN 'best deal'
            WHEN rental_duration <= 4
                THEN 'ok deal'
            ELSE 'good deal'
            END
        ) AS djfk
    ,film.rental_duration
FROM film;

--another way
SELECT
(CASE 
WHEN rental_duration = 7 THEN 'best deal'
WHEN rental_duration IN ( 5,6) THEN 'good deal'
WHEN rental_duration IN (3,4) THEN 'ok deal'
END) AS djfk, *
FROM film;