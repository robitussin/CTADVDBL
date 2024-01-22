-- ON DELETE NOT NULL
-- When a foreign key is deleted, replace FK with NULL

-- ON DELETE CASCADE
-- When a foreign key is deleted, delete a row

SELECT * FROM transactions;
SELECT * FROM customers;

-- will result in an error
-- "cannot delete or update a parent row: a foreign key constraint fails"
DELETE FROM customers
WHERE customer_id = 4;

SET foreign_key_checks = 0;

DELETE FROM customers
WHERE customer_id = 4;
SELECT * FROM customers;

SET foreign_key_checks = 1;

INSERT INTO customers
VALUES (4, "Poppy", "Puff", 2, "puff@gmail.com");
SELECT * FROM customers;

-- When creating a new table
CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY,
    amount DECIMAL(5, 2),
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    ON DELETE SET NULL
);

-- When updating an existing table
CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY,
    amount DECIMAL(5, 2),
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    ON DELETE SET NULL
);

ALTER TABLE transactions DROP FOREIGN KEY transactions_ibfk_1;

ALTER TABLE transactions
ADD CONSTRAINT fk_customer_id 
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
ON DELETE SET NULL;

DELETE FROM customers
WHERE customer_id = 4;
SELECT * FROM customers;


INSERT INTO customers
VALUES (4, "Poppy", "Puff", 2, "puff@gmail.com");
SELECT * FROM customers;

SELECT * FROM transactions;

ALTER TABLE transactions DROP FOREIGN KEY fk_customer_id;

ALTER TABLE transactions 
ADD CONSTRAINT fk_transaction_id 
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
ON DELETE CASCADE;

UPDATE transactions
SET customer_id = 4
WHERE transaction_id = 1005;

DELETE FROM customers
WHERE customer_id = 4;
SELECT * FROM transactions;
