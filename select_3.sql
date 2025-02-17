
SELECT * FROM payment2;

-- Idntify customer who paid highest total amount
SELECT * FROM payment2 ORDER BY amount DESC;

SELECT * FROm payment2 WHERE customer_id = 341;
SELECT SUM(amount) FROm payment2 WHERE customer_id = 341;

SELECT customer_id, SUM(amount) FROM payment2
GROUP BY customer_id;

SELECT customer_id, SUM(amount) total_amount FROM payment2
GROUP BY customer_id ORDER BY total_amount DESC;


SELECT * FROM payment2 WHERE customer_id IN (341, '403');


SELECT * FROM payment2 WHERE customer_id IN (341, '403');

UPDATE payment2 SET amount = NULL WHERE customer_id IN (341, '403');

-- Identify customer who paid highest total amount
SELECT customer_id, SUM(amount) total_amount FROM payment2
GROUP BY customer_id 
HAVING SUM(amount) IS NOT NULL
ORDER BY total_amount DESC;
-- Customer with ID 431 paid highest total amount

SELECT * FROM customer WHERE customer_id = 431;
SELECT first_name, last_name, email, address_id FROM customer WHERE customer_id = 431;


SELECT * FROM address WHERE address_id = 436;
SELECT phone FROM address WHERE address_id = 436;

----------- JOINS ------------

SELECT * FROM payment;
SELECT * FROM customer;

SELECT * FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id;


SELECT * FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id;


SELECT * FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id;


SELECT p.customer_id, p.amount, * FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id;


SELECT p.customer_id, p.amount, c.first_name, c.last_name,c.email FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id;


-- Identify customer who paid highest total amount
SELECT * FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
WHERE p.customer_id = 431;


SELECT p.customer_id, SUM(p.amount) FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
WHERE p.customer_id = 431
GROUP BY p.customer_id;


SELECT p.customer_id,c.email,SUM(p.amount) FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
WHERE p.customer_id = 431
GROUP BY p.customer_id, c.email;


SELECT p.customer_id, c.first_name, c.last_name, c.email,SUM(p.amount) FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
WHERE p.customer_id = 431
GROUP BY p.customer_id, c.first_name, c.last_name, c.email;


-- Identify customer who paid highest total amount
SELECT p.customer_id, c.first_name, c.last_name, c.email,SUM(p.amount) total_amount FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id, c.first_name, c.last_name, c.email
ORDER BY total_amount DESC;



SELECT p.customer_id, c.first_name, c.last_name, c.email,SUM(p.amount) total_amount FROM payment2 p
JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id, c.first_name, c.last_name, c.email
HAVING SUM(p.amount) IS NOT NULL
ORDER BY total_amount DESC;



----
SELECT * FROM payment2 p
JOIN customer c
ON p.customer_id = c.customer_id;


SELECT * FROM payment2 p
INNER JOIN customer c
ON p.customer_id = c.customer_id;


SELECT * FROM payment2 p
LEFT JOIN customer c
ON p.customer_id = c.customer_id;


SELECT * FROM payment2 p
RIGHT JOIN customer c
ON p.customer_id = c.customer_id;


SELECT * FROM payment2 ;
SELECT * FROM customer;





