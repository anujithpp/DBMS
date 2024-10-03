create database Q6;

use Q6;

create table Depart (
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(100),
	managerID INT,
	Location VARCHAR(100)
);

create table Emp (
	EmpNo int primary key,
	Name varchar(100),
	Job varchar(100),
	Salary decimal(10,2),
	HireDate DATE,
	Commission decimal(10,2),
	DepartmentNo INT,
	managerID INT,
	foreign key (DepartmentNo) references Depart(DepartmentID),
	foreign key (managerID) references Emp(EmpNO)
);

Insert into Depart (DepartmentID, DepartmentName, managerID,Location)
VALUES (1, 'sales', 101, 'New York'),
	   (2, 'HR', 102, 'California'),
	   (3, 'IT', 103, 'Texas');

Insert into Emp (EmpNo, Name, Job, Salary, HireDate, Commission, DepartmentNo)
VALUES(101, 'john', 'Manager', 40000, '1995-04-01', Null, 1),
	  (102, 'jane', 'HR', 20000, '1990-06-01', 2000, 2),
	  (103, 'mike', 'Developer', 10000, '1992-08-15', Null, 3),
	  (104, 'Amit', 'Sales rep', 8000, '1994-02-01', 500, 1);



select Name, Salary
from Emp
where Salary not between 5000 and 35000;

select Name, Job, HireDate
from Emp
where HireDate between '1990-02-20' and '1998-05-01'
order by HireDate asc;

select Name as Employee, Salary as "Monthly Salary"
from Emp
where Salary between 5000 and 12000
and DepartmentNo in (2,4);

select Name, HireDate
from Emp
where YEAR(HireDate) = 1994;

select Name, Salary, Commission
from Emp
where Commission is not null
order by Salary DESC, Commission DESC;


select Name, Job
from Emp
where managerID is Null;

select Name
from Emp
where substring(Name, 3, 1) = 'a';

select Name
from Emp
where Name like '%a%' and Name like '%e%';

select Name, Job, Salary
from Emp
where Job in ('Sales Represntative', 'Stock Clerk')
and Salary not in (20000, 4000, 7000);

select E.Name, E.DepartmentNo, D.DepartmentName
from Emp E
join Depart D on E.DepartmentNo = D.DepartmentID;

select E1.EmpNo, E1.Name
from Emp E1
join Emp E2 On E1.DepartmentNo = E2.DepartmentNo
where E2.Name like '%u%';

select Name, HireDate
from Emp
where DepartmentNo = (select DepartmentNo from Emp where Name = 'Amit')
and Name <> 'john';