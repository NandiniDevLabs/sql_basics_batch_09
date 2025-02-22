SELECT * FROM payment;

SELECT DISTINCT amount FROM payment ORDER BY amount DESC;
SELECT DISTINCT amount FROM payment ORDER BY amount DESC OFFSET 2;
SELECT DISTINCT amount FROM payment ORDER BY amount DESC OFFSET 2 LIMIT 5;

-- Aggregate functions- AVG, MIN, MAX, SUM, COUNT

SELECT * FROM payment;
SELECT * FROM payment WHERE customer_id = 443;
SELECT amount FROM payment WHERE customer_id = 443;
SELECT SUM(amount) FROM payment WHERE customer_id = 443;

SELECT SUM(amount) FROM payment WHERE customer_id = 444;

SELECT * FROM payment WHERE customer_id IN (443,444);
SELECT amount FROM payment WHERE customer_id IN (443,444);
SELECT SUM(amount) FROM payment WHERE customer_id IN (443,444);

/*
443 93.79
444 105.72
*/

-- GROUP BY
SELECT * FROM payment
WHERE customer_id IN (443,444);

SELECT customer_id, SUM(amount) FROM payment
WHERE customer_id IN (443,444)
GROUP BY customer_id;


SELECT customer_id, amount FROM payment;
-- Total amount paid by all customers
SELECT customer_id, SUM(amount) FROM payment 
GROUP BY customer_id;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY sum;

-- Aliasing 
SELECT * FROM payment;
SELECT customer_id, amount FROM payment;
SELECT customer_id AS cid, amount AS amt FROM payment;
SELECT customer_id cid, amount amt FROM payment;
--

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY sum;

SELECT customer_id, SUM(amount) total_amount FROM payment
GROUP BY customer_id;

SELECT customer_id, SUM(amount) total_amount FROM payment
GROUP BY customer_id
ORDER BY total_amount;

SELECT customer_id, SUM(amount) total_amount FROM payment
GROUP BY customer_id
ORDER BY total_amount DESC;

-- Identify customers who paid more than $200 (total amount > 200)
SELECT * FROM payment;
SELECT customer_id, amount FROM payment;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id;

SELECT customer_id, SUM(amount) total_amount FROM payment
GROUP BY customer_id;

SELECT customer_id, SUM(amount) total_amount FROM payment
GROUP BY customer_id
ORDER BY total_amount DESC;

-- IS a solution - but not the best one
SELECT customer_id, SUM(amount) total_amount FROM payment
GROUP BY customer_id
ORDER BY total_amount DESC
LIMIT 2;

-----------
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id;

-- Identify customers who paid more than $190 (total amount > 190)
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 190

-- Best solution to -> Identify customers who paid more than $190
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 190
ORDER BY sum DESC;


SELECT customer_id, SUM(amount) total_amount FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 190
ORDER BY total_amount DESC;


-- Identifying customer who paid more than 200
SELECT customer_id, SUM(amount) total_amount FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200
ORDER BY total_amount DESC;


--- Get the total transactions of each customer
SELECT * FROM payment;
SELECT * FROM payment WHERE customer_id = 341;
SELECT COUNT(*) FROM payment WHERE customer_id = 341;  --- This is for one customer
SELECT COUNT(*) FROM payment WHERE customer_id IN (341, 342); --- This is for multiple customers

/*
customer_id	total_transactions	
341 		22
342 		32
*/

SELECT * FROM payment;
SELECT customer_id, amount FROM payment;

SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id;

-- Get the total transactions of each customer
SELECT customer_id, COUNT(amount) total_transactions FROM payment
GROUP BY customer_id
ORDER BY total_transactions DESC;


SELECT customer_id, COUNT(amount) total_transactions FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40
ORDER BY total_transactions DESC;

-- Identify customers who average transaction is between 3 and 7
/* customer_id average_transaction
344 2.5
345 3.2 -- 
346 5 --
347 8
348 6 --
*/


-- Identify the customers with highest amount paid greater than $10

/* customer_id	highest_transaction
342				10.99
344				11.09
*/
















































