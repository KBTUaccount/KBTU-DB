-- first task
CREATE DATABASE lab1;


--second
CREATE TABLE users(
    id SERIAL,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);


--third
ALTER TABLE users
ADD COLUMN isadmin INT;


--fourth
ALTER TABLE users
ALTER COLUMN isadmin TYPE BOOLEAN USING (isadmin::boolean);


--fifth
ALTER TABLE users
ALTER COLUMN isadmin SET DEFAULT FALSE;


--sixth
ALTER TABLE users
ADD PRIMARY KEY(id);


--seventh
CREATE TABLE tasks(
    id SERIAL,
    name VARCHAR(50),
    user_id INT
);


--eighth
DROP TABLE tasks;


--nineth
DROP DATABASE lab1;