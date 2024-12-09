drop database amish;
 create database assignment_9;
 
 use assignment_9;
 
create table worker (worker_id int primary key,
firstname char(25),
lastname char(25),
salary int,
joiningdate datetime,
department char(25));

insert into worker values (101, 'sachin', 'tendulkar', 75000, '2024-12-10 09:00:00', 'hr'),
(102, 'dhoni', 'singh', 85000, '2024-10-12 09:30:00', 'finance'),
(103, 'virat', 'kohli', 95000, '2024-11-05 08:45:00', 'it'),
(104, 'deepika', 'padukone', 72000, '2024-09-23 10:15:00', 'hr'),
(105, 'keerthi', 'suresh', 88000, '2024-08-14 11:00:00', 'finance');

select * from worker;

# 1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call.

delimiter //

create procedure addworker(
	in p_worker_id int, 
    in p_firstname char(25), 
    in p_lastname char(25), 
    in p_salary int, 
    in p_joiningdate datetime, 
    in p_department char(25))
begin
    insert into worker (worker_id, firstname, lastname, salary, joiningdate, department) 
    values (p_worker_id, p_firstname, p_lastname, p_salary, p_joiningdate, p_department);
end //

delimiter ;

call addworker(106, 'rohit', 'sharma', 90000, '2024-12-11 09:00:00', 'marketing');

# 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call.

delimiter //

create procedure getworkersalary(
    in p_worker_id int, 
    out p_salary int)
begin
    select salary into p_salary 
    from worker 
    where worker_id = p_worker_id;
end //

delimiter ;

call getworkersalary(103, @salary);

select @salary as salary;

# 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call.

delimiter //

create procedure updateworkerdepartment(
    in p_worker_id int, 
    in p_department char(25))
begin
    update worker 
    set department = p_department 
    where worker_id = p_worker_id;
end //

delimiter ;

call updateworkerdepartment(104, 'finance');

select * from worker;

# 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call.

delimiter //

create procedure countworkersbydepartment(
    in p_department char(25), 
    out p_workercount int)
begin
    select count(*) into p_workercount 
    from worker 
    where department = p_department;
end //

delimiter ;

call countworkersbydepartment('finance', @workercount);

select @workercount as workercount;

# 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.

delimiter //

create procedure avgsalarybydepartment(
    in p_department char(25), 
    out p_avgsalary decimal(10,2))
begin
    select avg(salary) into p_avgsalary 
    from worker 
    where department = p_department;
end //

delimiter ;

call avgsalarybydepartment('it', @avgsalary);

select @avgsalary as avgsalary;




