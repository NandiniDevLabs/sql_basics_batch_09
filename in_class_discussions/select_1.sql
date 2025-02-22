SELECT * FROM payment;
SELECT * FROM customer; 

SELECT payment_id, amount FROM payment;
SELECT amount FROM payment;

select * from payment; -- SQL is case insensitive

/* This is SQL
multi-line
comment*/

SELECT * FROM payment;

SELECT payment_id, customer_id, amount FROM payment;

SELECT * FROM payment WHERE customer_id = 446;

SELECT * FROM payment WHERE customer_id IN (446, 447);

SELECT payment_id, customer_id, amount FROM payment WHERE customer_id IN (446, 447);

SELECT * FROM payment ORDER BY amount; -- DEFAULT -> ASC
SELECT * FROM payment ORDER BY amount ASC;
SELECT * FROM payment ORDER BY amount DESC;

SELECT * FROM payment WHERE customer_id IN (446, 447);

SELECT * FROM payment WHERE customer_id IN (446, 447) ORDER BY amount ASC;
SELECT * FROM payment WHERE customer_id IN (446, 447) ORDER BY amount DESC;


SELECT * FROM customer;
SELECT first_name, last_name FROM customer;
SELECT first_name, last_name FROM customer ORDER BY first_name;
SELECT first_name, last_name FROM customer ORDER BY first_name DESC;

SELECT * FROM customer;
SELECT first_name, last_name FROM customer;

SELECT first_name, last_name FROM customer WHERE first_name = 'Jessie';

SELECT first_name, last_name FROM customer 
WHERE first_name IN ('Marion', 'Jamie', 'Tracy', 'Kelly', 'Leslie', 'Willie', 'Jessie', 'Terry');

SELECT first_name, last_name FROM customer 
WHERE first_name IN ('Marion', 'Jamie', 'Tracy', 'Kelly', 'Leslie', 'Willie', 'Jessie', 'Terry') ORDER BY first_name;


SELECT first_name, last_name FROM customer 
WHERE first_name IN ('Marion', 'Jamie', 'Tracy', 'Kelly', 'Leslie', 'Willie', 'Jessie', 'Terry') 
ORDER BY first_name, last_name;


SELECT first_name, last_name FROM customer 
WHERE first_name IN ('Marion', 'Jamie', 'Tracy', 'Kelly', 'Leslie', 'Willie', 'Jessie', 'Terry') 
ORDER BY last_name, first_name;

SELECT first_name, last_name FROM customer 
WHERE first_name = 'Jessie';

SELECT first_name, last_name FROM customer 
WHERE first_name IN ('Jessie', 'Terry');

SELECT first_name, last_name FROM customer 
WHERE first_name LIKE 'Jan%';

SELECT first_name, last_name FROM customer 
WHERE first_name LIKE 'jan%';

SELECT first_name, last_name FROM customer 
WHERE first_name ILIKE 'jan%';


SELECT first_name, last_name, email FROM customer 
WHERE last_name ILIKE 'B%es'; -- case insensitive like


SELECT * FROM customer;
SELECT COUNT(*) FROM customer;

SELECT customer_id FROM customer;
SELECT COUNT(customer_id) FROM customer;


SELECT * FROM payment;

SELECT COUNT(*) FROM payment;
SELECT COUNT(payment_id) FROM payment;

SELECT amount FROM payment;
SELECT DISTINCT amount FROM payment;

SELECT DISTINCT amount FROM payment ORDER BY amount ASC;
SELECT DISTINCT amount FROM payment ORDER BY amount DESC;


SELECT * FROM payment;
SELECT COUNT(*) FROM payment;

SELECT amount FROM payment;
SELECT COUNT(amount) FROM payment;

SELECT SUM(amount) FROM payment;
SELECT MAX(amount) FROM payment;
SELECT MIN(amount) FROM payment;
SELECT AVG(amount) FROM payment;

SELECT * FROM payment;

-- Comparision operators : = , != , >, <, >=, <= 

SELECT * FROM payment WHERE amount = 9.99;

SELECT * FROM payment WHERE amount != 9.99;

SELECT * FROM payment WHERE amount > 9.99;
SELECT * FROM payment WHERE amount >= 9.99;

SELECT * FROM payment WHERE amount < 9.99;
SELECT * FROM payment WHERE amount <= 9.99;


-- Logical operators : AND, OR , NOT

SELECT * FROM payment;
SELECT * FROM payment WHERE customer_id IN (443, 444);

SELECT * FROM payment WHERE customer_id IN (443, 444) AND amount>4.99;
SELECT DISTINCT amount FROM payment WHERE customer_id IN (443, 444) AND amount>4.99;


SELECT * FROM payment WHERE customer_id IN (443, 444) AND amount>4.99 AND staff_id=1;

SELECT * FROM payment;

SELECT * FROM payment WHERE customer_id IN (443, 444) AND amount>4.99 AND staff_id=1;

SELECT * FROM payment WHERE customer_id IN (443, 444) OR amount=10.99;


SELECT * FROM payment WHERE customer_id IN (443, 444);
SELECT * FROM payment WHERE customer_id NOT IN (443, 444);

SELECT * FROM language;
SELECT * FROM language WHERE name IN ('English','German');
SELECT * FROM language WHERE name NOT IN ('English','German');

SELECT * FROM payment;

SELECT * FROM payment WHERE customer_id IN (443, 444);
SELECT DISTINCT amount FROM payment WHERE customer_id IN (443, 444);

SELECT * FROM payment WHERE customer_id IN (443, 444) AND amount BETWEEN 3.99 AND 6.99;
SELECT * FROM payment WHERE customer_id IN (443, 444) AND (amount>=3.99 AND amount<=6.99);


SELECT * FROM payment;

SELECT * FROM payment WHERE customer_id IN (443, 444);

SELECT * FROM payment WHERE customer_id IN (443, 444) ORDER BY payment_date DESC;

SELECT * FROM payment WHERE customer_id IN (443, 444) ORDER BY payment_date DESC LIMIT 5;






