use employeemanagement;

create table Managers(Manager_id int auto_increment primary key,
First_name varchar(50),
Last_name varchar(50),
DOB date,
Age int check(Age>=18),
Last_update timestamp default current_timestamp,
Gender char(1) check (Gender in ('M','F')),
Department varchar(50),
Salary decimal(10,2) not null);

# 1) Insert 10 Rows
insert into Managers (Manager_Id, 
First_name, Last_Name, DOB,Age, Gender, Department, Salary)
values(1, 'Frank','Lambard','1980-09-19',44,'M','Operations',45000),
(2,'Enzo','Maresca','1985-01-01',39,'F','HR',40000),
(3,'Pep','Guardiola','1975-02-22',49,'M','Marketing',49000),
(4,'Selena','Gomez','1990-03-12',34,'F','Sales',30000),
(5,'Sai','Pallavi', '1995-04-14',29,'F','IT',40000),
(6,'Aalia', 'M','1995-02-02',29,'F','HR',35000),
(7,'Mahendrasingh','Dhoni','1983-07-07',41,'M','HR',50000),
(8,'Suresh','Raina','1984-06-06',40,'M','Operations',40000),
(9,'Joseph','Vijay','1979-02-19',45,'M','IT',48000),
(10,'Virat','Kholi','1989-07-18',35,'M','Finance',35000);

select * from Managers;

# 2)Write a query that retrieves the name and date of birth of the manager with Manager_Id 1
select First_name, Last_name,DOB
from Managers where Manager_id =1;

# 3)Write a query to display the annual income of all managers
select Manager_id,First_name,Last_name,Salary * 12 as Annual_income
from Managers;

# 4)Write a query to display records of all managers except ‘Aalia’.
select * from managers where first_name <> 'Aalia';

# 5)Write a query to display details of managers whose department is IT and earns more than 25000 per month
select * from managers where Department = 'IT' and salary >25000;

# 6) Write a query to display details of managers whose salary is between 10000 and 35000.
select * from managers where salary between 10000 and 35000;

