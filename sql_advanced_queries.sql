SELECT * FROM customer;
SELECT * FROM customer ORDER BY last_name;

SELECT * FROM customer WHERE last_name LIKE 'Wood%';
SELECT * FROM customer WHERE last_name LIKE 'wood%';

SELECT * FROM customer WHERE last_name ILIKE 'wood%';  -- wood

SELECT * FROM customer WHERE last_name ILIKE 'woo__';
SELECT * FROM customer WHERE last_name ILIKE 'Bar_ett';

SELECT * FROM customer WHERE last_name ILIKE 'mor___';
SELECT * FROM customer WHERE last_name ILIKE 'mor%'; 

--- Identify top 20 customers who paid highest total_amount
-- Output: Customer_id, First Name, Last Name, Email, Total Amount
--- Identify top 20 customers who paid highest total_amount
-- Output: Customer_id, First Name, Last Name, Email, Total Amount

SELECT * FROM customer; -- Customer_id, First Name, Last Name, Email
SELECT * FROM payment; -- Customer_id, amount

SELECT * FROM customer3 c
JOIN payment3 p
ON c.customer_id = p.customer_id;


SELECT c.customer_id, c.first_name, c.last_name, c.email, p.amount --,p.customer_id,, *
FROM customer3 c
JOIN payment3 p
ON c.customer_id = p.customer_id;


SELECT c.customer_id, c.first_name, c.last_name, c.email, SUM(p.amount) --,p.customer_id,, *
FROM customer3 c
JOIN payment3 p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email;


-- USING payment and customer tables
SELECT c.customer_id, c.first_name, c.last_name, c.email, SUM(p.amount) total_amount
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email
ORDER BY total_amount DESC;


-- USING payment and customer tables
SELECT c.customer_id, c.first_name, c.last_name, c.email, SUM(p.amount) total_amount
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email
ORDER BY total_amount DESC
LIMIT 20;


------------------

SELECT * FROM customer3;
SELECT * FROM payment3;

SELECT c.customer_id, p.customer_id, c.first_name, c.last_name, c.email, p.amount 
FROM customer3 c
LEFT JOIN payment3 p
ON c.customer_id = p.customer_id;


SELECT c.customer_id, p.customer_id, c.first_name, c.last_name, c.email, SUM(p.amount)
FROM customer3 c
LEFT JOIN payment3 p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, p.customer_id, c.first_name, c.last_name, c.email;

----------

SELECT * FROM customer;  -- 599 customers are present
SELECT * FROM payment2;

SELECT DISTINCT customer_id FROM payment2; -- customers who made payments -- 124


-- Details of customers who made payments
SELECT * FROM customer WHERE customer_id IN (
	SELECT DISTINCT customer_id FROM payment2
);


SELECT * FROM customer3 WHERE customer_id IN (341,342);
SELECT * FROM customer3 WHERE customer_id NOT IN (341,342);

-- Details of customers who didn't made payments --> 475 customers didn't made any payments
SELECT * FROM customer WHERE customer_id NOT IN (
	SELECT DISTINCT customer_id FROM payment2
);


--- Using customer and payment2 table, identify the customers who paid highest total amount
SELECT c.customer_id, p.customer_id, c.first_name, c.last_name, c.email,p.amount
FROM customer c
JOIN payment2 p
ON c.customer_id = p.customer_id;

SELECT c.customer_id, p.customer_id, c.first_name, c.last_name, c.email, SUM(p.amount)
FROM customer c
JOIN payment2 p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, p.customer_id, c.first_name, c.last_name, c.email;

---
SELECT COUNT(DISTINCT customer_id) FROM customer; -- 599 customers are present
SELECT COUNT(DISTINCT customer_id) FROM payment2; -- 124 customers are present

SELECT COUNT(*) FROM payment2; -- 500 transactions

-- customers who does not have transactions --> 475
SELECT COUNT(*) FROM customer WHERE customer_id NOT IN (
	SELECT DISTINCT customer_id FROM payment2
);


SELECT c.customer_id, p.customer_id, c.first_name, c.last_name, c.email,p.amount
FROM customer c
LEFT JOIN payment2 p
ON c.customer_id = p.customer_id;

-- 599 rows
SELECT c.customer_id, p.customer_id, c.first_name, c.last_name, c.email, SUM(p.amount)
FROM customer c
LEFT JOIN payment2 p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, p.customer_id, c.first_name, c.last_name, c.email;


SELECT p.customer_id, c.first_name, c.last_name, c.email, SUM(p.amount)
FROM customer c
LEFT JOIN payment2 p
ON c.customer_id = p.customer_id
GROUP BY p.customer_id, c.first_name, c.last_name, c.email;


SELECT p.customer_id, p.amount
FROM customer c
LEFT JOIN payment2 p
ON c.customer_id = p.customer_id


-- 125 rows
SELECT p.customer_id, SUM(p.amount)
FROM customer c
LEFT JOIN payment2 p
ON c.customer_id = p.customer_id
GROUP BY p.customer_id;

-- 599 rows
SELECT c.customer_id, SUM(p.amount)
FROM customer c
LEFT JOIN payment2 p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

----


SELECT * FROM payment2;
-- Identify total_amount and the number of transactions made by each customer
SELECT customer_id, amount FROM payment2;


SELECT customer_id, SUM(amount), count(amount)
FROM payment2
GROUP BY customer_id;


SELECT customer_id, count(amount), MIN(amount), MAX(amount), SUM(amount), AVG(amount), SUM(amount)/COUNT(amount)
FROM payment2
GROUP BY customer_id;
-- 351	3	0.99	5.99	9.97	3.3233333333333333
-- 448	5	0.99	7.99	24.95	4.9900000000000000

-- validation
SELECT * FROM payment2 WHERE customer_id = 448;


--- 
SELECT c.customer_id, p.customer_id, c.first_name, c.last_name, c.email, SUM(p.amount) total_amount, COUNT(p.amount)
FROM customer c
LEFT JOIN payment2 p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, p.customer_id, c.first_name, c.last_name, c.email
ORDER BY total_amount;


----------

SELECT * FROM customer;
SELECT * FROM payment;

SELECT DISTINCT customer_id FROM payment;

SELECT * FROM customer WHERE customer_id IN (
	184, 87, 477, 273
);

-- Getting the details of customers who made transactions
SELECT * FROM customer WHERE customer_id IN (
	SELECT DISTINCT customer_id FROM payment
);




-----------
SELECT * FROM inventory;

SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM actor;

-- FILM  ACTOR1 ACTOR2



