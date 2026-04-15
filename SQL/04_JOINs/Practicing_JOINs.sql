-- Practicing JOINs

/* 1. SQL Task:
Return each order together with the customer who placed it.

Display:
- order_id
- first_name
- country

Sample Data:
Use these tables from SalesDB:
- customers(id, first_name, country, score)
- orders(id, customer_id, order_date, sales) */

-- INNER JOIN, ONLY matching data from left (Orders) and from the right (Customers)

SELECT
	o.OrderID AS order_id,
	c.FirstName AS first_name,
	c.Country AS country
FROM Sales.Orders AS o
INNER JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID;

/* 2. SQL Task:
Return all customers together with their orders, including customers
who did not place any order.

Display:
- customer_id
- first_name
- order_id
- sales

Sample Data:
Use these tables from SalesDB:
- customers(CustomerID, FirstName, Country, Score)
- orders(OrderID, CustomerID, OrderDate, Sales) */

-- LEFT JOIN, all rows from left (Customers) and only matching data from right (Orders)

SELECT
	c.CustomerID AS customer_id,
	c.FirstName AS first_name,
	o.OrderID AS order_id,
	o.Sales AS sales
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
ON c.CustomerID = o.CustomerID;


/* 3. SQL Task:
Return all customers from Germany together with their orders.
Include also customers from Germany who did not place any order.

Display:
- customer_id
- first_name
- country
- order_id
- sales

Sample Data:
Use these tables from SalesDB:
- customers(CustomerID, FirstName, Country, Score)
- orders(OrderID, CustomerID, OrderDate, Sales) */

-- LEFT JOIN, all rows from left (Customers) and only matching data from right (Orders) + WHERE to filter the country ('Germany')
SELECT 
	c.CustomerID AS customer_id,
	c.FirstName AS first_name,
	c.Country AS country,
	o.OrderID AS order_id,
	o.Sales AS sales
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
ON c.CustomerID = o.CustomerID
WHERE c.Country = 'Germany';

/* 4. SQL Task:
Return all customers who did not place any order.

Display:
- customer_id
- first_name
- country

Sample Data:
Use these tables from SalesDB:
- customers(CustomerID, FirstName, Country, Score)
- orders(OrderID, CustomerID, OrderDate, Sales)
*/

-- LEFT ANTI JOIN, unmatching data from left (Customers) into the the right (Orders) 

SELECT 
	c.CustomerID AS customer_id,
	c.FirstName AS first_name,
	c.Country AS country
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL; -- LEFT ANTI JOIN logic: keep only customers with no matching orders


/* 5. SQL Task:
Return all customers together with the number of orders they placed.
Include also customers who did not place any order.

Display:
- customer_id
- first_name
- order_count

Sample Data:
Use these tables from SalesDB:
- customers(CustomerID, FirstName, Country, Score)
- orders(OrderID, CustomerID, OrderDate, Sales)
*/

-- LEFT JOIN, all rows from left (Customers) and only matching data from right (Orders) + GROUP BY AND COUNT to count the orders

SELECT 
	c.CustomerID AS customer_id,
	c.FirstName AS first_name,
	COUNT(o.OrderID) AS order_count 
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName;

/* 6. SQL Task:
Return the customers who placed at least 2 orders.

Display:
- customer_id
- first_name
- order_count

Sample Data:
Use these tables from SalesDB:
- customers(CustomerID, FirstName, Country, Score)
- orders(OrderID, CustomerID, OrderDate, Sales) 
*/

-- INNER JOIN, ONLY matching data from left (Customers) and from the right (Orders) + GROUP BY, COUNT and HAVING to count and filter the number of orders for each customer

SELECT 
	c.CustomerID AS customer_id,
	c.FirstName AS first_name,
	COUNT(o.OrderID) AS order_count
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName
HAVING COUNT(o.OrderID) >= 2;

/* 7. SQL Task:
Return the customers from Germany who placed at least 2 orders.

Display:
- customer_id
- first_name
- country
- order_count

Sample Data:
Use these tables from SalesDB:
- customers(CustomerID, FirstName, Country, Score)
- orders(OrderID, CustomerID, OrderDate, Sales)
*/


-- INNER JOIN, ONLY matching data from left (Customers) and from the right (Orders) + GROUP BY, COUNT and HAVING to count and filter the number of orders and the country

SELECT
	c.CustomerID AS customer_id,
	c.FirstName AS first_name,
	c.Country AS country,
	COUNT(o.OrderID) AS order_count
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
ON c.CustomerID = o.CustomerID
WHERE c.Country = 'Germany'
GROUP BY c.CustomerID, c.FirstName, c.Country
HAVING COUNT(o.OrderID) >= 2;

/* 8. SQL Task:
Return all customers and all orders, including:
- matched rows
- customers without orders
- orders without customers

Display:
- customer_id
- first_name
- order_id
- sales

Sample Data:
Use these tables from SalesDB:
- customers(CustomerID, FirstName, Country, Score)
- orders(OrderID, CustomerID, OrderDate, Sales)
*/

-- FULL JOIN, all rows from both tables

SELECT
	c.CustomerID AS customer_id,
	c.FirstName AS first_name,
	o.OrderID AS order_id,
	o.Sales AS sales
FROM Sales.Customers AS c
FULL JOIN Sales.Orders AS o
ON c.CustomerID = o.CustomerID;

/* 9. SQL Task:
Return only the non-matching rows from both tables:
- customers without orders
- orders without customers

Display:
- customer_id
- first_name
- order_id
- sales

Sample Data:
Use these tables from SalesDB:
- customers(CustomerID, FirstName, Country, Score)
- orders(OrderID, CustomerID, OrderDate, Sales)
*/

-- FULL ANTI JOIN logic: return only non-matching rows from both tables

SELECT
	c.CustomerID AS customer_id,
	c.FirstName AS first_name,
	o.OrderID AS order_id,
	o.Sales AS sales
FROM Sales.Customers AS c
FULL JOIN Sales.Orders AS o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL OR c.CustomerID IS NULL; -- to be FULL ANTI JOIN 

/* 10. SQL Task:
Return all customers together with their orders, including customers
who did not place any order.
Show only orders where sales are greater than 30, but still keep
customers without any order.

Display:
- customer_id
- first_name
- order_id
- sales

Sample Data:
Use these tables from SalesDB:
- customers(CustomerID, FirstName, Country, Score)
- orders(OrderID, CustomerID, OrderDate, Sales)
*/

-- LEFT JOIN, all rows from left (Customers) and only matching data from right (Orders) + AND operator to filter the Sales

SELECT
	c.CustomerID AS customer_id,
	c.FirstName AS first_name,
	o.OrderID AS order_id,
	o.Sales AS sales
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
ON c.CustomerID = o.CustomerID AND o.Sales > 30;

/* 11. SQL Task:
Return all customers together with the total sales of their orders.
Include also customers who did not place any order.

Display:
- customer_id
- first_name
- total_sales

Sample Data:
Use these tables from SalesDB:
- customers(CustomerID, FirstName, Country, Score)
- orders(OrderID, CustomerID, OrderDate, Sales)
*/

-- LEFT JOIN, all rows from left (Customers) and only matching data from right (Orders) + GROUP BY AND SUM to see the total_sales per customer

SELECT
	c.CustomerID AS customer_id,
	c.FirstName AS first_name,
	SUM(o.Sales) AS total_sales
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName;

/* 12. SQL Task:
Return the customers who placed no order at all or placed only orders
with sales less than 30.

Display:
- customer_id
- first_name
- country

Sample Data:
Use these tables from SalesDB:
- customers(CustomerID, FirstName, Country, Score)
- orders(OrderID, CustomerID, OrderDate, Sales)
*/

-- LEFT ANTI JOIN, unmatching data from left (Customers) into the the right (Orders) + a condition to exclude customers with sales >= 30 to see the other ones

SELECT
    c.CustomerID AS customer_id,
    c.FirstName AS first_name,
    c.Country AS country
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
ON c.CustomerID = o.CustomerID AND o.Sales >= 30
WHERE o.CustomerID IS NULL;