-- 1
CREATE OR REPLACE FUNCTION increase_value(val INTEGER)
RETURNS INTEGER AS $$
BEGIN
RETURN val + 10;
END; $$
LANGUAGE plpgsql;

--2
CREATE OR REPLACE FUNCTION compare_numbers(val1 INTEGER, val2 INTEGER) 
RETURNS VARCHAR AS $$
BEGIN
    IF val1 > val2 THEN
        RETURN 'Greater';
    ELSIF val1 < val2 THEN
        RETURN 'Lesser';
    ELSE
        RETURN 'Equal';
    END IF;
END;
$$
LANGUAGE plpgsql;


--3
CREATE OR REPLACE FUNCTION number_series(num INTEGER) 
RETURNS TABLE (num_ret INTEGER) AS $$
DECLARE
	i INTEGER := 1;
BEGIN
	WHILE i <= num LOOP
		num_ret = i;
		RETURN NEXT;
		i := i + 1;
	END LOOP;
END;
$$
LANGUAGE plpgsql;

--4

-- CREATE TABLE employees(
-- 	id INTEGER PRIMARY KEY,
-- 	salary INTEGER,
-- 	name VARCHAR(50)
-- );

-- INSERT INTO employees(id, salary, name) VALUES
-- (1, 1000, 'dima'),
-- (2, 10000, 'aboba'),
-- (3, 100500, 'fiaa'),
-- (4, 100300, 'lisa'),
-- (5, 120500, 'kidfa'),
-- (6, 400500, 'rid');

CREATE OR REPLACE FUNCTION list_products(search_product VARCHAR)
RETURNS TABLE(id INTEGER, found_product VARCHAR, name VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT id, category AS found_product, name FROM products
    WHERE category = search_product;
END;
$$
LANGUAGE plpgsql;


--5

-- CREATE TABLE products(
-- 	id INTEGER PRIMARY KEY,
-- 	category VARCHAR,
-- 	name VARCHAR(50)
-- );

-- INSERT INTO products(id, category, name) VALUES
-- (1, 'moloko', 'dima'),
-- (2, 'moloko', 'aboba'),
-- (3, 'myaso', 'fiaa'),
-- (4, 'moloko', 'lisa'),
-- (5, 'myaso', 'kidfa'),
-- (6, 'myaso', 'rid');


CREATE OR REPLACE FUNCTION list_products(search_product VARCHAR)
RETURNS TABLE(id INTEGER, found_product VARCHAR, name VARCHAR) AS $$
BEGIN
	RETURN QUERY
	SELECT * FROM products
	WHERE category = search_product;
END;
$$
LANGUAGE plpgsql;


--6
CREATE OR REPLACE FUNCTION multiply_two_nums(num1 INT, num2 INT)
RETURNS INT AS $$
BEGIN 
	RETURN num1 * num2;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION square_and_multiply(num1 INT, num2 INT)
RETURNS INT AS $$
BEGIN
RETURN multiply_two_nums(num1, num2) * multiply_two_nums(num1, num2);
END;
$$ LANGUAGE plpgsql;

SELECT square_and_multiply(3, 2); -- 36



--7
CREATE OR REPLACE FUNCTION complex_calculation(input_num INTEGER, input_text VARCHAR)
RETURNS INTEGER AS $$
DECLARE
    numeric_result INTEGER := 0;
    string_result INTEGER := 0;
BEGIN
    numeric_block:
    BEGIN
        numeric_result := input_num * 2;
    END numeric_block;
    
    string_block:
    BEGIN
        string_result := length(input_text);
    END string_block;
    RETURN numeric_result + string_result;
END;
$$ LANGUAGE plpgsql;
