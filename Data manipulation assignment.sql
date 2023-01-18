--ASSIGNMENT
--Create table called employees with its respective columns
--CREATE TABLE employees (
--ID INT,
--Name VARCHAR(255),
--SupervisorID INT,
--JobTitle VARCHAR (255),
--Salary INT,
--HireDate DATE,
--PRIMARY KEY (ID)
--)

--Insert observations into table
--INSERT INTO employees (ID, Name, SupervisorID, JobTitle, Salary, HireDate)
--VALUES
--(01, 'Ramirez Jones', 05, 'Product Manager', 53000, '2020-06-18'),
--(02, 'Leon Thomas', 04, 'Data Analyst', 57000, '2020-08-12'),
--(03, 'Sophie Smith', 01, 'Secretary', 34000, '2020-02-11'),
--(04, 'Cheryl Ruth', 05, 'Senior Data Analyst',87000, '2020-02-11'),
--(05, 'Lewis Hamilton', NULL, 'Product Owner', 112000, '2019-12-12')

--SELECT *
--FROM employees

/*Built-in numeric function: There is a restructuring of salaries in the company. The square root of 
the product manager and secretary are added to their normal salaries while for the rest it is the opposite*/
--SELECT Name, JobTitle, Salary,
--CASE 
--	WHEN JobTitle = 'Product Manager' THEN ROUND(Salary + SQRT(Salary),2)
--	WHEN JobTitle = 'Secretary' THEN ROUND(Salary + SQRT(Salary),2)
--	ELSE ROUND(Salary - SQRT(Salary),2)
--END AS SalaryAfterRestructure
--FROM employees

/* Table Locking */


--PRACTICE (User-defined and Transactions)

