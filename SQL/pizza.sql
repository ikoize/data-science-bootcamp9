-- Crete table customer
CREATE TABLE customer (
  customerid int primary key,
  customername text
);

-- Insert data into customer
INSERT INTO customer VALUES 
(001, 'John'),
(002, 'Mary'),
(003, 'Kim'),
(004, 'Mark'),
(005, 'Sasha'),
(006, 'Sam'),
(007, 'Jen'),
(008, 'Peter'),
(009, 'Alan'),
(010, 'Alice');

-- Create table menu
CREATE TABLE menu (
  menuid int primary key,
  types text,
  size text,
  price real
);

-- Insert data into menu
INSERT INTO menu VALUES
  (101, 'Hawaiian', 'Small', 199),
  (102, 'Hawaiian', 'Medium', 299),
  (103, 'Hawaiian', 'Large', 399),
  (201, 'Cheese', 'Small', 199),
  (202, 'Cheese', 'Medium', 299),
  (203, 'Cheese', 'Large', 399),
  (301, 'Veggie', 'Small', 199),
  (302, 'Veggie', 'Medium', 299),
  (303, 'Veggie', 'Large', 399),
  (401, 'Pepperoni', 'Small', 199),
  (402, 'Pepperoni', 'Medium', 299),
  (403, 'Pepperoni', 'Large', 399),
  (501, 'Meat', 'Small', 199),
  (502, 'Meat', 'Medium', 299),
  (503, 'Meat', 'Large', 399);

-- Create table orders
CREATE TABLE orders (
  orderid int primary key,
  datetime text, 
  customerid int,
  menuid int,
  types text,
  size text,
  price real, 
  quantity int
);

-- Insert data into orders
INSERT INTO orders VALUES
  (1, '2023-10-01 10:30:00', 001, 101, 'Hawaiian', 'Small', 199, 2),
  (2, '2023-10-01 12:15:00', 002, 201, 'Cheese', 'Medium', 299, 1),
  (3, '2023-10-01 15:00:00', 003, 503, 'Meat', 'Large', 399, 1),
  (4, '2023-10-02 11:00:00', 004, 201, 'Cheese', 'Small', 199, 2),
  (5, '2023-10-02 12:30:00', 005, 202, 'Cheese', 'Medium', 299, 1),
  (6, '2023-10-03 10:00:00', 006, 401, 'Pepperoni', 'Small', 199, 2),
  (7, '2023-10-04 16:00:00', 007, 401, 'Pepperoni', 'Small', 199, 2),
  (8, '2023-10-04 20:00:00', 008, 102, 'Hawaiian', 'Medium', 299, 1),
  (9, '2023-10-05 14:30:00', 009, 103, 'Hawaiian', 'Large', 399, 1),
  (10, '2023-10-05 21:00:00', 010, 501, 'Meat', 'Small', 199, 2),
  (11, '2023-10-06 10:50:00', 001, 302, 'Veggie', 'Medium', 299, 1),
  (12, '2023-10-06 18:20:00', 003, 503, 'Meat', 'Large', 399, 1);

-- Query 1 Join
select
  m.menuid,
  m.types,
  orderid,
  o.size
from menu as m 
join orders as o
on m.menuid = o.menuid 
where m.types = 'Hawaiian';


-- Query 2 
select 
  orders.orderid,
  orders.datetime,
  customer.customername,
  menu.types,
  menu.size,
  menu.price,
  orders.quantity
from orders
join customer on orders.customerid = customer.customerid
join menu on orders.menuid = menu.menuid;

-- Query 3 Aggregate
select
  customer.customername,
  sum(menu.price * orders.quantity) as total_price
from orders
join customer on orders.customerid = customer.customerid
join menu on orders.menuid = menu.menuid
group by customer.customername;

-- Query 4 Subqueries
select 
  orderid,
  datetime,
  customerid,
  types,
  size
from orders
where types in (
  select types
  from orders
  where types = 'Pepperoni'
);

-- Query 5
select
  customer.customername,
  sum(menu.price * orders.quantity) as total_price
from orders
join customer on orders.customerid = customer.customerid
join menu on orders.menuid = menu.menuid
where orders.datetime between '2023-10-01' and '2023-10-05'
group by customer.customername;

-- Query 6 Aggregate
select sum(price * quantity) as total_week
from orders 
where datetime between '2023-10-01' and '2023-10-05';

