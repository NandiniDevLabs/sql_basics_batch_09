SELECT * FROM payment2;
SELECT * FROM customer;

SELECT * FROM address 
ORDER BY address_id ASC LIMIT 20; -- Address_id: 1 to 20

SELECT address_id,* FROM customer 
ORDER BY address_id ASC LIMIT 50; -- Address_id: 15 to 54


CREATE TABLE customer2 AS SELECT * FROM customer 
ORDER BY address_id ASC LIMIT 50;
---
CREATE TABLE address2 AS SELECT * FROM address 
ORDER BY address_id ASC LIMIT 20;


SELECT * FROM customer2;
SELECT * FROM address2;