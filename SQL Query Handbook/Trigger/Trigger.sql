-- Trigger
-- When an event happens, do something
-- ex. (INSERT, UPDATE , DELETE)
-- checks data, handles error

-- Add salary column
ALTER TABLE employees
ADD COLUMN salary DECIMAL(10, 2) AFTER hourly_pay;
SELECT * FROM employees;

UPDATE employees
SET salary = hourly_pay * 2080;
SELECT * FROM employees;

-- Creates a trigger whenever there is an update to the employee, the salary will be updated 
CREATE TRIGGER before_hourly_pay_update
BEFORE UPDATE ON employees
FOR EACH ROW
SET NEW.salary = (NEW.hourly_pay * 2080);

SHOW TRIGGERS;
SELECT * FROM employees;

-- test the trigger
UPDATE employees
SET hourly_pay = 50
WHERE employee_id = 1;
SELECT * FROM employees;

-- test the trigger
UPDATE employees
SET hourly_pay = hourly_pay + 1;
SELECT * FROM employees;

DELETE FROM employees 
WHERE employee_id = 6;
SELECT * FROM employees;

-- Creates a trigger whenever a new record is inserted to the employees table, the new record will have its salary automatically computed
CREATE TRIGGER before_hourly_pay_insert
BEFORE INSERT ON employees
FOR EACH ROW
SET NEW.salary = (NEW.hourly_pay * 2080);

-- test the trigger
INSERT INTO employees
VALUES (6, "Sheldon", "Plankton", 10, NULL, "Janitor", "2023-01-07", 5);
SELECT * FROM employees;

CREATE TABLE expenses(
	expense_id INT PRIMARY KEY,
    expense_name VARCHAR(50),
    expense_total DECIMAL(10, 2)
);
SELECT * FROM expenses;

INSERT INTO expenses
VALUES (1, "Salary", "0"),
	(2, "Supplies", "0"),
	(3, "Taxes", "0");

UPDATE expenses
SET expense_total = (SELECT SUM(salary) FROM employees) 
WHERE expense_name = "Salary";
SELECT * FROM expenses;

-- Creates a trigger whenever a record is deleted in the employees table, the expense total will be updated.
CREATE TRIGGER after_salary_delete
AFTER DELETE ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total - OLD.salary
WHERE expense_name = "Salary";

-- test the trigger
DELETE FROM employees
WHERE employee_id = 6;
SELECT * FROM expenses;

-- Creates a trigger whenever a record is inserted to the employees table, a new expense total will be calculated
CREATE TRIGGER after_salary_insert
AFTER INSERT ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total + NEW.salary
WHERE expense_name = "Salary";

-- test the trigger
INSERT INTO employees
VALUES (6, "Sheldon", "Plankton", 10, NULL, "Janitor", "2023-01-07", 5);
SELECT * FROM expenses;

-- Creates a trigger whenever a record is updated in the employees table, a new expense total will be calculated
CREATE TRIGGER after_salary_update
AFTER UPDATE ON employees 
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total + (NEW.salary - OLD.salary)
WHERE expense_name = "salaries";

-- test the trigger
UPDATE employees 
SET hourly_pay = 100
WHERE employee_id = 1;
SELECT * FROM expenses;

