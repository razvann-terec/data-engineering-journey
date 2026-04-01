-- This is a comment
/* This is a commnet too */

-- TASK: Retrieve all customer data

SELECT* 
FROM customers;

-- TASK: Retreive all order data

SELECT*
FROM orders;

-- TASK: Retrieve each customer's name, country and score
SELECT*
FROM customers;

SELECT 
first_name,
country,
score
FROM customers;

-- TASK: Retrieve custmers with a score not equal to 0

SELECT*
FROM customers
WHERE score != 0;

-- TASK: Retrieve customers from Germany

SELECT
first_name,
country
FROM customers
WHERE country = 'Germany';

-- TASK: Retrieve all customers and sort the results by the highest score first

SELECT*
FROM customers
ORDER BY score DESC;

-- TASK: Retrieve all customers and sort the results by the lowest score first

SELECT*
FROM customers
ORDER BY score ASC;

-- TASK: Retrieve all customers and sort the result by the country and then by the highest score

SELECT*
FROM customers
ORDER BY country ASC, score DESC

-- TASK: Find the total score for each country

SELECT
country,
SUM(score) as total
FROM customers
GROUP BY country;

-- TASK: Find the total score and total number of customers for each country

SELECT
country,
SUM(score) as total_score,
COUNT(id) as number_of_customers
FROM customers
GROUP BY country;

-- TASK: Find the average score for each country considering only customers with a score not equal to 0
-- and return only those countries with an average score greater than 430
SELECT*
FROM customers

SELECT
country,
AVG(score) as average_score
FROM customers
WHERE score !=0
GROUP BY country
HAVING AVG(score) > 430;

-- TASK: Return unique list of all countries

SELECT DISTINCT country
FROM customers;

-- TASK: Retrieve only 3 customers

SELECT TOP 3 *
FROM customers;

-- TASK: Retrieve the top 3 custmers with the highest score

SELECT TOP 3*
FROM customers
ORDER BY score DESC;

-- TASK: Retrieve the lowest 2 customers based on the score

SELECT TOP 2*
FROM customers
ORDER BY score ASC;



