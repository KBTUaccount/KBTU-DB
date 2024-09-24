--1
CREATE DATABASE lab2;

--2
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100),
    region_id INTEGER,
    population INTEGER
);

--3
INSERT INTO countries (country_name, region_id, population)
VALUES ('Ukraine', 1, 12000000);

--4
INSERT INTO countries (country_name)
VALUES ('Kazakhstan');

--5
INSERT INTO countries (region_id)
VALUES (NULL);

--6
INSERT INTO countries (country_name, region_id, population) VALUES
('USA', 3, 130000000),
('Canada', 4, 2349082),
('Switzerland', 5, 324235);

--7
ALTER TABLE countries
ALTER country_name SET DEFAULT 'Kazakhstan';

--8
INSERT INTO countries (region_id, population)
VALUES (4, 18500000);

--9
INSERT INTO countries DEFAULT VALUES;

--10
CREATE TABLE countries_new (LIKE countries INCLUDING ALL);

--11
    INSERT INTO countries_new
    SELECT * FROM countries;

--12
UPDATE countries
SET region_id = 1
WHERE region_id IS NULL;

--13
UPDATE countries
SET population = (population * 1.10)::INTEGER
RETURNING country_name, population AS "New Population";

--14
DELETE FROM countries
WHERE population < 100000;

--15
DELETE FROM countries_new
USING countries
WHERE countries_new.country_id = countries.country_id
RETURNING countries_new.*;

--16
DELETE FROM countries
RETURNING *;






