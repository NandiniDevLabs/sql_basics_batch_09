
/*
dvdrental --> schema --> public --> Tables --> Right click --> Create --> Table
General:: Name: <TABLE_NAME>
Columns:: Click on + button
          Name:
          Data Type:
          Primary Key: Enable
--> Save


Select the table created --> right click --> scripts --> create script

*/



CREATE TABLE employee
(
    employee_id integer PRIMARY KEY,
    name character varying,
    doj date,
    mobile character varying
)




SELECT * FROM payment LIMIT 500;

CREATE TABLE payment2 AS SELECT * FROM payment LIMIT 500;

SELECT * FROM payment2;
SELECT MAX(amount) FROM payment2;

----------------------------
SELECT * FROM payment2;
SELECT * FROM payment2 WHERE payment_id = 17504;

UPDATE payment2 SET amount = 15.99 WHERE payment_id = 17504;
SELECT * FROM payment2 WHERE payment_id = 17504;


SELECT * FROM payment2 WHERE customer_id = 454 and staff_id = 2;
UPDATE payment2 SET amount = NULL WHERE customer_id = 454 and staff_id = 2;

SELECT * FROM payment2 WHERE amount IS NULL;
SELECT * FROM payment2 WHERE amount IS NOT NULL;







