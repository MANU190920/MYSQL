create database assignment_5;

use assignment_5;

create table Country(ID int primary key,
country_name varchar(50),
population int,
area int);

create table persons(ID int primary key,
Fname varchar(50),
Lname varchar(50),
population int,
rating decimal(3,2),
country_id int,
country_name varchar(50),
foreign key (country_id) references country(ID));

desc country;

desc persons;

insert into country values (1, 'USA', 333000000, 9833520),
(2, 'Canada', 38000000, 9984670),
(3, 'India', 1503409038, 3287263),
(4, 'Australia', 25687041, 7692024),
(5, 'UK', 67886011, 243610),
(6, 'Germany', 83200000, 357022),
(7, 'China',1302200900,5432678),
(8, 'Italy', 60360000, 301340),
(9, 'Japan', 125800000, 377975),
(10, 'Brazil', 213993437, 8515767);

select * from country;

insert into persons values(1, 'Adam','Smith',1000000, 4.2, 1, 'USA'),
(2, 'Bob','Charlton',800000, 3.9, 2, 'Canada'),
(3, 'Charlie','Puth', 900000, 3.5, 5, 'UK'),
(4, 'David','Ricardo',200000, 4.8, 4, 'Australia'),
(5, 'Arjith','Singh' ,500000, 4.5, 3, 'India'),
(6,'Ranbir','Kapoor', 700000, 3.2, 3, 'India'),
(7,'MS','Dhoni',700000, 4.5, 3,'India'),
(8, 'Emma', 'Ston', 600000, 4.9, 6, 'Germany'),
(9, 'Marco', 'Paulo', 950000, 4.1, 8, 'Italy'),
(10, 'Sora', 'Yamada', 300000, 2.9, 9, 'Japan');

select * from persons;

# 1.Write an SQL query to print the first three characters of Country_name from the Country table.

select left(country_name,3) as first_three_characters from country;

# 2. Write an SQL query to concatenate first name and last name from Persons table.

select concat(fname,' ',lname) as full_name from persons;

# 3. Write an SQL query to count the number of unique country names from Persons table

select count(distinct country_name) as uniquecountries from persons;

# 4. Write a query to print the maximum population from the Country table.

select max(population) as MAXPOPULATION from country;

# 5. Write a query to print the minimum population from Persons table

select min(population) as minpopulation from persons;

# 6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table.

insert into persons values
(11, 'Ren', NULL, 6000, 3.2, 1, 'UK'),
(12, 'Sara', NULL, 5500, 3.6, 2, 'USA');

select count(lname) as Lastname_count from persons;

# 7. Write a query to find the number of rows in the Persons table.

select count(8) as Rowcount from persons;

#. 8. Write an SQL query to show the population of the Country table for the first 3 rows. 

select population from country limit 3;

# 9. Write a query to print 3 random rows of countries.

select * from country order by rand() limit 3;

# 10. List all persons ordered by their rating in descending order

select * from persons order by rating desc;

# 11.  Find the total population for each country in the Persons table.

select country_name, sum(population) as Total_Population
from persons group by country_name;

# 12. Find countries in the Persons table with a total population greater than 50,000

select country_name from persons
group by country_name having sum(population)> 50000;

# 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.

select country_name, count(*) AS TotalPersons, avg(rating) AS Averagerating
from persons
group by country_name
having count(*) > 2
order by Averagerating asc;





