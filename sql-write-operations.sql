SELECT * FROM customer3;

SELECT first_name,UPPER(first_name) FROM customer3;
UPDATE customer3 SET first_name=UPPER(first_name) ;

SELECT * FROM customer3;
-----
SELECT first_name,last_name,LOWER(first_name),LOWER(last_name) FROM customer3;
UPDATE customer3 SET first_name=LOWER(first_name), last_name=LOWER(last_name);
SELECT * FROM customer3;


SELECT * FROM film;
CREATE TABLE film2 AS SELECT * FROM film;
SELECT * FROM film2;



SELECT * FROM film2;
SELECT rental_rate, replacement_cost FROM film2; -- in US dollars

-- Converting to INR
SELECT rental_rate, rental_rate*86.62, replacement_cost, replacement_cost*86.62 FROM film2;

SELECT * FROM film2;
SELECT DISTINCT rating FROM film2;
SELECT rating,COUNT(*) FROM film2 GROUP BY rating; -- Number of films based on rating

---
SELECT rating, rental_rate, rental_rate*86.62, replacement_cost, replacement_cost*86.62 FROM film2;

SELECT rating, rental_rate, rental_rate*86.62, replacement_cost, replacement_cost*86.62 
FROM film2
WHERE rating IN ('G','R','PG');

SELECT * FROM film2;
UPDATE film2 SET rental_rate=rental_rate*86.62, replacement_cost=replacement_cost*86.62 
WHERE rating IN ('G','R','PG');

/*
numeric(4,2)
8987.45
*/

SELECT rating, rental_rate,rental_rate*86.62, ROUND(rental_rate*86.62,2) new_rental_rate, 
replacement_cost, replacement_cost*86.62,ROUND(replacement_cost*86.62,2) new_rep_cost,(replacement_cost*86.62,2)
FROM film2
WHERE rating IN ('G','R','PG')
ORDER BY new_rental_rate, new_rep_cost DESC;



SELECT rating, rental_rate,ROUND(rental_rate*86.62,2) new_rental_rate, 
replacement_cost, ROUND(replacement_cost*86.62,2) new_rep_cost
FROM film2
WHERE rating IN ('G','R','PG')
ORDER BY new_rental_rate, new_rep_cost DESC;

UPDATE film2 SET rental_rate=ROUND(rental_rate*86.62,2), replacement_cost=ROUND(replacement_cost*86.62,2)
WHERE rating IN ('G','R','PG');

/*
ERROR:  numeric field overflow
A field with precision 4, scale 2 must round to an absolute value less than 10^2. 

SQL state: 22003
Detail: A field with precision 4, scale 2 must round to an absolute value less than 10^2.
*/

SELECT * FROM film2;

UPDATE film2 SET description=NULL, fulltext=NULL;


/* Preparing data for  INSERT TABLE */

SELECT * FROM film2 ORDER BY film_id LIMIT 5;

CREATE TABLE film3 AS SELECT * FROM film2 ORDER BY film_id LIMIT 5;


SELECT * FROM film3;

INSERT INTO film3 (film_id, title,release_year,rental_rate,replacement_cost,rating)
VALUES (6,'SANAM TERI KASAM',2025,13.78,80.99,'G');

INSERT INTO film3 (title,rental_rate,replacement_cost)
VALUES ('KALKI',12.45,58.34);

SELECT * FROM language;


INSERT INTO language 
VALUES (7, 'Telugu','2025-02-21 19:43:19');

SELECT * FROM language;
INSERT INTO language
VALUES (10);


INSERT INTO language (language_id, name, last_update)
VALUES (8, 'Hindi','2025-02-21 19:45:19');


INSERT INTO language (last_update, language_id, name)
VALUES ('2025-02-21 19:46:30', 9, 'Sanskrit');

SELECT * FROM language;
CREATE TABLE language2 AS SELECT * FROM language;
SELECT * FROM language2;


INSERT INTO language2 
VALUES (10);

INSERT INTO language2 
VALUES (10,'Kannada');



SELECT * FROM language;
SELECT * FROM language WHERE language_id>6;
DELETE FROM language WHERE language_id>6;
SELECT * FROM language;

SELECT * FROM language2;
DELETE FROM language2;  -- Table Truncate means deleting all rows of table. i.e., making 


SELECT * FROM language;
CREATE TABLE language3 AS SELECT * FROM language;

SELECT * FROM language3;
DELETE FROM language3;


CREATE TABLE language4 AS SELECT * FROM language;
CREATE TABLE language5 AS SELECT * FROM language;
CREATE TABLE language6 AS SELECT * FROM language;

SELECT * FROM language6;

TRUNCATE language4;
SELECT * FROM language4;

TRUNCATE language5, language6;
SELECT * FROM language5;
SELECT * FROM language6;



CREATE TABLE city2 AS SELECT * FROM city;
SELECT * FROM city2;

CREATE TABLE city3(
	city_id INTEGER,
	city VARCHAR(50),
	country_id SMALLINT,
	last_update TIMESTAMP WITHOUT TIME ZONE
);
INSERT INTO city3 SELECT * FROM city;
SELECT * FROM city3;



SELECT * FROM city3;

DROP TABLE city3;
SELECT * FROM city3; -- Will get an error --> ERROR:  relation "city3" does not exist

DROP TABLE language3, language4, language5, language6;
DROP TABLE language2;



SELECT * FROM city2;

ALTER TABLE city2 
ADD COLUMN area NUMERIC;


ALTER TABLE city2 
ADD COLUMN pin INTEGER,
ADD COLUMN vehicle_reg VARCHAR(100);


SELECT * FROM city2;

ALTER TABLE city2
DROP COLUMN area,
DROP COLUMN pin,
DROP COLUMN vehicle_reg;


SELECT * FROM city2;

ALTER TABLE city2
RENAME COLUMN last_update TO updated_timestamp;


ALTER TABLE city2 RENAME TO cities2;
SELECT * FROM city2; -- We renamed table and hence this will throw error
SELECT * FROM cities2;



