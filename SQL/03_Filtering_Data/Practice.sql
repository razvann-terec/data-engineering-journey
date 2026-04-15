-- Practicing Operators

-- Challenge 1: Return all customers whose score is greater than 500 and who are from Germany.
 
SELECT *
FROM customers
WHERE score > 500 AND country = 'Germany';

-- Challenge 2: Return the first_name, country and score of customers whose country is either Germany or USA and whose score is between 300 and 800.

SELECT
	first_name,
	country,
	score
FROM customers
WHERE country IN ('Germany', 'USA') AND score BETWEEN 300 AND 800;

-- Challenge 3: Return all customers whose first_name starts with M.

SELECT*
FROM customers
WHERE first_name LIKE 'M%';

-- Challenge 4: Return all customers whose first_name contains the letter a and whose country is not USA.

SELECT*
FROM customers
WHERE first_name LIKE '%a%' AND country <> 'USA';

-- Challenge 5: Return the countries where the average score is greater than 400.
-- Display country and average score.

SELECT
	country,
	AVG(score) as avg_score
FROM customers
GROUP BY country
HAVING AVG(score) > 400;

-- Challenge 6: Return the countries where, after excluding customers with score equal to 0, the number of customers is at least 2.
-- Display country and customer_count

SELECT
	country,
	COUNT(id) as customer_count
FROM customers
WHERE score <> 0
GROUP BY country
HAVING COUNT(id) >= 2;


