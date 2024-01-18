-- UNION combines the results of two or more SELECT statements
CREATE TABLE income (  income_name VARCHAR(50),     amount DECIMAL(10,2) )

INSERT INTO income (income_name, amount) VALUES ("orders", 1000.00),  ("merchandise", 5000.00),     ("services", 12500.00)

CREATE TABLE expenses (  expense_name VARCHAR(50),     amount DECIMAL(10,2) )

INSERT INTO income (income_name, amount) VALUES ("wages", 3000.00),  ("tax", 4000.00),     ("repairs", 10500.00)

SELECT * FROM income UNION SELECT * FROM expenses

SELECT * FROM employees UNION SELECT * FROM customers

SELECT first_name, last_name FROM employees UNION SELECT first_name, last_name FROM customers
