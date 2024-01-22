-- Views
-- a virtual table based on the result-set of an SQL statement
-- the fields in a view are fields from one or more real tables in the database
-- They're not real tables, but can be interacted with as if they were

CREATE TABLE employees (  employee_id int,  first_name VARCHAR(50),  last_name VARCHAR(50),   hourly_pay DECIMAL(5, 2), job VARCHAR(15), hire_date DATE, supervisor_id INT);	

INSERT INTO employees 
VALUES   (1, "Eugene", "Krabs", 25.50, "manager", "2023-01-02", 1), 
  (2, "Squidward", "Tentacles", 15.00, "cashier", "2023-01-03", 5),  
  (3, "Spongebob", "Squarepants", 12.50, "cook", "2023-01-04", 5),  
  (4, "Patrick", "Star", 12.50, "cook", "2023-01-05", 5),    
  (5, "Sandy", "Cheeks", 17.25, "asst. manager", "2023-01-06", 1),  
  (6, "Sheldon", "Plankton", 10.00, "Janitor", "2023-01-07", 5);
  
-- Creates a view named employee_attendance
CREATE VIEW employee_attendance AS SELECT  first_name, last_name  FROM employees;	

SELECT * FROM employee_attendance;

-- drops a view named employee_attendance
DROP VIEW employee_attendance;

CREATE TABLE customers (   customer_id int,    first_name VARCHAR(50),   last_name VARCHAR(50),     referral_id int  );

ALTER TABLE customers ADD COLUMN email VARCHAR(50);

UPDATE customers SET email = "fish@gmail.com" WHERE customer_id = 1;

UPDATE customers SET email = "larry@gmail.com" WHERE customer_id = 2;

UPDATE customers SET email = "bass@gmail.com" WHERE customer_id = 3;

UPDATE customers SET email = "puff@gmail.com" WHERE customer_id = 4;

-- Creates a view named customer_emails
CREATE VIEW customer_emails AS SELECT email FROM customers;

SELECT * FROM customer_emails;

INSERT INTO customers VALUES (5, "Pearl", "Krabs", null, "pkrabs@gmail.com");

SELECT * from customer_emails LIMIT 0, 1000;