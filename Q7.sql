CREATE DATABASE Q7;

USE Q7;

CREATE TABLE employee(
	employee_no int primary key,
	employee_name varchar(20),
 	job varchar(20), 
 	department_no int, 
 	salary numeric
 );

INSERT INTO employee (employee_no, employee_name, job, department_no, salary) VALUES
(1, 'Alice Johnson', 'Software Engineer', 101, 75000.00),
(2, 'Bob Smith', 'Data Analyst', 102, 65000.00),
(3, 'Charlie Brown', 'ASP', 103, 85000.00),
(4, 'Diana Prince', 'UX Designer', 104, 70000.00),
(5, 'Ethan Hunt', 'DevOps Engineer', 105, 80000.00);

--creating a view table in sql with only specified attributes from the original table
CREATE VIEW employee_view AS
SELECT employee_no, employee_name, job, department_no
FROM employee;

SELECT * FROM employee_view;

SELECT * 



--sql code to drop a view table 
DROP VIEW IF EXISTS employee_view;