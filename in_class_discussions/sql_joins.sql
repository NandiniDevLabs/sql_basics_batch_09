
--------- DATA PREPARATION FOR UNDERSTANDING JOINS ----------

-- Creating customer3 and payment3
SELECT * FROM customer;
SELECT * FROM customer WHERE customer_id IN (341, 342, 343, 345);

CREATE TABLE customer3 AS SELECT * FROM customer WHERE customer_id IN (341, 342, 343, 345);
SELECT * FROM customer3;

SELECT * FROM payment;
SELECT * FROM payment WHERE customer_id=341;  -- payment_id -> 17503
SELECT * FROM payment WHERE customer_id=342; -- payment_id -> 17509, 17510
SELECT * FROM payment WHERE customer_id=343; -- payment_id -> 17512, 17513, 17514
SELECT * FROM payment WHERE customer_id=344; -- payment_id -> 17519, 17520

SELECT * FROM payment WHERE payment_id IN (17503, 17509, 17510, 17512, 17513, 17514, 17519, 17520);

CREATE TABLE payment3 AS SELECT * FROM payment WHERE payment_id IN (17503, 17509, 17510, 17512, 17513, 17514, 17519, 17520);
SELECT * FROM payment3;

--------- DATA PREPARATION FOR UNDERSTANDING JOINS ----------



---- INNER JOIN ----
SELECT * FROM customer3;
SELECT * FROM payment3;

SELECT * FROM customer3
JOIN payment3
ON customer3.customer_id = payment3.customer_id;


SELECT * FROM customer3 c
JOIN payment3 p
ON c.customer_id = p.customer_id;

SELECT * FROM customer3 c
INNER JOIN payment3 p
ON c.customer_id = p.customer_id;


---- LEFT JOIN -----
SELECT * FROM customer3;
SELECT * FROM payment3;

SELECT * FROM customer3 c
LEFT JOIN payment3 p
ON c.customer_id = p.customer_id;


--- RIGHT JOIN ----
SELECT * FROM customer3;
SELECT * FROM payment3;

SELECT * FROM customer3 c
RIGHT JOIN payment3 p
ON c.customer_id = p.customer_id;


---- FULL JOIN ----
SELECT * FROM customer3;
SELECT * FROM payment3;

SELECT * FROM customer3 c
FULL JOIN payment3 p
ON c.customer_id = p.customer_id;



-- ASSIGNMENT: Update customer_id = NULL for payment_id 14519 in payment3
select * FROM payment3;


-- ASSIGNMENT: Update customer_id = NULL for customer_id 343
select * FROM customer3;


--- Try INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN





