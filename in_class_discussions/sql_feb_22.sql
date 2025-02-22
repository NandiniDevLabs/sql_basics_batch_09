
-- Sub queries --> Nested queries and correlated queries


SELECT * FROM customer2;
SELECT * FROM address2;

-- Sub queries --> Nested queries and correlated queries

-- Requirement: Get the list of customers whose address is not available

-- Customers having address details
SELECT address_id FROM address2;
SELECT * FROM customer2 WHERE address_id IN(
	SELECT address_id FROM address2
);

-- Customers not having address details
SELECT * FROM customer2 WHERE address_id NOT IN(
	SELECT address_id FROM address2
);


------- Sub queries: correlated queries

-- Customers having address details
SELECT * FROM customer2 c WHERE EXISTS (
	SELECT address_id FROM address2 a
		WHERE a.address_id = c.address_id
);


SELECT * FROM customer2 c WHERE EXISTS (
	SELECT * FROM address2 a
		WHERE a.address_id = c.address_id
);


-- Customers not having address details
SELECT * FROM customer2 c WHERE NOT EXISTS(
	SELECT * FROM address2 a
		WHERE a.address_id = c.address_id
);




SELECT EXISTS (
	SELECT * FROM address2 a WHERE a.address_id = 1000
)





