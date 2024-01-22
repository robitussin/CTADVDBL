-- Stored procedure
-- is a prepared SQL code that you can save.
-- This is very useful if there is a query that you write often

-- for example
SELECT DISTINCT first_name, last_name
FROM transactions
INNER JOIN customers
ON transactions.customer_id = customers.customer_id;

-- PROCEDURE 1
-- display all records in customers table
DELIMITER $$
CREATE PROCEDURE get_customers()
BEGIN
	SELECT * from customers;
END $$
DELIMITER ;

-- execute procedure
CALL get_customers();

-- delete procedure
DROP PROCEDURE get_customers;

-- PROCEDURE 2
-- find a record in customers table using customer id
DELIMITER $$
CREATE PROCEDURE find_customer(IN id INT)
BEGIN
	SELECT * FROM customers 
    WHERE customer_id = id;
END $$
DELIMITER ;

CALL find_customer(1);
CALL find_customer(2);
DROP PROCEDURE find_customer;

-- PROCEDURE 3
-- find a record in customers table using first name and last name
DELIMITER $$
CREATE PROCEDURE find_customer(IN f_name VARCHAR(50),
							   IN l_name VARCHAR(50))
BEGIN
	SELECT * FROM customers 
    WHERE first_name = f_name 
    AND last_name = l_name;
END $$
DELIMITER ;

CALL find_customer("Larry", "Lobster");