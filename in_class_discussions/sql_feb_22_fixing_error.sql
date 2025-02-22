
-- Convert rental_rate and replcement_cost in film2 table from USD to INR
SELECT rating, rental_rate,ROUND(rental_rate*86.62,2) new_rental_rate, 
replacement_cost, ROUND(replacement_cost*86.62,2) new_rep_cost
FROM film2
WHERE rating IN ('G','R','PG')
ORDER BY new_rental_rate, new_rep_cost DESC;


UPDATE film2 
SET rental_rate=ROUND(rental_rate*86.62,2), 
	replacement_cost=ROUND(replacement_cost*86.62,2)
WHERE rating IN ('G','R','PG');

-- With NUMERIC(5,2) --> maximum number allowed is 999.99
-- With NUMERIC(6,2) --> maximum number allowed is 9999.99
-- With NUMERIC(10,2) --> maximum number allowed is 99999999.99

SELECT rental_rate, replacement_cost 
FROM film2;

-- Need to change the datatype of table colum
-- rental_rate, replacement_cost columns of film2 table should be NUMERIC(10,2)

ALTER TABLE film2
ALTER COLUMN rental_rate TYPE NUMERIC(10,2),
ALTER COLUMN replacement_cost TYPE NUMERIC(10,2);

SELECT rating, rental_rate, replacement_cost FROM film2;

-- Converting rental_rate and replcement_cost in film2 table from USD to INR
UPDATE film2 
SET rental_rate=ROUND(rental_rate*86.62,2), 
	replacement_cost=ROUND(replacement_cost*86.62,2)
WHERE rating IN ('G','R','PG');

SELECT rating, rental_rate, replacement_cost FROM film2;


