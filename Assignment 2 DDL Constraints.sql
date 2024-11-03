create database sales;

use sales;

create table orders(
order_id int auto_increment primary key,
customer_name varchar(50) not null,
product_category varchar(50),
ordered_item varchar(50) not null,
contact_no varchar(15),
unique (order_id));

# 1) Add a new coloumn
alter table orders add order_quantity int;

# 2)Rename
alter table orders rename to sales_orders;

# 3)insert rows
insert into sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
VALUES(1, 'Arun','Furniture','Chair',0987654321,4),
(2,'Mohan','Home_Appliances','AC',13567890234,1),
(3,'Merin','Electronics','Mobilephone',1234567890,1),
(4,'John','Clothing','Shirt',23456789012,6),
(5,'David','Home_Appliances','AC',45678901234,1),
(6,'Manu','Electronics','Laptop',98707654321,1),
(7,'Akhilesh','Furniture','Table',01928374655,2),
(8,'Vyshnavi','Clothing','Saree', 12340987654,6),
(9,'Arjun','Stationary','Notebook',98761234501,9),
(10,'Gayathri','Stationary','Pen',10293874656,6);

SELECT * FROM sales_orders;

# 4)Retrieve customer_name and Ordered_Item from the sales_orders
SELECT Customer_name, Ordered_item
FROM sales_orders;

# 5)Use the update command 
UPDATE sales_orders
SET Ordered_item = 'Mobilephone'
WHERE Order_Id = 6;

SELECT * FROM sales_orders;

# 6)Delete
DROP TABLE sales_orders;






