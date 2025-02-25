SELECT * FROM payment 
WHERE customer_id=341 
order by payment_date desc;


SELECT * FROM payment 
WHERE 
-- customer_id=341 AND 
payment_date='2007-02-16 22:41:45.996577';

SELECT *,DATE(payment_date) FROM payment ;

SELECT customer_id , DATE(payment_date), amount
FROM payment;

SELECT customer_id , DATE(payment_date), SUM(amount)
FROM payment
GROUP BY customer_id , DATE(payment_date);


SELECT customer_id , DATE(payment_date), SUM(amount)
FROM payment
GROUP BY customer_id , DATE(payment_date)
HAVING customer_id=341;


SELECT 1.99+7.99

SELECT 34/6.5
SELECT DATE('2007-02-16 22:41:45.996577'), 34/6.5



SELECT customer_id , DATE(payment_date), SUM(amount)
FROM payment
GROUP BY customer_id , DATE(payment_date);


-- Get results from April 1 to 15
SELECT customer_id, DATE(payment_date) pay_date, SUM(amount)
FROM payment
GROUP BY customer_id, DATE(payment_date)
HAVING DATE(payment_date) BETWEEN '2007-04-01' AND '2007-04-15'
ORDER BY pay_date,customer_id;

-- Sort date ascending and customer_id descending
SELECT customer_id, DATE(payment_date) pay_date, SUM(amount)
FROM payment
GROUP BY customer_id, DATE(payment_date)
HAVING DATE(payment_date) BETWEEN '2007-04-01' AND '2007-04-15'
ORDER BY pay_date ASC,customer_id DESC;


SELECT customer_id, DATE(payment_date) pay_date, SUM(amount)
FROM payment
GROUP BY customer_id, DATE(payment_date)
HAVING DATE(payment_date) BETWEEN '2007-04-01' AND '2007-04-04'
ORDER BY pay_date ASC,customer_id DESC;



SELECT TIMESTAMP('2007-04-05')


SELECT NOW();
SELECT 17521, 345, 32767, 1476, 5.99, NOW()


SELECT * FROM payment3;

INSERT INTO payment3
	(payment_id, customer_id, staff_id,
	 rental_id, amount, payment_date)
VALUES 
	(17521, 345, 32767, 
	1476, 5.99, NOW())





SELECT DATE('2025-02-24 08:00:00')   -- TIMESTAMP to DATE conversion
SELECT DATE '2025-02-24' + INTERVAL '0 hour' -- DATE to timestamp conversion
SELECT DATE '2025-02-24' + INTERVAL '90 day'
SELECT DATE '2025-02-24' - INTERVAL '42 day'
SELECT NOW()


SELECT * FROM payment3

SELECT customer_id, DATE(payment_date) pay_date, SUM(amount)
FROM payment
GROUP BY customer_id, DATE(payment_date)
HAVING DATE(payment_date) BETWEEN '2007-04-01' AND '2007-04-15'
ORDER BY pay_date ASC,customer_id DESC;



SELECT NOW(); -- timestamp with time zone
SELECT CURRENT_TIMESTAMP; -- timestamp with time zone

SELECT LOCALTIMESTAMP; -- timestamp without time zone

SELECT LOCALTIME; -- time without time zone
SELECT CURRENT_TIME; -- time with time zone

SELECT CURRENT_DATE; -- date


-- Further reference
-- https://neon.tech/postgresql/postgresql-date-functions/postgresql-current_date



--- CTE - Common table expression
WITH my_table AS (
	SELECT customer_id, DATE(payment_date) pay_date, SUM(amount)
	FROM payment
	GROUP BY customer_id, DATE(payment_date)
	ORDER BY pay_date,customer_id
)
SELECT sum,pay_date FROM my_table 
WHERE pay_date BETWEEN '2007-04-01' AND '2007-04-15';


SELECT sum,pay_date FROM (
	SELECT customer_id, DATE(payment_date) pay_date, SUM(amount)
	FROM payment
	GROUP BY customer_id, DATE(payment_date)
	ORDER BY pay_date,customer_id
) AS my_table2;



WITH my_table AS (
	SELECT customer_id, DATE(payment_date) pay_date, SUM(amount)
	FROM payment
	GROUP BY customer_id, DATE(payment_date)
	ORDER BY pay_date,customer_id
)
SELECT sum per_day_amount,pay_date,pay_date + INTERVAL '0 hour' 
FROM my_table 
WHERE pay_date BETWEEN '2007-04-01' AND '2007-04-15';


WITH my_table AS (
	SELECT customer_id, DATE(payment_date) pay_date, SUM(amount)
	FROM payment
	GROUP BY customer_id, DATE(payment_date)
	ORDER BY pay_date,customer_id
)
SELECT sum per_day_amount,pay_date + INTERVAL '0 hour' AS payment_timestamp
FROM my_table 
WHERE pay_date BETWEEN '2007-04-01' AND '2007-04-15';



SELECT DATE('2007-04-01') + INTERVAL '0 hour' 


-- customer, staff, rental
SELECT * FROM payment;

SELECT * FROM staff;

-- store, address
SELECT * FROM customer;

SELECT p.amount, c.first_name, c.last_name,p.*
FROM payment p
JOIN customer c
ON p.customer_id=c.customer_id;


SELECT p.amount, c.first_name, c.last_name,
CONCAT_WS(' ',s.first_name,s.last_name) staff_name
FROM payment p
JOIN customer c ON c.customer_id=p.customer_id
JOIN staff s ON s.staff_id=p.staff_id

SELECT * FROM rental;

SELECT p.amount, c.first_name, c.last_name,
CONCAT_WS(' ',s.first_name,s.last_name) staff_name,
r.rental_date, r.return_date,r.inventory_id
FROM payment p
JOIN customer c ON c.customer_id=p.customer_id
JOIN staff s ON s.staff_id=p.staff_id
JOIN rental r ON r.rental_id=p.rental_id;

SELECT * FROM inventory;
SELECT * FROM film;


-- customer and address: First Name, last name, email, mobile number
-- payment: amount
-- rental: rental_duration (r.return_date - r.rental_date)
-- inventory and film: film_title, release year
-- staff: staff_name








