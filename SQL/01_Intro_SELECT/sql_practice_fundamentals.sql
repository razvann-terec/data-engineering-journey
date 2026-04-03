-- Practicing the fundamentals

-- 1. Return first_name, country, and score for all customers from the customers table who are from USA, ordered by score in descending order.

SELECT
first_name,
country,
score
FROM customers
WHERE country = 'USA'
ORDER BY score DESC;

-- 2. Return the top 3 customers with a score greater than 0, showing first_name, country, and score, ordered by score in descending order.

SELECT TOP 3
first_name,
country,
score
FROM customers
WHERE score > 0
ORDER BY score DESC;

-- 3. Return all unique countries from the customers table, ordered alphabetically.

SELECT DISTINCT
country
FROM customers
ORDER BY country ASC;

-- 4. Return the number of customers in each country. Show country and the count as customer_count. 
--    Order the result by customer_count in descending order.

SELECT
country,
COUNT(id) as customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC;

-- 5. Return the average score for each country. Show country and the average score as avg_score. 
--Order the result by avg_score in descending order.

SELECT 
country,
AVG(score) as avg_score
FROM customers
GROUP BY country
ORDER BY avg_score DESC;

-- 6. Return the countries where the average score is greater than 430. 
-- Show country and the average score as avg_score. Order the result by avg_score in descending order.

SELECT
country,
AVG(score) as avg_score
FROM customers
GROUP BY country
HAVING AVG(score) > 430
ORDER BY avg_score DESC;

-- 7. Return the number of customers in each country, but show only the countries that have more than 1 customer. 
-- Show country and the count as customer_count. Order the result by customer_count in descending order.

SELECT
country,
COUNT(id) as customer_count
FROM customers
GROUP BY country
HAVING COUNT(id)>1
ORDER BY customer_count DESC;

-- 8. Return the top 2 countries with the highest average score. 
-- Show country and the average score as avg_score. Order the result by avg_score in descending order.

SELECT TOP 2
country,
AVG(score) as avg_score
FROM customers
GROUP BY country
ORDER BY avg_score DESC;

-- 9. Return the lowest 2 scores from the customers table, showing first_name, country, and score. 
-- Exclude customers with a score of 0. Order the result by score in ascending order.

SELECT TOP 2
first_name,
country,
score
FROM customers
WHERE score != 0
ORDER BY score ASC;

-- 10. Return the countries where the total score of all customers is greater than 800. 
-- Show country and the total score as total_score. Order the result by total_score in descending order.

SELECT
country,
SUM(score) as total_score
FROM customers
GROUP BY country
HAVING SUM(score) > 800
ORDER BY total_score DESC;

-- 11. Return the average score for each country, but exclude customers with a score of 0. Show country and the average score as avg_score. 
-- Show only countries where the average score is greater than 400. Order the result by avg_score in descending order.

SELECT 
country,
AVG(score) as avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 400
ORDER BY avg_score DESC;

/* 12. Return the top 2 countries with the highest total score, but exclude customers with a score of 0. 
	   Show country, total score as total_score.
       Only include countries where the number of customers is greater than 1.
       Order the result by total_score in descending order. */

SELECT TOP 2
country,
SUM(score) as total_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING COUNT(id) > 1
ORDER BY total_score DESC;

/* 13. Return the countries where the total score is greater than 800 and the average score is greater than 400.
       Show contry, total score as total_score, average score as avg_score
       Order the result by total_score in descending order. */

       SELECT 
       country,
       SUM(score) as total_score,
       AVG(score) as avg_score
       FROM customers
       GROUP BY country
       HAVING SUM(score) > 800 and AVG(score) > 400
       ORDER BY total_score DESC;

/* 14. Return the countries where:
       the number of customers is greater than 1
       the total score is greater than 700
       Show country, customer count as customer_count and score as total_score
       Order the result by customer_count in descending order, then by total_score in descending order. */

       SELECT
       country,
       COUNT(id) as customer_count,
       SUM(score) as total_score
       FROM customers
       GROUP BY country
       HAVING COUNT(id) > 1 and SUM(score) > 700
       ORDER BY customer_count DESC, total_score DESC;
      
/* 15. Return the countries after excluding customers with a score of 0.
       Show country, number of remaining customers as customer_count, average score as avg_score.
       Only include countries where the number of remaining customers is greater than 1 and the average score is greater than 400
       Order the result by avg_score in descending order. */

       SELECT
       country,
       COUNT(id) as customer_count,
       AVG(score) as avg_score
       FROM customers
       WHERE score != 0
       GROUP BY country
       HAVING COUNT(id) > 1 and AVG(score) > 400
       ORDER BY avg_score DESC;

/* 16. Return the countries where, after excluding customers with score of 0 the total score is greater than 800,
       the average score is greater than 400 and the number of remaining customers is grater than 1.
       Show country, customer_count, total_score, avg_score
       ORDER the result by total_score in desceding order. */

       SELECT
       country,
       COUNT(id) as customer_count,
       SUM(score) as total_score,
       AVG(score) as avg_score
       FROM customers
       WHERE score != 0
       GROUP BY country
       HAVING SUM(score) > 800 and AVG(SCORE) > 400 and COUNT(id) > 1
       ORDER BY total_score DESC;

/* 17. Return the countries where, after excluding customers with score of 0, the average score is greater than 300,   
       the total score is greater than 700 and the number of remaining customers is greater than 1.
       Show country, customer_count, total_score, avg_score
       ORDER the result by avg_score in descending order. */

       SELECT
       country,
       COUNT(id) as customer_count,
       SUM(score) as total_score,
       AVG(score) as avg_score
       FROM customers
       WHERE score != 0
       GROUP BY country
       HAVING AVG(score) > 300 and SUM(score) > 700 and COUNT(id) > 1
       ORDER BY avg_score DESC;

/* 18. Return the top 1 country where, after excluding customers with score of 0.
       the total score is greater than 700 and the number of remaining customers is greater than 1.
       Show country, customer_count, total_score
       ORDER the result by total_score in descending order. */

       SELECT TOP 1
       country,
       SUM(score) as total_score,
       COUNT(id) as customer_count
       FROM customers
       WHERE score != 0
       GROUP BY country
       HAVING SUM(score) > 700 and COUNT(id) > 1
       ORDER BY total_score DESC

/* 19. Return the top 2 countries where, after excluding customers with score of 0.
       The total score is greater than 300 and the average score is greater than 300.
       Show country, customer_count, total_score, avg_score
       ORDER the result by avg_score in descending order. */

       SELECT TOP 2
       country,
       COUNT(id) as customer_count,
       SUM(score) as total_score,
       AVG(score) as avg_score
       FROM customers
       WHERE score !=0
       GROUP BY country
       HAVING SUM(score) > 300 and AVG(score) > 300
       ORDER BY avg_score DESC;










