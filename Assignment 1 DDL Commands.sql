create database School;

use School;

create table Student(Roll_No int auto_increment primary key,
Firstname varchar(50) not null,
lastname varchar(50) not null,
Marks int check(Marks between 0 and 100),
grade char(1),
check (grade in ('A','B','C','D')));

insert Into Student (Roll_No, Firstname, lastname, Marks, Grade) 
values(1, 'Adam','Smith',85, 'A'),
(2, 'Bob','Charlton', 78, 'B'),
(3, 'Charlie','Puth', 92, 'A'),
(4, 'David','Ricardo', 65, 'C'),
(5, 'Arjith','Singh' , 77, 'B'),
(6,'Ranbir','Kapoor', 62, 'C'),
(7,'MS','Dhoni',100,'A'),
(8,'Raveendra','Jadeja', 92,'A'),
(9,'Ruturaj','Gaikwad',78,'B'),
(10,'Jos','Buttler',64,'B');

#1) select USED TO DISPLAY THE TABLE
select * from Student;

# 2) ADD COLOUM
alter table STUDENT
add Contact varchar(15);

# 3)REMOVE COLOUM
alter table STUDENT
drop column Grade;

# 4)RENAME
alter table STUDENT
rename to CLASSTEN;

# 5) DELETE ROWS
truncate table CLASSTEN;

# 6) REMOVE TABLE FROM DATABASE
drop table CLASSTEN;












