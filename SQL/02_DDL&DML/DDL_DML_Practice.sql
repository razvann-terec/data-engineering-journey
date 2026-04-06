-- SQL Task:
-- 1. Create a table named students with these columns:
--    - student_id INT PRIMARY KEY
--    - name VARCHAR(50) NOT NULL
--    - email VARCHAR(100)
--    - age INT
--
-- 2. Insert the following 3 rows into the table:
--    - (1, 'Ana', 'ana@gmail.com', 24)
--    - (2, 'Razvan', 'razvan@gmail.com', 20)
--    - (3, 'Maria', 'maria@gmail.com', 22)
--
-- Requirements:
-- - Use DDL to create the table
-- - Use DML to insert the data

CREATE TABLE students (
student_id INT NOT NULL, 
name VARCHAR(50) NOT NULL,
email VARCHAR(100),
age INT,
CONSTRAINT pk_students PRIMARY KEY (student_id) -- Equals to student_id INT PRIMARY KEY
);

INSERT INTO students (student_id, name, email, age)
VALUES 
(1, 'ANA', 'ana@gmail.com', 24),
(2, 'Razvan', 'razvan@gmail.com', 20),
(3, 'Maria', 'maria@gmail.com', 22);

/*SQL Task:
1. Add a new column named city to the students table:
   - city VARCHAR(50)

2. Update the rows so that:
   - student_id = 1 -> city = 'Cluj'
   - student_id = 2 -> city = 'Cluj'
   - student_id = 3 -> city = 'Bucuresti'

3. Delete the student with:
   - student_id = 2

4. Display the final table

Sample Data:
- Use the existing students table from Challenge 1 */

ALTER TABLE students
ADD city VARCHAR(50);

UPDATE students
SET city = 'Cluj'
WHERE student_id=1;

UPDATE students
SET city = 'Cluj'
WHERE student_id=2;

UPDATE students
SET city = 'Bucuresti'
WHERE student_id=3;

DELETE FROM students
WHERE student_id=2;

SELECT *
FROM students;

/* SQL Task:
1. Add a new column named status to the students table:
   - status VARCHAR(20)

2. Set:
   - student_id = 1 -> status = 'active'
   - student_id = 3 -> status = 'inactive'

3. Insert one new student:
   - (4, 'Elena', 'elena@gmail.com', 21, 'Iasi', 'active')

4. Show the final table

Sample Data:
- Use the existing students table from Challenge 2*/

ALTER TABLE students
ADD status VARCHAR(20);

UPDATE students
SET status = 'active'
WHERE student_id=1;

UPDATE students 
SET status = 'inactive'
WHERE student_id=3;

INSERT INTO students
VALUES
(4, 'Elena', 'elena@gmail.com', 21, 'Iasi', 'active');


SELECT *
FROM students;

/*SQL Task:
1. Add a new column named registration_date to the students table:
   - registration_date DATE

2. Set:
   - student_id = 1 -> '2026-04-01'
   - student_id = 3 -> '2026-04-02'
   - student_id = 4 -> '2026-04-03'

3. Delete the student with:
   - student_id = 3

4. Show the final table

Sample Data:
- Use the existing students table from Challenge 3 */

ALTER TABLE students
ADD registration_date DATE;

UPDATE students
SET registration_date = '2026-04-01'
WHERE student_id=1;

UPDATE students
SET registration_date = '2026-04-02'
WHERE student_id=3;

UPDATE students
SET registration_date = '2026-04-03'
WHERE student_id=4;

DELETE FROM students
WHERE student_id=3;

SELECT *
FROM students;

/*SQL Task:
1. Add a new column named grade to the students table:
   - grade DECIMAL(4,2)

2. Set:
   - student_id = 1 -> grade = 9.50
   - student_id = 4 -> grade = 8.75

3. Insert one new student:
   - (5, 'Victor', 'victor@gmail.com', 23, 'Timisoara', 'active', '2026-04-04', 7.80)

4. Show the final table

Sample Data:
- Use the existing students table from your previous exercises */

ALTER TABLE students
ADD grade DECIMAL (4, 2);

UPDATE students
SET grade=9.50
WHERE student_id=1;

UPDATE students
SET grade=8.75
WHERE student_id=4;

INSERT INTO students (student_id, name, email, age, city, status, registration_date, grade)
VALUES 
(5, 'Victor', 'victor@gmail.com', 23, 'Timisoara', 'active', '2026-04-04', 7.80);

SELECT *
FROM students;

/* SQL Task:
1. Add a new column named scholarship to the students table:
   - scholarship BIT

2. Set:
   - student_id = 1 -> scholarship = 1
   - student_id = 4 -> scholarship = 1
   - student_id = 5 -> scholarship = 0

3. Update the city of student_id = 5 to:
   - 'Cluj'

4. Delete the student with:
   - student_id = 1

5. Show the final table

Sample Data:
- Use the existing students table from your previous exercises */

ALTER TABLE students
ADD scholarship BIT;

UPDATE students
SET scholarship=1
WHERE student_id=1;

UPDATE students
SET scholarship=1
WHERE student_id=4;

UPDATE students
SET scholarship=0
WHERE student_id=5;

UPDATE students
SET city='Cluj'
WHERE student_id=5;

DELETE FROM students
WHERE student_id=1;

SELECT *
FROM students;

/*SQL Task:
1. Create a new table named courses with these columns:
   - course_id INT PRIMARY KEY
   - course_name VARCHAR(50) NOT NULL
   - teacher_name VARCHAR(50) NOT NULL
   - duration_weeks INT

2. Insert these rows:
   - (1, 'SQL Basics', 'Popescu', 6)
   - (2, 'Python Basics', 'Ionescu', 8)
   - (3, 'Data Modelling', 'Georgescu', 4)

3. Add a new column:
   - status VARCHAR(20)

4. Set:
   - course_id = 1 -> status = 'active'
   - course_id = 2 -> status = 'active'
   - course_id = 3 -> status = 'planned'

5. Delete the course with:
   - course_id = 3

6. Show the final table

Sample Data:
- Use only the data above */

CREATE TABLE courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(50) NOT NULL,
teacher_name VARCHAR(50) NOT NULL,
durations_weeks INT
);

INSERT INTO courses (course_id, course_name, teacher_name, durations_weeks)
VALUES
(1, 'SQL Basics', 'Popescu', 6),
(2, 'Python Basics', 'Ionescu', 8),
(3, 'Data Modelling', 'Georgescu', 4);

ALTER TABLE courses
ADD status VARCHAR(20);

UPDATE courses
SET status='active'
WHERE course_id=1;

UPDATE courses
SET status='active'
WHERE course_id=2;

UPDATE courses
SET status='planned'
WHERE course_id=3;

DELETE FROM courses
WHERE course_id=3;

SELECT *
FROM courses;

/* SQL Task:
1. Create a new table named employees with these columns:
   - employee_id INT PRIMARY KEY
   - full_name VARCHAR(60) NOT NULL
   - department VARCHAR(30) NOT NULL
   - salary DECIMAL(8,2)
   - hire_date DATE

2. Insert these rows:
   - (1, 'Ana Pop', 'HR', 4500.00, '2026-01-10')
   - (2, 'Razvan Muresan', 'IT', 6200.00, '2026-02-15')
   - (3, 'Maria Ionescu', 'Finance', 5800.00, '2026-03-01')

3. Add a new column:
   - is_active BIT

4. Set:
   - employee_id = 1 -> is_active = 1
   - employee_id = 2 -> is_active = 1
   - employee_id = 3 -> is_active = 0

5. Update:
   - employee_id = 3 -> department = 'Accounting'

6. Delete:
   - employee_id = 1

7. Show the final table

Sample Data:
- Use only the data above */

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
full_name VARCHAR(60) NOT NULL,
department VARCHAR(30) NOT NULL,
salary DECIMAL(8,2),
hire_date DATE
);

INSERT INTO employees (employee_id, full_name, department, salary, hire_date)
VALUES
(1, 'Ana Pop', 'HR', 4500.00, '2026-01-10'),
(2, 'Razvan Muresan', 'IT', 6200.00, '2026-02-15'),
(3, 'Maria Ionescu', 'Finance', 5800.00, '2026-03-01');

ALTER TABLE employees
ADD is_active BIT

UPDATE employees
SET is_active=1
WHERE employee_id=1;

UPDATE employees
SET is_active=1
WHERE employee_id=2;

UPDATE employees
SET is_active=0
WHERE employee_id=3;

UPDATE employees
SET department='Accounting'
WHERE employee_id=3;

DELETE FROM employees
WHERE employee_id=1;

SELECT *
FROM employees;

/*SQL Task:
1. Create a table named products with these columns:
   - product_id INT PRIMARY KEY
   - product_name VARCHAR(50) NOT NULL
   - category VARCHAR(30) NOT NULL
   - price DECIMAL(8,2)
   - stock INT

2. Insert these rows:
   - (1, 'Laptop', 'Electronics', 3500.00, 10)
   - (2, 'Mouse', 'Electronics', 120.00, 25)
   - (3, 'Desk', 'Furniture', 800.00, 5)

3. Add a new column:
   - available BIT

4. Set:
   - product_id = 1 -> available = 1
   - product_id = 2 -> available = 1
   - product_id = 3 -> available = 0

5. Update:
   - product_id = 2 -> price = 135.00
   - product_id = 3 -> stock = 7

6. Delete:
   - product_id = 1

7. Show the final table

Sample Data:
- Use only the data above */

CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(50) NOT NULL,
category VARCHAR(50) NOT NULL,
price DECIMAL(8,2),
stock INT
);

INSERT INTO products (product_id, product_name, category, price, stock)
VALUES
(1, 'Laptop', 'Electronics', 3500.00, 10),
(2, 'Mouse', 'Electronics', 120.00, 25),
(3, 'Desk', 'Furniture', 800.00, 5);

ALTER TABLE products
ADD available BIT;

UPDATE products
SET available=1
WHERE product_id=1;

UPDATE products
SET available=1
WHERE product_id=2;

UPDATE products
SET available=0
WHERE product_id=3;

UPDATE products
SET price=135.00
WHERE product_id=2;

UPDATE products
SET stock=7
WHERE product_id=3

DELETE FROM products
WHERE product_id=1;

SELECT *
FROM products;

/* SQL Task:
1. Create a table named departments with these columns:
   - department_id INT PRIMARY KEY
   - department_name VARCHAR(40) NOT NULL
   - floor_number INT

2. Insert these rows:
   - (1, 'HR', 2)
   - (2, 'IT', 4)
   - (3, 'Finance', 3)

3. Add two new columns:
   - manager_name VARCHAR(50)
   - is_open BIT

4. Set:
   - department_id = 1 -> manager_name = 'Popescu', is_open = 1
   - department_id = 2 -> manager_name = 'Ionescu', is_open = 1
   - department_id = 3 -> manager_name = 'Georgescu', is_open = 0

5. Update:
   - department_id = 3 -> floor_number = 5

6. Delete:
   - department_id = 1

7. Show the final table

Sample Data:
- Use only the data above */

CREATE TABLE departments(
department_id INT PRIMARY KEY,
department_name VARCHAR(40) NOT NULL,
floor_number INT
);

INSERT INTO departments (department_id, department_name, floor_number)
VALUES
(1, 'HR', 2),
(2, 'IT', 4),
(3, 'Finance', 3);

ALTER TABLE departments
ADD manager_name VARCHAR(50), 
	is_open BIT;

UPDATE departments
SET manager_name='Popescu', 
	is_open=1
WHERE department_id=1;

UPDATE departments
SET manager_name='Ionescu', 
	is_open=1
WHERE department_id=2;

UPDATE departments
SET manager_name='Georgescu', 
	is_open=0
WHERE department_id=3;

UPDATE departments
SET floor_number=5
WHERE department_id=3;

DELETE FROM departments
WHERE department_id=1;

SELECT *
FROM departments;

/* SQL Task:
1. Create a table named projects with these columns:
   - project_id INT PRIMARY KEY
   - project_name VARCHAR(60) NOT NULL
   - budget DECIMAL(10,2)
   - start_date DATE

2. Insert these rows:
   - (1, 'Data Warehouse', 15000.00, '2026-04-01')
   - (2, 'Customer Dashboard', 8000.00, '2026-04-05')
   - (3, 'ETL Migration', 12000.00, '2026-04-10')

3. Add two new columns:
   - status VARCHAR(20)
   - is_priority BIT

4. Set:
   - project_id = 1 -> status = 'active', is_priority = 1
   - project_id = 2 -> status = 'planned', is_priority = 0
   - project_id = 3 -> status = 'active', is_priority = 1

5. Update:
   - project_id = 2 -> budget = 9000.00

6. Delete:
   - project_id = 3

7. Show the final table

Sample Data:
- Use only the data above */

CREATE TABLE projects(
project_id INT PRIMARY KEY,
project_name VARCHAR(60) NOT NULL,
budget DECIMAL(10,2),
start_date DATE
);

INSERT INTO projects (project_id, project_name, budget, start_date)
VALUES 
(1, 'Data Warehouse', 15000.00, '2026-04-01'),
(2, 'Customer Dashboard', 8000.00, '2026-04-05'),
(3, 'ETL Migration', 12000.00, '2026-04-10');

ALTER TABLE projects
ADD status VARCHAR(20),
	is_priority BIT;

UPDATE projects
SET status='active',
	is_priority=1
WHERE project_id=1;

UPDATE projects
SET status='planned',
	is_priority=0
WHERE project_id=2;

UPDATE projects
SET status='active',
	is_priority=1
WHERE project_id=3;

UPDATE projects
SET budget=9000.00
WHERE project_id=2;

DELETE FROM projects
WHERE project_id=3;

SELECT *
FROM projects;