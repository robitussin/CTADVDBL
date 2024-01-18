-- SUBQUERY
-- A QUERY WITHIN A QUERY


SELECT first_name, last_name, hourly_pay,
	(SELECT AVG(hourly_pay) from employees) as avg_pay
FROM employees;


SELECT first_name, last_name, hourly_pay
FROM employees
WHERE hourly_pay > (SELECT AVG(hourly_pay) from employees);
