SELECT * FROM payment3;
SELECT * FROM customer3;

-- PREPARING DATA TO UNDERSTAND SELF JOIN
SELECT customer_id, address_id FROM customer3;

SELECT customer_id, address_id FROM customer3 
WHERE customer_id != 345;
UPDATE customer3 SET address_id=341 WHERE customer_id != 345;

SELECT customer_id, address_id FROM customer3 
WHERE customer_id = 345;
UPDATE customer3 SET address_id=343 WHERE customer_id = 345;
---


-- INNER/DEFAULT  LEFT	RIGHT	FULL/FULL OUTER

-- 1. DEFAULT JOIN
SELECT c.customer_id, p.customer_id, c.first_name, p.amount
FROM customer3 c
JOIN payment3 p
ON c.customer_id = p.customer_id;
-- Output: 6 rows

-- 1. INNER JOIN
SELECT c.customer_id, p.customer_id, c.first_name, p.amount
FROM customer3 c
INNER JOIN payment3 p
ON c.customer_id = p.customer_id;
-- Output: 6 rows

-- 1. INNER JOIN - WITHOUT USING JOIN KEYWORD
SELECT c.customer_id, p.customer_id, c.first_name, p.amount
FROM customer3 c, payment3 p
WHERE c.customer_id = p.customer_id;
-- Output: 6 rows


-- 2. LEFT JOIN
SELECT c.customer_id, p.customer_id, c.first_name, p.amount
FROM customer3 c
LEFT JOIN payment3 p
ON c.customer_id = p.customer_id;
-- Output: 7 rows


-- 3. RIGHT JOIN
SELECT c.customer_id, p.customer_id, c.first_name, p.amount
FROM customer3 c
RIGHT JOIN payment3 p
ON c.customer_id = p.customer_id;
-- Output: 8 rows


-- 4. FULL JOIN
SELECT c.customer_id, p.customer_id, c.first_name, p.amount
FROM customer3 c
FULL JOIN payment3 p
ON c.customer_id = p.customer_id;
-- Output: 9 rows

-- 4. FULL OUTER JOIN
SELECT c.customer_id, p.customer_id, c.first_name, p.amount
FROM customer3 c
FULL OUTER JOIN payment3 p
ON c.customer_id = p.customer_id;
-- Output: 9 rows



-- CROSS, NATURAL, SELF

-- 5. CROSS JOIN
SELECT c.customer_id, p.customer_id, c.first_name, p.amount
FROM customer3 c
CROSS JOIN payment3 p;
-- Output: 32 rows


-- 6. NATURAL JOIN
SELECT c.customer_id, p.customer_id, c.first_name, p.amount
FROM customer3 c
NATURAL JOIN payment3 p;
-- Output: 6 rows


SELECT address_id,* FROM customer3;
-- 7. SELF JOIN
SELECT c2.address_id,*
FROM customer3 c1
JOIN customer3 c2
ON c1.customer_id = c2.address_id;
-- Output: 4 rows

/*
-- DATA PREPARATION FOR ASSIGNMENT
1. Create table payment4 from payment table with 10 to 20 rows 
2. Update staff_id column name to store_id for payment4 table
3. Create table customer4 from customer table with 6 to 15 rows 

Note: Some customer IDs should be common in both tables, 
some customer IDs should be present only in payment4 table and 
lastly some customer IDs should be present only in customer4 table.

-- ASSIGNMENT 1:
Apply all types of join to payment4 and customer4 tables,
by using both customer_id and store_id columns.
Give row count of output tables.
*/

/*
-- ASSIGNMENT 2:
Apply all types of join to customer2 and address2 tables.
Give row count of output tables.
*/


SELECT DISTINCT staff_id FROM payment;
SELECT DISTINCT store_id FROM customer;


