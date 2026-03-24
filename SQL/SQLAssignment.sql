CREATE DATABASE company_db;
GO

USE company_db;
GO

CREATE TABLE skills (
    skill_id INT IDENTITY(1,1) PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL,
    category VARCHAR(100)
);
GO


SELECT name FROM sys.databases;
GO


SELECT name FROM sys.tables;
GO

CREATE TABLE employee (
     EmployeeID INT PRIMARY KEY,
     FirstName VARCHAR(50) NOT NULL,
     HireDate DATE,
     Salary DECIMAL(10,2)
);
GO

EXEC sp_rename 'employee', 'staff';
GO

CREATE TABLE employee (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    hire_date DATE,
    salary DECIMAL(10,2),
    dept_id INT,
    gender VARCHAR(10)
);
GO

INSERT INTO employee 
(first_name,email,hire_date,salary,dept_id,gender)
VALUES 
('Alice','alice.green@company.com','2024-01-10',62000,4,'Female');
GO

CREATE TABLE project (
	project_id INT IDENTITY(1,1) PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12,2),
    dept_id INT
);
GO

INSERT INTO project (project_name,budget,dept_id)
VALUES
('Mobile App',60000,2),
('Training Program',25000,1);
GO

CREATE TABLE department (
    dept_id INT IDENTITY(1,1) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(100)
);
GO

INSERT INTO department (dept_name,location)
VALUES ('Sales','Boston');
GO

INSERT INTO employee (first_name,email)
VALUES ('Tom','tom@company.com');
GO

SELECT * FROM employee;
GO

SELECT 
employee_id AS Employee_ID,
first_name AS Name,
email AS Email_Address
FROM employee;
GO

SELECT *
FROM employee
WHERE hire_date > '2023-01-01';
GO

SELECT *
FROM project
WHERE budget > 40000
ORDER BY budget DESC;
GO

SELECT DISTINCT location
FROM department;
GO

ALTER TABLE employee
ADD phone_number VARCHAR(15);
GO

ALTER TABLE employee 
ADD last_name VARCHAR(50);
GO

INSERT INTO employee 
(first_name,last_name,email,hire_date,salary,dept_id,gender)
VALUES
('John','Doe','john.doe@company.com','2022-05-10',60000,2,'Male'),
('Sara','Lee','sara.lee@company.com','2023-03-15',75000,1,'Female'),
('Mike','Brown','mike.brown@company.com','2024-01-12',80000,3,'Male');
GO

UPDATE employee
SET salary = 65000
WHERE first_name = 'John' AND last_name = 'Doe';
GO

SELECT * FROM employee;
GO

EXEC sp_help employee;
GO

UPDATE employee
SET gender = 'Other'
WHERE dept_id = 2;
GO

ALTER TABLE employee
DROP COLUMN phone_number;
GO

SELECT *
FROM employee
WHERE salary BETWEEN 60000 AND 80000;
GO

SELECT *
FROM employee
WHERE first_name LIKE 'J%';
GO

SELECT *
FROM project
WHERE dept_id IN (1,2);
GO

SELECT *
FROM employee
WHERE email IS NOT NULL;
GO

SELECT *
FROM department
WHERE location NOT IN ('New York','Chicago');
GO

SELECT *
FROM employee
WHERE YEAR(hire_date) = 2023;
GO

SELECT SUM(salary)
FROM employee;
GO

SELECT AVG(budget)
FROM project;
GO

SELECT MAX(salary)
FROM employee;
GO

SELECT COUNT(*)
FROM employee
WHERE dept_id = 2;
GO

SELECT MIN(budget)
FROM project;
GO

SELECT e.first_name, d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id;
GO

SELECT d.dept_name, COUNT(e.employee_id) AS employee_count
FROM department d
LEFT JOIN employee e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;
GO

SELECT p.project_name, d.dept_name
FROM project p
JOIN department d
ON p.dept_id = d.dept_id;
GO

SELECT e.*
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id
WHERE d.location = 'San Francisco';
GO

SELECT d.dept_name
FROM department d
LEFT JOIN project p
ON d.dept_id = p.dept_id
WHERE p.project_id IS NULL;
GO

SELECT CONCAT(first_name,' ',last_name) AS Full_Name
FROM employee;
GO

SELECT UPPER(dept_name)
FROM department;
GO

SELECT SUBSTRING(email,1,3)
FROM employee;
GO

SELECT ABS(-50000);
GO

SELECT ROUND(AVG(salary),2)
FROM employee;
GO

SELECT TOP 3 * FROM employee
ORDER BY hire_date DESC;
GO

SELECT *
FROM employee
ORDER BY employee_id
OFFSET 3 ROWS FETCH NEXT 3 ROWS ONLY;
GO

SELECT first_name,
CASE
WHEN salary >= 70000 THEN 'High'
ELSE 'Low'
END AS salary_category
FROM employee;
GO

SELECT project_name,
CASE
WHEN budget >= 60000 THEN 'Large'
WHEN budget >= 40000 THEN 'Medium'
ELSE 'Small'
END AS budget_category
FROM project;
GO

SELECT dept_id, SUM(budget) AS total_budget
FROM project
GROUP BY dept_id;
GO

SELECT TOP 1 *
FROM employee
ORDER BY LEN(first_name) DESC;
GO

SELECT *
FROM employee
WHERE hire_date >= DATEADD(DAY,-90,'2025-03-22');
GO

DELETE FROM employee
WHERE salary < 60000;
GO

DROP TABLE project;
GO

USE AdventureWorksLT2025;

DROP DATABASE AdventureWorksLT2025;