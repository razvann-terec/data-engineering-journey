-- SQL ADVANCED JOINS

-- LEFT ANTI JOIN

-- SQL TASK: Get all customers who have not placed any order.

SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id=o.customer_id
WHERE o.customer_id IS NULL;

-- RIGHT ANTI JOIN

-- SQL TASK: Get all orders without matching customers.

SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id=o.customer_id
WHERE c.id IS NULL;

-- We can do it with LEFT ANTI JOIN for the same results.

SELECT *
FROM orders AS o 
LEFT JOIN customers AS c
ON c.id=o.customer_id
WHERE c.id IS NULL;

-- FULL ANTI JOIN

-- SQL TASK: Find customers without orders and orders without customers.

SELECT *
FROM orders AS o 
FULL JOIN customers AS c
ON c.id=o.customer_id
WHERE c.id IS NULL OR o.customer_id IS NULL;


-- Challenge: Get all customers along with their orders, but only for customers who have placed an order.
-- WITOUT USING INNER JOIN!

SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.order_id IS NOT NULL;

-- CROSS JOIN

-- SQL TASK: Generate all possible combinations of customers and orders

SELECT *
FROM customers
CROSS JOIN orders

-- Challenge: Using SalesDB, Retrieve a list of all orders, along with the related customer, product and employee detail
-- For each order display order id, customer's name, product name, sales amount, product price, salesperson's name.

SELECT
	o.OrderID,
	o.Sales,
	c.FirstName AS CustomerFirstName,
	c.LastName AS CustomerLastName,
	p.Product AS ProductName,
	p.Price,
	e.FirstName AS EmployeeFirstName,
	e.LastName AS EmployeeLastName
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS p
ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees AS e
ON o.SalesPersonID = e.EmployeeID






