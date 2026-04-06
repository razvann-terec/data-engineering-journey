INSERT INTO customers (id, first_name)
VALUES 
	(9, 'Sara'); -- you can skip columns that allow NULL values

SELECT*
FROM customers;

-- SQL TASK: Copy data from 'customers' table into 'persons'.
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT
id,
first_name,
NULL,
'Unknown'
FROM customers;

SELECT*
FROM persons;

-- SQL TASK: Change te score of customer with ID=6 to 0,

UPDATE customers
SET score=0
WHERE id=6;

-- SQL TASK: Change the score of customer with ID 10 to 0 and update the country to UK.

UPDATE customers
SET score=0, 
	country='UK'
WHERE id=10;

-- SQL TASK: Upadate all customers with a NULL score by setting their score to 0

UPDATE customers
SET score=0
WHERE score IS NULL;

-- SQL TASK: Delete all customers with an ID greater than 5

DELETE FROM customers
WHERE id>5;

-- SQL TASK: DELETE all data from table persons.

TRUNCATE TABLE persons;

SELECT*
FROM persons;