use assignment_5;

# 1. Add a new column called DOB in Persons table with data type as Date.

alter table persons add column DOB date;

update Persons set DOB = '1985-05-01' WHERE ID = 1;
update Persons set DOB = '1990-06-15' WHERE ID = 2;
update Persons set DOB = '1991-12-02' WHERE ID = 3;
update Persons set DOB = '1980-03-10' WHERE ID = 4;
update Persons set DOB = '1987-04-20' WHERE ID = 5;
update Persons set DOB = '1992-07-14' WHERE ID = 6;
update Persons set DOB = '1981-07-07' WHERE ID = 7;
update Persons set DOB = '1993-11-06' WHERE ID = 8;
update Persons set DOB = '1988-09-22' WHERE ID = 9;
update Persons set DOB = '1995-01-25' WHERE ID = 10;
update Persons set DOB = '1988-06-22' WHERE ID = 11;
update Persons set DOB = '1995-09-25' WHERE ID = 12;


select * from persons;

# 2. Write a user-defined function to calculate age using DOB.

delimiter $$

create function CalculateAge(dob DATE)
returns int
deterministic
begin
declare age int;
set age = timestampdiff(year, dob, curdate());
return age;
end$$

delimiter ;


# 3. Write a select query to fetch the Age of all persons using the function that has been created.

select fname,lname,DOB,calculateage(DOB) as age from persons;

# 4. Find the length of each country name in the Country table.

select country_name, length(country_name) AS NameLength 
from Country;

# 5. Extract the first three characters of each country's name in the Country table.

select country_name, substring(country_name, 1, 3) AS first_three_characters 
from Country;

# 6. Convert all country names to uppercase and lowercase in the Country table.

select country_name, upper(country_name) AS Uppercase_Name, 
lower(country_name) AS LowercaseName from Country;


