SELECT * FROM payment;

SELECT *, amount*100 FROM payment;
SELECT customer_id, amount, amount*86.62 amount_inr FROM payment;

-- For every customer, get the following details
-- Full Name, email, total_amount, no. of transactions, max amount paid, min amount paid and avg amount paid

-- | <- pipe operator

SELECT * FROM customer;
SELECT customer_id, first_name, last_name, email FROM customer;
SELECT customer_id, first_name, last_name, email, first_name || ' ' || last_name FROM customer;

SELECT customer_id, first_name, last_name, email, CONCAT(first_name, ' ', last_name) FROM customer;
SELECT customer_id, first_name, last_name, email, CONCAT_WS(' ',first_name, last_name) FROM customer;
SELECT customer_id, first_name, last_name, email, CONCAT_WS('_',first_name, last_name) FROM customer;

-- populating dummy middle name
SELECT customer_id, first_name, last_name, email, CONCAT(first_name, ' ', 'XYZ', ' ', last_name) FROM customer;
SELECT customer_id, first_name, last_name, email, CONCAT_WS(' ',first_name, 'XYZ', last_name) FROM customer;
SELECT customer_id, first_name, last_name, email, CONCAT_WS('::', first_name, 'XYZ', last_name) FROM customer;


-- For every customer, get the following details
-- Full Name, email, total_amount, no. of transactions, max amount paid, min amount paid and avg amount paid

select * FROM customer;
SELECT customer_id, first_name, last_name, email FROM customer;
SELECT customer_id, first_name, last_name, email, CONCAT(first_name, ' ', last_name) FROM customer;
SELECT customer_id, first_name, last_name, email, CONCAT(first_name, ' ', last_name) full_name FROM customer;

SELECT customer_id, email, CONCAT(first_name, ' ', last_name) full_name FROM customer;

-- For: Full Name, email
SELECT customer_id, CONCAT(first_name, ' ', last_name) full_name,email FROM customer;

-- total_amount, no. of transactions, max amount paid, min amount paid and avg amount paid
SELECT * FROM payment;
SELECT customer_id, amount FROM payment;
SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id; -- total_amount
SELECT customer_id, COUNT(amount) FROM payment GROUP BY customer_id;

-- Get the no. of transactions for each customer only when staff_id is 1
SELECT customer_id,staff_id,amount FROM payment;
SELECT customer_id, staff_id,amount FROM payment WHERE staff_id=1;
SELECT customer_id, COUNT(staff_id) FROM payment WHERE staff_id=1 GROUP BY customer_id;

-- Using payment3 table
SELECT customer_id,staff_id,amount FROM payment3;
SELECT customer_id,staff_id,amount FROM payment3 WHERE staff_id=2;
SELECT customer_id, COUNT(staff_id),COUNT(customer_id) FROM payment3 WHERE staff_id=2 GROUP BY customer_id;

-- Any column can be used for counting here -> Tip: In real-time use the column that does not have NULL values
SELECT customer_id, COUNT(staff_id), COUNT(*), COUNT(amount) FROM payment WHERE staff_id=1 GROUP BY customer_id;




-- For every customer, get the following details
-- Full Name, email, total_amount, no. of transactions, max amount paid, min amount paid and avg amount paid

-- For: Full Name, email
SELECT customer_id, CONCAT(first_name, ' ', last_name) full_name,email FROM customer;

-- total_amount, no. of transactions, max amount paid, min amount paid and avg amount paid
SELECT * FROM payment;
SELECT customer_id, amount FROM payment;
SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id; -- total_amount
SELECT customer_id, COUNT(amount) FROM payment GROUP BY customer_id; -- no. of transactions

SELECT customer_id, MAX(amount) FROM payment GROUP BY customer_id; -- max. amount paid
SELECT customer_id, MIN(amount) FROM payment GROUP BY customer_id; -- min. amount paid

SELECT customer_id, AVG(amount) FROM payment GROUP BY customer_id; -- avg. amount paid

SELECT customer_id, amount FROM payment;
SELECT customer_id, SUM(amount), COUNT(amount), AVG(amount) FROM payment GROUP BY customer_id;
SELECT customer_id, SUM(amount)/COUNT(amount), AVG(amount) FROM payment GROUP BY customer_id;


-- total_amount, no. of transactions, max amount paid, min amount paid and avg amount paid
SELECT customer_id, amount FROM payment;
SELECT customer_id, SUM(amount) total_amount, COUNT(amount) no_of_trans,
MAX(amount) max_amount, MIN(amount) min_amount, AVG(amount) avg_amount
FROM payment GROUP BY customer_id;


---- JOINING TWO TABLES to get the desired report --- 

-- For every customer, get the following details
-- Full Name, email, total_amount, no. of transactions, max amount paid, min amount paid and avg amount paid
SELECT customer_id, CONCAT(first_name, ' ', last_name) full_name,email FROM customer; -- For: Full Name, email
SELECT customer_id, SUM(amount) total_amount, COUNT(amount) no_of_trans,
MAX(amount) max_amount, MIN(amount) min_amount, AVG(amount) avg_amount
FROM payment GROUP BY customer_id; -- For: total_amount, no. of transactions, max amount paid, min amount paid and avg amount paid

SELECT * FROM customer c
JOIN payment p
ON c.customer_id=p.customer_id;

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) full_name, c.email FROM customer c
JOIN payment p
ON c.customer_id=p.customer_id;


SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) full_name,c.email, 
p.customer_id, p.amount
FROM customer c
JOIN payment p
ON c.customer_id=p.customer_id;

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) full_name,c.email, 
p.customer_id, SUM(p.amount) total_amount
FROM customer c
JOIN payment p
ON c.customer_id=p.customer_id
GROUP BY c.customer_id, CONCAT(c.first_name, ' ', c.last_name),c.email, p.customer_id;



SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) full_name,c.email, 
p.customer_id, SUM(p.amount) total_amount, COUNT(p.amount) no_of_trans,
MAX(p.amount) max_amount, MIN(p.amount) min_amount, AVG(p.amount) avg_amount
FROM customer c
JOIN payment p
ON c.customer_id=p.customer_id
GROUP BY c.customer_id, CONCAT(c.first_name, ' ', c.last_name),c.email, p.customer_id;


SELECT CONCAT(c.first_name, ' ', c.last_name) full_name,c.email, 
SUM(p.amount) total_amount, COUNT(p.amount) no_of_trans,
MAX(p.amount) max_amount, MIN(p.amount) min_amount, AVG(p.amount) avg_amount
FROM customer c
JOIN payment p
ON c.customer_id=p.customer_id
GROUP BY CONCAT(c.first_name, ' ', c.last_name),c.email;

SELECT CONCAT(c.first_name, ' ', c.last_name) full_name,c.email, 
SUM(p.amount) total_amount, COUNT(p.amount) no_of_trans,
MAX(p.amount) max_amount, MIN(p.amount) min_amount, AVG(p.amount) avg_amount
FROM customer c
JOIN payment p
ON c.customer_id=p.customer_id
GROUP BY CONCAT(c.first_name, ' ', c.last_name),c.email
ORDER BY full_name;


SELECT CONCAT(c.first_name, ' ', c.last_name) full_name,c.email, 
SUM(p.amount) total_amount, COUNT(p.amount) no_of_trans,
MAX(p.amount) max_amount, MIN(p.amount) min_amount, AVG(p.amount) avg_amount
FROM customer c
JOIN payment p
ON c.customer_id=p.customer_id
GROUP BY CONCAT(c.first_name, ' ', c.last_name),c.email
ORDER BY total_amount DESC;



SELECT CONCAT(c.first_name, ' ', c.last_name) full_name,c.email, 
SUM(p.amount) total_amount, COUNT(p.amount) no_of_trans,
MAX(p.amount) max_amount, MIN(p.amount) min_amount, AVG(p.amount) avg_amount
FROM customer c
JOIN payment p
ON c.customer_id=p.customer_id
GROUP BY CONCAT(c.first_name, ' ', c.last_name),c.email
ORDER BY avg_amount DESC;


-- For every customer, get the following details
-- Full Name, email, total_amount, no. of transactions, max amount paid, min amount paid and avg amount paid
SELECT customer_id, CONCAT(first_name, ' ', last_name) full_name,email FROM customer; -- For: Full Name, email
SELECT customer_id, SUM(amount) total_amount, COUNT(amount) no_of_trans,
MAX(amount) max_amount, MIN(amount) min_amount, AVG(amount) avg_amount
FROM payment GROUP BY customer_id; -- For: total_amount, no. of transactions, max amount paid, min amount paid and avg amount paid


SELECT CONCAT(c.first_name, ' ', c.last_name) full_name,c.email, 
SUM(p.amount) total_amount, COUNT(p.amount) no_of_trans,
MAX(p.amount) max_amount, MIN(p.amount) min_amount, AVG(p.amount) avg_amount
FROM customer c
JOIN payment p
ON c.customer_id=p.customer_id
GROUP BY CONCAT(c.first_name, ' ', c.last_name),c.email
HAVING AVG(p.amount) >= 5
ORDER BY avg_amount DESC;




