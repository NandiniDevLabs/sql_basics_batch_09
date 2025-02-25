

SELECT * FROM payment3;

-- Small integer range: -32,768 to +32,767

SELECT * FROM payment3 WHERE customer_id = 344;
-- UPDATE payment3 SET amount=32767 WHERE customer_id = 344;


SELECT * FROM payment3 WHERE payment_id = 17520;
UPDATE payment3 SET staff_id=32767 WHERE payment_id = 17520;


SELECT * FROM payment3 WHERE payment_id = 17520;
-- existing: 32767	new:32769
UPDATE payment3 SET staff_id=staff_id+2 WHERE payment_id = 17520;

