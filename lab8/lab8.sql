CREATE DATABASE lab8;

CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT REFERENCES salesman(salesman_id)
);

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT REFERENCES customers(customer_id),
    salesman_id INT REFERENCES salesman(salesman_id)
);

INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'Berlin', 0.12),
(5009, 'Aboba', 'New York', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 0, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001);

--3
CREATE ROLE junior_dev LOGIN;
--OR: CREATE USER junior_dev;

--4
CREATE VIEW new_york_view AS
SELECT * FROM salesman
WHERE city = 'New York';

--5
CREATE VIEW orders_names AS
SELECT salesman.name AS salesman_name, customers.cust_name AS customers_name
FROM orders
JOIN salesman ON orders.salesman_id = salesman.salesman_id
JOIN customers ON orders.customer_id = customers.customer_id;

GRANT ALL privileges ON orders_names TO junior_dev;

--6
CREATE VIEW highest_grade_customers AS 
SELECT * FROM customers
WHERE grade = (
	SELECT MAX(grade)
	FROM customers
);

GRANT SELECT ON highest_grade_customers TO junior_dev;

--7
CREATE VIEW salesman_by_city AS 
SELECT city, COUNT(*) FROM salesman
GROUP BY city;

--8
CREATE VIEW more_than_one_cust AS
SELECT * FROM salesman
WHERE salesman_id IN (
SELECT salesman_id FROM customers
GROUP BY salesman_id
HAVING COUNT(*) > 1
);

--9
CREATE role intern;
GRANT junior_dev TO intern;