create database assignment_10;

use assignment_10;

# 1.Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows

create table teachers (
    id int auto_increment primary key,
    name varchar(100) not null,
    subject varchar(50) not null,
    experience int not null,
    salary decimal(10, 2) not null
);

insert into teachers (name, subject, experience, salary) values 
('amitabh bachchan', 'mathematics', 5, 50000),
('shah rukh khan', 'science', 12, 75000),
('mohanlal', 'history', 8, 62000),
('manju warrier', 'english', 3, 40000),
('ranbir kapoor', 'physics', 15, 90000),
('keerthy suresh', 'chemistry', 7, 65000),
('akshay kumar', 'biology', 10, 70000),
('prithviraj sukumaran', 'geography', 2, 35000);

# 2.Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero.

delimiter //
create trigger before_insert_teacher 
before insert on teachers 
for each row 
begin 
    if new.salary < 0 then 
        signal sqlstate '45000' 
        set message_text = 'salary cannot be negative'; 
    end if; 
end; //
delimiter ;

# 3.Create an after insert trigger named after_insert_teacher 

create table teacher_log (
    log_id int auto_increment primary key,
    teacher_id int not null,
    action varchar(50) not null,
    log_timestamp timestamp default current_timestamp
);

delimiter //
create trigger after_insert_teacher 
after insert on teachers 
for each row 
begin 
    insert into teacher_log (teacher_id, action) 
    values (new.id, 'insert'); 
end; //
delimiter ;

# 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years.

delimiter //
create trigger before_delete_teacher 
before delete on teachers 
for each row 
begin 
    if old.experience > 10 then 
        signal sqlstate '45000' 
        set message_text = 'cannot delete a teacher with more than 10 years of experience'; 
    end if; 
end; //
delimiter ;

#5.Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.

delimiter //
create trigger after_delete_teacher 
after delete on teachers 
for each row 
begin 
    insert into teacher_log (teacher_id, action) 
    values (old.id, 'delete'); 
end; //
delimiter ;

