create database Library;

use library;

create table branch (branch_no int primary key,
manager_id int,
branch_address varchar(100),
contact_no varchar(15));

desc branch;

create table employee(emp_id int primary key,
emp_name varchar(50),
position varchar(50),
salary decimal(10, 2),
branch_no int,
foreign key(branch_no) references branch(branch_no));

desc employee;

create table books(isbn varchar(20) primary key,
book_title varchar(100),
category varchar(50),
rental_price decimal(10, 2),
status varchar(3) check(status in ('yes', 'no')),
author varchar(50),
publisher varchar(50));

desc books;

create table customer(customer_id int primary key,
customer_name varchar(50),
customer_address varchar(100),
reg_date date);

desc customer;

create table issuestatus(issue_id int primary key,
issued_cust int,
issued_book_name varchar(100),
issue_date date,
isbn_book varchar(20),
foreign key(issued_cust) references customer(customer_id),
foreign key(isbn_book) references books(isbn));

desc issuestatus;

create table returnstatus(return_id int primary key,
return_cust int,
return_book_name varchar(100),
return_date date,
isbn_book2 varchar(20),
foreign key(return_cust) references customer(customer_id),
foreign key(isbn_book2) references books(isbn));

insert into branch values(1, 101, 'Kochi, Kerala', '9876543210'),
(2, 102, 'Chennai, Tamil Nadu', '8765432109'),
(3, 103, 'Bangalore, Karnataka', '7654321098'),
(4, 104, 'Mumbai, Maharashtra', '6543210987'),
(5, 105, 'Delhi, Delhi', '5432109876');

select * from branch;

insert into employee values(101, 'Mammootty', 'Manager', 60000, 1),
(102, 'Mohanlal', 'Assistant Manager', 55000, 2),
(103, 'Virat Kohli', 'Clerk', 45000, 3),
(104, 'Rohit Sharma', 'Supervisor', 70000, 4),
(105, 'Prithviraj', 'Manager', 80000, 5);

select * from employee;

insert into books values('ISBN001', 'History of India', 'History', 50, 'yes', 'Ramachandra Guha', 'Penguin'),
('ISBN002', 'Wings of Fire', 'Biography', 40, 'yes', 'APJ Abdul Kalam', 'Universities Press'),
('ISBN003', 'Life is What You Make it', 'Fiction', 30, 'no', 'Preethi Shenoy', 'Penguin'),
('ISBN004', 'The Alchemist', 'Fiction', 45, 'yes', 'Paulo Coelho', 'State Press'),
('ISBN005', 'Half Girlfriend', 'Romance', 35, 'yes', 'Chetan Bhagat', 'New Publications');

select * from books;

insert into customer values(201, 'Sachin Tendulkar', 'Mumbai, Maharashtra', '2021-12-15'),
(202, 'MS Dhoni', 'Ranchi, Jharkhand', '2020-11-10'),
(203, 'Fahadh Faasil', 'Kochi, Kerala', '2023-01-25'),
(204, 'Dulquer Salmaan', 'Chennai, Tamil Nadu', '2022-06-30'),
(205, 'Anushka Sharma', 'Mumbai, Maharashtra', '2021-05-20');

select * from customer;

insert into issuestatus values(301, 201, 'History of India', '2023-06-15', 'ISBN001'),
(302, 202, 'Wings of Fire', '2023-02-20', 'ISBN002'),
(303, 203, 'The Alchemist', '2023-04-18', 'ISBN004'),
(304, 204, 'Half Girlfriend', '2023-05-05', 'ISBN005'),
(305, 205, 'Wings of Fire', '2023-06-10', 'ISBN002');

select * from issuestatus;


insert into returnstatus values(401, 201, 'History of India', '2023-07-10', 'ISBN001'),
(402, 202, 'Wings of Fire', '2023-03-10', 'ISBN002'),
(403, 203, 'The Alchemist', '2023-05-01', 'ISBN004'),
(404, 204, 'Half Girlfriend', '2023-05-20', 'ISBN005'),
(405, 205, 'Wings of Fire', '2023-07-15', 'ISBN002');

select * from returnstatus;


# 1. Retrieve the book title, category, and rental price of all available books
select book_title, category, rental_price from books where status = 'yes';

# 2. List the employee names and their respective salaries in descending order of salary
select emp_name, salary from employee order by salary desc;

# 3. Retrieve the book titles and the corresponding customers who have issued those books
select books.book_title, customer.customer_name from issuestatus 
join books on issuestatus.isbn_book = books.isbn join customer on issuestatus.issued_cust = customer.customer_id;


# 4. Display the total count of books in each category
select category, count(*) as total_books from books group by category;

# 5. Retrieve the employee names and their positions for employees whose salaries are above Rs. 50,000
select emp_name, position from employee where salary > 50000;

# 6. list the customer names who registered before 2022-01-01 and have not issued any books yet
select customer_name from customer 
where reg_date < '2022-01-01' 
and customer_id not in (select issued_cust from issuestatus);

# 7. display the branch numbers and the total count of employees in each branch
select branch_no, count(emp_id) as total_employees 
from employee group by branch_no;

# 8.  display the names of customers who have issued books in the month of june 2023
select distinct customer.customer_name 
from issuestatus join customer on issuestatus.issued_cust = customer.customer_id 
where issue_date between '2023-06-01' and '2023-06-30';

# 9. retrieve book_title from book table containing 'history'
select book_title  from books where book_title like '%history%';

# 10. retrieve the branch numbers along with the count of employees for branches having more than 5 employees
select branch_no, count(emp_id) as total_employees 
from employee group by branch_no  having count(emp_id) > 5;

# 11. retrieve the names of employees who manage branches and their respective branch addresses
select employee.emp_name, branch.branch_address from employee 
join branch on employee.emp_id = branch.manager_id;

# 12. display the names of customers who have issued books with a rental price higher than rs. 25
select distinct customer.customer_name  from issuestatus 
join books on issuestatus.isbn_book = books.isbn 
join customer on issuestatus.issued_cust = customer.customer_id 
where books.rental_price > 25;








