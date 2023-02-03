----CREATE DATABASE SQLTutorial
----USE SQLTutorial

----CREATE TABLE EmployeeDemographics
----(EmployeeID INT,
----FirstName VARCHAR(50),
----LastName VARCHAR(50),
----Age INT,
----Gender VARCHAR(50)
----)

----CREATE TABLE EmployeeSalary
----(EmployeeID INT,
----JobTitle VARCHAR(50),
----Salary INT
----)

----USE SQLTutorial
--INSERT INTO EmployeeDemographics VALUES
--(1001, 'Jim', 'Halpert', 30, 'Male')

--INSERT INTO EmployeeDemographics VALUES
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')

--Insert Into EmployeeSalary VALUES
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)

--SELECT Gender, COUNT(Gender)
--FROM EmployeeDemographics
--GROUP BY Gender

--INSERT INTO EmployeeSalary VALUES
--(1010, 'Data Analyst', 65000),
--(1011, 'Data Scientist', 80000)

--SELECT *
--FROM EmployeeSalary
--WHERE JobTitle LIKE '%c%'

--Insert into EmployeeDemographics VALUES
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(NULL, 'Holly','Flax', NULL, 'Male'),
--(1013, 'Darryl', 'Philbin', NULL, 'Male')

--Insert into EmployeeSalary VALUES
--(1010, NULL, 47000),
--(NULL, 'Salesman', 43000)

--SELECT TOP 7 *
--FROM EmployeeSalary

--Order BY
--The order by clause can be further broken down to order results according to certain values in a column.
--This possible by using the substring function which extracts letters from strings. 
--The logic is SUBSTRING(column, what position the substring should start, the number of characters to extract)
--check hackerrank for hw you solved it
--ORDER BY SUBSTRING(FirstName, len(FirstName)-2, LEN(FirstName)), EmployeeID;

--IN SYNTAX
--SELECT TOP 2 *
--FROM EmployeeDemographics
--WHERE Gender IN ('Female');

--LIKE Syntax
--SELECT TOP 3 
--	FirstName,
--	LastName
--FROM EmployeeDemographics
--WHERE FirstName LIKE '%a%';

-- This like query below is a shorter version to bring the first and last name of each employee whose name begins with an a e i o or u
-- The modulo (%) at the beginning means it ends with aeiou but if it was at the end it means it starts with aeiou
-- Note that where there is a LIKE there can also be a NOT LIKE
--SELECT TOP 3 
--	FirstName,
--	LastName
--FROM EmployeeDemographics
--WHERE FirstName LIKE '%[a,e,i,o,u]'
--	AND FirstName LIKE '[a,e,i,o,u]%';


--INNER JOIN
--SELECT *
--FROM EmployeeDemographics AS ed
--JOIN EmployeeSalary AS es
--	ON ed.EmployeeID = es.EmployeeID

--FULL OUTER JOIN
--SELECT *
--FROM EmployeeDemographics AS ed
--FULL OUTER JOIN EmployeeSalary AS es
--	ON ed.EmployeeID = es.EmployeeID

--LEFT OUTER JOIN
--SELECT *
--FROM EmployeeDemographics AS ed
--LEFT OUTER JOIN EmployeeSalary AS es
--	ON ed.EmployeeID = es.EmployeeID

--SELECT ed.EmployeeID, FirstName, LastName, JobTitle, Salary
--FROM EmployeeDemographics AS ed
--JOIN EmployeeSalary AS es
--	ON ed.EmployeeID = es.EmployeeID


--NOTE: the column you choose for the join matters.
--SELECT es.EmployeeID, FirstName, LastName, JobTitle, Salary
--FROM EmployeeDemographics AS ed
--RIGHT OUTER JOIN EmployeeSalary AS es
--	ON ed.EmployeeID = es.EmployeeID

--SELECT ed.EmployeeID, FirstName, LastName, Salary
--FROM EmployeeDemographics AS ed
--INNER JOIN EmployeeSalary AS es
--	ON ed.EmployeeID = es.EmployeeID
--WHERE ed.EmployeeID != 1006
--ORDER BY Salary DESC

--SELECT JobTitle, AVG(Salary) AS AvgSalary
--FROM EmployeeDemographics AS ed
--INNER JOIN EmployeeSalary AS es
--	ON ed.EmployeeID = es.EmployeeID
--WHERE JobTitle = 'Salesman'
--GROUP BY JobTitle

--SELECT JobTitle, MAX(Salary) AS HighestSalary
--FROM EmployeeSalary
--GROUP BY JobTitle

--Create Table WareHouseEmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50)
--)

--Insert into WareHouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female')


--UNION statement
--SELECT EmployeeID, FirstName, LastName
--FROM EmployeeDemographics
--UNION 
--SELECT EmployeeID, FirstName, LastName
--FROM WareHouseEmployeeDemographics
--ORDER BY EmployeeID


--Be careful when using union for different columns
--SELECT EmployeeID, FirstName, Age
--FROM EmployeeDemographics
--UNION 
--SELECT EmployeeID, JobTitle, Salary
--FROM EmployeeSalary
--ORDER BY EmployeeID

--CASE Statement
--This allows you to specify condition and also allows you to specify what you want returned when that condition is met 
--Note that the very first condition that is met is what would be returned (If a condition is met in the first statement, that is what the result would be regardless of the second statement)
/*SELECT FirstName, LastName, Age,
CASE
	WHEN Age >30 THEN 'Old' 
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END
FROM EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age*/

--SELECT FirstName, LastName, JobTitle, Salary,
--CASE
--	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
--	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
--	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
--	ELSE Salary + (Salary * .03)
--END AS SalaryAfterRaise
--FROM EmployeeDemographics AS d
--JOIN EmployeeSalary AS s
--	ON d.EmployeeID = s.EmployeeID

--HAVING Clause You can not use an aggregate clause in a where statement when you want to filter your result so a having clause would be more appropriate
-- Having statement comes after the group by statement because we can't look at the aggregated information before it is in the GROUP BY statement
--SELECT JobTitle, COUNT(JobTitle)
--FROM EmployeeDemographics AS d
--JOIN EmployeeSalary AS s
--	ON d.EmployeeID = s.EmployeeID
--GROUP BY JobTitle
--HAVING COUNT(JobTitle) > 1

--SELECT JobTitle, AVG(Salary)
--FROM EmployeeDemographics AS d
--JOIN EmployeeSalary AS s
--	ON d.EmployeeID = s.EmployeeID
--GROUP BY JobTitle
--HAVING AVG(Salary) > 45000
--ORDER BY AVG(Salary)

--Updating/Deleting data in a table
--Inserting data would insert a new row in your table but Updating data would change a value in a pre-existing row
--Deleting is going to specify what to remove from the data
SELECT *
FROM EmployeeDemographics

--UPDATE EmployeeDemographics
--SET Age = 31, Gender = 'Female'
--WHERE FirstName = 'Holly' AND LastName = 'Flax'

-- You must be careful when using the delete button 
--DELETE FROM EmployeeDemographics
--WHERE EmployeeID = 1005

--You can use SUBSTRING() function to extract the first letter of the word. Syntax:

--SUBSTRING(expression/string/column, start, length)

--Here expression is the string
--Start specifies integer value from where the returned characters start
--Length specifies the length of the string to br returned starting from the value specified in second parameter 'start'.

--Concat function is very powerful, check out hackerank advanced select
--SELECT CONCAT(name,'(',SUBSTRING(Occupation,1,1),')')
--FROM Occupations
--ORDER BY name;

--SELECT CONCAT('There are a total of ',COUNT(occupation),' ',LOWER(occupation),'s.')
--FROM Occupations
--GROUP BY occupation
--ORDER BY COUNT(occupation), occupation

--Replace function replaces a string or integer with another string(which can also be space) or integer
--The ceiling function returns the smallest integer value that is larger than or equal to a number.
--It would Return the smallest integer value that is greater than or equal to a number.
-- The CAST() function converts a value (of any type) into a specified datatype,
-- Not the same as convert because CONVERT() function syntax includes the style you wish to convert it to. eg for datetime it can be yy-mm-dd or yyyy-mm-dd, or e.t.c
/*SELECT 
    CEILING(AVG(SALARY))- CEILING(AVG(CAST(REPLACE(SALARY,'0','')AS INT))) +1
FROM employees/*
