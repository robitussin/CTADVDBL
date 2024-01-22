-- ROLLUP
-- extension of the GROUP BY clause
-- produces another row and shows the grand total (super aggregate value)

-- Get the total amount of transactions per order date
SELECT SUM(amount), order_date
FROM transactions
GROUP BY order_date;

-- Get the grand total amount of transactions per order date
SELECT SUM(amount), order_date
FROM transactions
GROUP BY order_date WITH ROLLUP;

-- Get the total number of transactions per order date
SELECT COUNT(transaction_id), order_date
FROM transactions
GROUP BY order_date WITH ROLLUP;

-- Get the total number of transactions per customer
SELECT COUNT(transaction_id) AS "# of orders", customer_id
FROM transactions
GROUP BY customer_id WITH ROLLUP;

-- How much are is your business paying each employee per hour?
SELECT SUM(hourly_pay) AS "hourly pay", employee_id
FROM employees
GROUP BY employee_id WITH ROLLUP;
