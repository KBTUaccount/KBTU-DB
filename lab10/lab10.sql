-- initial tables
CREATE TABLE Books(
    book_id INTEGER PRIMARY KEY,
    title VARCHAR(50),
    author VARCHAR(50),
    price DECIMAL,
    quantity INTEGER
);

CREATE TABLE Orders(
    order_id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES Books(book_id),
    customer_id INTEGER,
    order_date DATE,
    quantity INTEGER
);

CREATE TABLE Customers(
    customer_id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50)
);

INSERT INTO Books(book_id, title, author, price, quantity) VALUES
(1, 'Database 101', 'A. Smith', 40.0, 10),
(2, 'Learn SQL', 'B. Johnson', 35.0, 15),
(3, 'Advanced DB', 'C. Lee', 50.0, 5);

INSERT INTO Customers(customer_id, name, email) VALUES
(101, 'John Doe', 'johndoe@example.com'),
(102, 'Jane Doe', 'janedoe@example.com');

--1
BEGIN;
INSERT INTO Orders(customer_id, quantity, book_id) VALUES
(101, 2, 1);
UPDATE Books SET quantity = quantity - 2 WHERE book_id = 1;
COMMIT;

--2
BEGIN;
INSERT INTO Orders (customer_id, quantity, book_id) VALUES (102, 10, 3);
UPDATE Books
SET quantity = quantity - 10
WHERE book_id = 3;
SELECT quantity FROM Books WHERE book_id = 3; --???????
ROLLBACK;

--3
--first transaction
BEGIN;
UPDATE Books SET price = price + 100 WHERE book_id = 2;
--after reading first time
COMMIT;


--second transaction
BEGIN;
SELECT * FROM Books;
SELECT * FROM Books;
COMMIT;

--4
BEGIN;
UPDATE Customers SET email = 'aboba' WHERE customer_id = 101;
COMMIT; 
