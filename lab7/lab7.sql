--0.1
CREATE DATABASE lab7;

--0.5
CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);

--0.8
INSERT INTO locations (street_address, postal_code, city, state_province) VALUES
('123 Maple Street', '10001', 'New York', 'NY'),
('456 Oak Avenue', '90001', 'Los Angeles', 'CA'),
('789 Pine Road', '60601', 'Chicago', 'IL'),
('321 Birch Boulevard', '77001', 'Houston', 'TX'),
('654 Cedar Lane', '85001', 'Phoenix', 'AZ');

INSERT INTO departments (department_name, budget, location_id) VALUES
('Human Resources', 500000, 1),
('Engineering', 1500000, 2),
('Sales', 800000, 3),
('Marketing', 600000, 4),
('Finance', 700000, 5);

INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', 75000, 2),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', 68000, 3),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-8765', 82000, 2),
('Bob', 'Lee', 'bob.lee@example.com', '555-4321', 54000, 1),
('Charlie', 'Brown', 'charlie.brown@example.com', '555-0000', 61000, 4),
('Diana', 'Prince', 'diana.prince@example.com', '555-1111', 95000, 5),
('Ethan', 'Hunt', 'ethan.hunt@example.com', '555-2222', 88000, 2);

--1
CREATE INDEX locations_city_index ON locations(city);

--2
CREATE INDEX employees_name_surname_index ON employees(first_name, last_name);

--3
CREATE UNIQUE INDEX employees_salary_index ON employees(salary);

--4
CREATE INDEX employees_firstname_substring_index ON employees ((substring(first_name from 1 for 4)));

--5
CREATE INDEX employee_departmentID_salary_index ON employees(department_id, salary);
CREATE INDEX departments_budget_index ON departments(budget);