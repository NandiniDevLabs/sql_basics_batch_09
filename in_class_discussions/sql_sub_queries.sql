SELECT * FROM payment WHERE customer_id=343; -- payment_id -> 17512, 17513, 17514
SELECT * FROM payment WHERE payment_id IN (17512, 17513, 17514);

-- For getting 5 rows
SELECT * FROM payment WHERE customer_id=343; -- payment_ids: 17512, 17513, 17514, 17515, 17516
SELECT * FROM payment WHERE payment_id IN (17512, 17513, 17514, 17515, 17516);


-- 
SELECT * FROM payment WHERE customer_id=343;
SELECT * FROM payment WHERE customer_id=343 LIMIT 5;
SELECT payment_id FROM payment WHERE customer_id=343 LIMIT 5;

SELECT * FROM payment WHERE payment_id IN (
	SELECT payment_id FROM payment WHERE customer_id=343 LIMIT 10
);

SELECT * FROM payment WHERE payment_id IN (
	SELECT payment_id FROM payment WHERE customer_id=0 LIMIT 10
);

SELECT COUNT(*) FROM payment WHERE payment_id IN (
	SELECT payment_id FROM payment WHERE customer_id=0 LIMIT 10
);


