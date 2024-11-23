use assignment_5;

# 1.Perform inner join, Left join, and Right join on the tables.
-- inner join

select Persons.Fname, Persons.Lname, Country.country_name, Country.population AS country_population 
from Persons inner join country on Persons.country_id = Country.ID;

-- left join

select Persons.Fname, Persons.Lname, Country.country_name, Country.population AS country_population 
from Persons left join country on Persons.country_id = Country.ID;

-- right join

select Persons.Fname, Persons.Lname, Country.country_name, Country.population AS country_population 
from Persons right join country on Persons.country_id = Country.ID;

# 2.List all distinct country names from both the Country and Persons tables

 select distinct country_name from country union 
 select distinct country_name name from persons;
 
 # 3. List all country names from both the Country and Persons tables, including duplicates.
 
 select country_name from country union all
 select country_name from persons;
 
 # 4.Round the ratings of all persons to the nearest integer in the Persons table.
 
 update persons set rating = round(rating);
 
 select * from persons;


