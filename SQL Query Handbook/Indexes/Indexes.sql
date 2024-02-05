-- INDEX
-- Indexes are used to find values within a specific column more quickly 
-- MySQL normally searches sequentially through a column
-- The longer the column, the more expensive the operation is

-- TRADEOFFS
-- UPDATE takes more time, SELECT takes less time

SELECT * FROM transactions;
-- The transactions table will not benefit from indexes because this table will be constantly updated with new rows.

SELECT * FROM customers;
-- The customers table will benefit from indexes as this will be updated as frequently. 

SHOW INDEXES from customers;

CREATE INDEX last_name_idx
ON customers(last_name);

SHOW INDEXES from customers;

SELECT * FROM customers
WHERE last_name = "Krabs";

-- Multi-column index
CREATE INDEX last_name_first_name_idx
ON customers(last_name, first_name);

SHOW INDEXES from customers;

-- remove an index
ALTER TABLE customers
DROP INDEX last_name_idx;

SHOW INDEXES from customers;

SELECT * FROM customers
WHERE last_name = "Krabs" AND first_name = "Pearl";
