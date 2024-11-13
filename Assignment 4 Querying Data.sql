create database assignment_4;

use assignment_4;

create table countries(ID int primary key,
Country_Name varchar(50),
Population int,
Area int);

create table persons(ID int primary key,
Fname varchar(50),
Lnmae varchar(50),
population int,
rating float,
Country_id int,
Country_Name varchar(50),
foreign key (Country_id) references Countries(ID));

desc countries;

desc persons;

insert into countries (ID,Country_Name,Population,Area)values
(1, 'USA', 333000000, 9833520),
(2, 'Canada', 38000000, 9984670),
(3, 'India', 1503409038, 3287263),
(4, 'Australia', 25687041, 7692024),
(5, 'UK', 67886011, 243610),
(6, 'Germany', 83200000, 357022),
(7, 'China',1302200900,5432678),
(8, 'Italy', 60360000, 301340),
(9, 'Japan', 125800000, 377975),
(10, 'Brazil', 213993437, 8515767);

select * from countries;

insert into persons(Id, Fname, Lnmae,Population, Rating, Country_Id, Country_name)
VALUES(1, 'Adam','Smith',1000000, 4.2, 1, 'USA'),
(2, 'Bob','Charlton',800000, 3.9, 2, 'Canada'),
(3, 'Charlie','Puth', 900000, 3.5, 5, 'UK'),
(4, 'David','Ricardo',200000, 4.8, 4, 'Australia'),
(5, 'Arjith','Singh' ,500000, 4.5, 3, 'India'),
(6,'Ranbir','Kapoor', 700000, 3.2, NULL, NULL),
(7,'MS','Dhoni',700000, 4.5, 4,'India'),
(8, 'Emma', 'Ston', 600000, 4.9, 6, 'Germany'),
(9, 'Marco', 'Paulo', 950000, 4.1, 8, 'Italy'),
(10, 'Sora', 'Yamada', 300000, 2.9, 9, 'Japan');

alter table persons change lnmae lname varchar(50);

# 1. List the distinct country names from the Persons table 
select distinct country_name from persons;

# 2. Select first names and last names from the Persons table with aliases. 
Select fname as First_name, lname as Last_name from persons;

# 3. Find all persons with a rating greater than 4.0.
select * from persons where rating> 4.0;

# 4. Find countries with a population greater than 10 lakhs.
select * from countries where population> 1000000;

# 5.Find persons who are from 'USA' or have a rating greater than 4.5.
select * from persons where country_name = 'USA' or rating > 4.5;

# 6. Find all persons where the country name is NULL. 
select * from persons where country_name is null;

# 7. Find all persons from the countries 'USA', 'Canada', and 'UK'.
select * from persons where country_name in ('USA','Canada','UK');

# 8. Find all persons not from the countries 'India' and 'Australia'.
select * from persons where country_name not in ('India','Australia');

# 9. Find all countries with a population between 5 lakhs and 20 lakhs
select country_name from countries where population between 500000 and 2000000;

# 10. Find all countries whose names do not start with 'C'.
select country_name from countries where country_name not like 'c%'; 


