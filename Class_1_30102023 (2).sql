CREATE DATABASE sql_20231030;

-- Database is going to hold your tables in one place

--- the table will hold that data that you as a user want to store


USE sql_20231030;


CREATE TABLE friends
(
first_name  VARCHAR(50),
last_name VARCHAR(50),
place VARCHAR(100)
);

EXEC sp_help friends;

INSERT INTO friends
(
first_name,
last_name,
place
)VALUES
(
'Rahul'
,'Singh'
,'Jaipur'
)

INSERT INTO friends
VALUES
(
'Arjun', -- first_name
'Kumar', -- last_name
'Kota' -- place
)

-- this is a comment. a comment starts with two dash's
-- to see the records that I have inserted so far
SELECT * FROM friends



INSERT INTO friends
VALUES
(
'Lohith', -- first_name
'Devan', -- last_name
'Chennai'
)

SELECT * FROM friends


INSERT INTO friends
(
last_name
,first_name
,place
)VALUES
(
'Srivastava',
'Rohit',
'Kolkata'
);

INSERT INTO friends
(
first_name
,place
)VALUES
(
'Amit',
'Hubbali'
);


SELECT * FROM friends; --- SQL will NULL for last_name and NULL mean unknown 


INSERT INTO friends
VALUES(
'Samar',  -- first_name
'Karmakar', -- last_name
'Lucknow' --place
);


SELECT first_name, last_name
FROM
friends;

SELECT place, first_name, last_name
FROM
friends;

SELECT place FROM friends;


SELECT *
FROM
friends
WHERE
first_name = 'Rahul'

INSERT INTO friends
VALUES
(
'Rahul',
'Kulkarni',
'Mumbai'
)

SELECT *
FROM
friends
WHERE
first_name = 'Rahul'
OR
place = 'Lucknow'

SELECT *
FROM
friends
WHERE
first_name  = 'Rahul'
AND
place = 'Lucknow'




-- I am asking SQL SERVER to find those rows WHERE value of last_name is missing
SELECT * FROM friends
WHERE
last_name IS NULL  


'John Null Dublin'

INSERT INTO friends
VALUES
(
'John',
'NULL',
'Dublin')


SELECT * FROM friends WHERE last_name = 'NULL'

SELECT * FROM friends WHERE last_name IS NULL



UPDATE friends
SET last_name = 'Gowda'
WHERE last_name IS NULL
-- (1 row affected)

DELETE FROM friends
WHERE last_name = 'NULL'


SELECT * FROM friends

DELETE FROM friends
--
-- Amit 30000
-- Vishal 45000
-- Vijay 75000
-- Ajay   -1 

-- Column name or number of supplied values does not match table definition.


SELECT * FROM friends;




--- Arbaaz -- String
--- Itesh
--- Yoga
--- Sindhu





