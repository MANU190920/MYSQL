use assignment_5;

-- Part 1
# 1. Find the number of persons in each country.
select country_name, COUNT(*) as Number_of_Persons
from persons
group by country_name;

# 2. Find the number of persons in each country sorted from high to low.
select country_name, COUNT(*) as Number_of_Persons
from persons
group by country_name
order by Number_of_Persons desc;

# 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0
select country_name, avg(rating) as Average_Rating
from persons
group by country_name
having avg(rating) > 3.0;

# 4. Find the countries with the same rating as the USA.
select distinct country_name
from persons
where rating in (select rating from persons
where country_name = 'USA');

# Select all countries whose population is greater than the average population of all nations.
select country_name
from country
where population > (select avg(population) from country);

-- Part 2

create database product;

use product;
create table Customer (Customer_Id int primary key,
First_name varchar(50),
Last_name varchar(50),
Email varchar(100),
Phone_no varchar(15),
Address varchar(255),
City varchar(50),
State varchar(50),Zip_code VARCHAR(10),
Country varchar(50));

# 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view. 

insert into Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
values
(1, 'John', 'Doe', 'john.doe@mail.com', '1234567890', '12 Elm Street', 'Los Angeles', 'California', '90001', 'US'),
(2, 'Jane', 'Smith', 'jane.smith@mail.com', '2345678901', '45 Maple Avenue', 'Boston', 'Massachusetts', '02108', 'US'),
(3, 'Chris', 'Evans', 'chris.evans@mail.com', '3456789012', '300 Hero St', 'Boston', 'Massachusetts', '02115', 'US'),
(4, 'Deepika', 'Padukone', 'deepika.padukone@mail.com', '4567890123', '50 Sea View Lane', 'Mumbai', 'Maharashtra', '400001', 'India'),
(5, 'Virat', 'Kohli', 'virat.kohli@mail.com', '5678901234', '18 Century Road', 'Delhi', 'Delhi', '110001', 'India'),
(6, 'Steve', 'Smith', 'steve.smith@mail.com', '6789012345', '10 Ashes Blvd', 'Sydney', 'New South Wales', '2000', 'Australia'),
(7, 'Emily', 'Brown', 'emily.brown@mail.com', '7890123456', '78 Oak Avenue', 'Seattle', 'Washington', '98101', 'US'),
(8, 'Michael', 'Johnson', 'michael.johnson@mail.com', '8901234567', '65 Pine Road', 'London', 'England', 'E1 6AN', 'UK'),
(9, 'Sania', 'Mirza', 'sania.mirza@mail.com', '9012345678', '24 Tennis Court Rd', 'Hyderabad', 'Telangana', '500001', 'India'),
(10, 'David', 'Warner', 'david.warner@mail.com', '0123456789', '15 Sunrise Ave', 'Brisbane', 'Queensland', '4000', 'Australia');

create view customer_info as
select 
concat(First_name, ' ', Last_name) as Full_name,Email
from Customer;


SELECT * FROM customer_info;

# 2. Create a view named US_Customers that displays customers located in the US.

create view US_Customers as
select *
from Customer
where Country = 'US';

select * from US_Customers;

# 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state.
create view Customer_details as
select concat(First_name, ' ', Last_name) as Full_name, Email,Phone_no,State
from Customer;

SELECT * FROM Customer_details;

# 4. Update phone numbers of customers who live in California for Customer_details view.
update Customer set Phone_no = '9999999999'
where State = 'California';

SELECT * FROM Customer_details WHERE State = 'California';

# 5. Count the number of customers in each state and show only states with more than 5 customers
select State, count(*) as Customer_count
from Customer
group by State
having count(*) > 5;

# 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.
select State, count(*) as Customer_count
from Customer_details
group by State;

# 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
select * from Customer_details
order by State asc;

















