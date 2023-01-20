--ASSIGNMENT
USE Mari;

--Create table called employees with its respective columns
CREATE TABLE employees (
ID INT,
Name VARCHAR(255),
SupervisorID INT,
JobTitle VARCHAR (255),
Salary INT,
HireDate DATE,
PRIMARY KEY (ID)
)

--Insert observations into table
INSERT INTO employees (ID, Name, SupervisorID, JobTitle, Salary, HireDate)
VALUES
(01, 'Ramirez Jones', 05, 'Product Manager', 53000, '2020-06-18'),
(02, 'Leon Thomas', 04, 'Data Analyst', 57000, '2020-08-12'),
(03, 'Sophie Smith', 01, 'Secretary', 34000, '2020-02-11'),
(04, 'Cheryl Ruth', 05, 'Senior Data Analyst',87000, '2020-02-11'),
(05, 'Lewis Hamilton', NULL, 'Product Owner', 112000, '2019-12-12')

-- View the created table
SELECT *
FROM employees

/*Built-in numeric function: There is a restructuring of salaries in the company. The square root of 
the product manager and secretary are added to their normal salaries while for the rest it is the opposite*/
SELECT Name, JobTitle, Salary,
CASE 
	WHEN JobTitle = 'Product Manager' THEN ROUND(Salary + SQRT(Salary),2)
	WHEN JobTitle = 'Secretary' THEN ROUND(Salary + SQRT(Salary),2)
	ELSE ROUND(Salary - SQRT(Salary),2)
END AS SalaryAfterRestructure
FROM employees

/* Table Locking */
-- Before table locking can be explained, there has to be a transaction process.
-- In MS SQL server the locking mechanism is automatic (There is no set syntax for locking a table).
-- A table would be locked if there is a particular user performing a transaction and he or she has not rolledback or committed

-- 1. Begin a transaction
BEGIN TRANSACTION

UPDATE employees
SET Salary = 35000
WHERE JobTitle = 'Secretary'

-- Now that you have started a transaction, please create a new query and select all columns from the employees table
SELECT *
FROM Mari.dbo.employees
-- The action would left as executing because the table has been locked by sql server and would only be opened when you commit or rollback this transaction.

--2. (optional) Try Rollback to see how it works
ROLLBACK;

-- 3. commit changes 
COMMIT;
-- Once you have done any of the two, the query in the new window would execute

--PRACTICE (User-defined)

