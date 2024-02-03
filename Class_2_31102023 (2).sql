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



USE sql_20231030;

SELECT * FROM friends
WHERE
first_name LIKE 'R%'
OR
last_name LIKE 'K%'


SELECT * FROM friends
WHERE
first_name LIKE 'R%'
AND
last_name LIKE 'K%'


--- SQL Constraints
--- NOT NULL
DROP TABLE friends;

SELECT * FROM friends;

CREATE TABLE friends
(
first_name VARCHAR(50) NOT NULL
,last_name VARCHAR(50)
,email VARCHAR(50)
,phone CHAR(10) NOT NULL
,gender CHAR(1) NOT NULL
);

INSERT INTO friends
(
first_name
,phone
,gender
)VALUES
(
'Rohit',
'8888899999',
'M'
)

INSERT INTO
friends (first_name, last_name, email, phone, gender) 
VALUES
(
'sachin',
'Tendulkar',
'sachin@gmail.com',
'9876543210',
'M') 


INSERT INTO  friends
VALUES
('Shrutisree','Maity','sreeshruti@gmail.com',
9001234567,'F');


INSERT INTO friends(first_name,last_name,email,phone,gender)VALUES('Rahul','Singh','rahuls@gmail.com','897456321','M' );

CREATE TABLE friends
(
first_name VARCHAR(50) NOT NULL
,last_name VARCHAR(50)
,email VARCHAR(50)
,phone CHAR(10) NOT NULL
,gender CHAR(1) NOT NULL
);

INSERT INTO friends
(
first_name,
gender
)VALUES
(
'Mayank',
'M'
)

-- Cannot insert the value NULL into column 'phone', table 'sql_20231030.dbo.friends'; column does not allow nulls. INSERT fails.
-- The statement has been terminated.


INSERT INTO friends
(
first_name,
gender,
phone
)VALUES
(
'Mayank',
'M',
'9898989898'
)


SELECT * FROM friends;

-- PRIMARY KEY

CREATE TABLE invoice
(
invoice_id CHAR(6) NOT NULL
,customer VARCHAR(50) NOT NULL
,shipping_address VARCHAR(100) NOT NULL
,amount INT NOT NULL
);


INSERT INTO invoice
VALUES
(
'100001',
'Ramya Ramya',
'J.P. NAGAR 3rd Phase',
5555
);



INSERT INTO invoice
VALUES
(
'200001',
'Ramya Ramya',
'J.P. NAGAR 3rd Phase',
2323
);


INSERT INTO invoice
VALUES
(
'330001',
'Ramya Ramya',
'J.P. NAGAR 3rd Phase',
1000
);


INSERT INTO invoice
VALUES
(
'600001'
,'Ramya Ramya'
,'Banerghatta Road, Menakshi Mall'
,6566
);

SELECT * FROM invoice;


-- RDBMS
DROP TABLE IF EXISTS customers
DROP TABLE IF EXISTS customer
CREATE TABLE customers
(
customer_id INT NOT NULL,
customer_name VARCHAR(50) NOT NULL,
customer_phone CHAR(10) NOT NULL,
customer_email VARCHAR(50),
customer_address VARCHAR(100) NOT NULL,
PRIMARY KEY (customer_id)
);

-- A primary key column cannot be NULL
-- primary key column must be unique
INSERT INTO customers
(
customer_id,
customer_name,
customer_phone,
customer_address
)
VALUES
(
1001,
'Ramya Ramya',
'8877887788',
'JP Nagar Phase 3'
);


SELECT * FROM customers;

INSERT INTO customers
(
customer_id,
customer_name,
customer_phone,
customer_address
)
VALUES
(
1001, --- primary key value of 1001 already exists in the table.
'Mehul',
'966668899',
'BTM Layout Stage 2'
);
-- Violation of PRIMARY KEY constraint 'PK__customer__CD65CB85B8309762'. Cannot insert duplicate key in object 'dbo.customers'. The duplicate key value is (1001)


-- Cannot insert the value NULL into column 'customer_id', table 'sql_20231030.dbo.customers'; column does not allow nulls. INSERT fails.
INSERT INTO customers
(
customer_name,
customer_phone,
customer_address,
customer_email
)
VALUES
(

'Mehul',
'966668899',
'BTM Layout Stage 2',
'mehul@primarykeynull.com'
);
-- Violation of PRIMARY KEY constraint 'PK__customer__CD65CB85B8309762'. Cannot insert duplicate key in object 'dbo.customers'. The duplicate key value is (1001)



INSERT INTO customers
(
customer_id,
customer_name,
customer_phone,
customer_address,
customer_email
)
VALUES
(
1002,
'Mehul',
'966668899',
'BTM Layout Stage 2',
'mehul@primarykeynull.com'
);

SELECT * FROM invoice;



-- second time, when trying to the drop the table i get the following error
-- Cannot drop the table 'invoice', because it does not exist or you do not have permission
DROP TABLE invoice

-- Foreign Key constraint
DROP TABLE IF EXISTS invoice
CREATE TABLE invoice
(
invoice_id INT,
customer_id INT NOT NULL,
price DEC(8, 2) NOT NULL,  ---- 444.55 DEC(PRECISION, SCALE)
PRIMARY KEY(invoice_id),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
)

EXEC sp_help invoice; --- MySQL DESCRIBE invoice;

SELECT * FROM customers
WHERE
customer_name = 'Ramya Ramya';

INSERT INTO invoice
VALUES
(
111,
1001,
5678
);

SELECT * FROM customers
WHERE
customer_id = 1005;

-- The INSERT statement conflicted with the FOREIGN KEY 
-- constraint "FK__invoice__custome__534D60F1". 
--- The conflict occurred in database "sql_20231030", table "dbo.customers", column 'customer_id'
INSERT INTO invoice
VALUES
(
122,
1005,
5678
);

SELECT * FROM invoice;

-- foreign key column must be a primary key in the refercing table
-- There are no primary or candidate keys in the referenced table 'customers' 
--- that match the referencing column list in the foreign key 'FK__invoice_t__custo__5629CD9C'.
DROP TABLE IF EXISTS invoice_test
CREATE TABLE invoice_test
(
invoice_id INT,
customer_addr VARCHAR(100),
price DEC(8, 2) NOT NULL,  ---- 444.55 DEC(PRECISION, SCALE)
PRIMARY KEY(invoice_id),
FOREIGN KEY (customer_addr) REFERENCES customers(customer_address)
)

SELECT * FROM customers;
----The DELETE statement conflicted with the REFERENCE constraint "FK__invoice__custome__534D60F1".
----The conflict occurred in database "sql_20231030", table "dbo.invoice", column 'customer_id'.
DELETE FROM customers WHERE customer_name LIKE 'Ramya%'

DELETE FROM customers WHERE customer_name LIKE 'Mehul%'



--- UNIQUE
CREATE TABLE department_engg
(
department_id CHAR(5) PRIMARY KEY
,dept_name VARCHAR(100) UNIQUE
,dept_hod VARCHAR(100)
,research_schlor INT
);

EXEC sp_help department_engg;


INSERT INTO department_engg
VALUES
(
'CSENG',
'Computer Science Engineering',
'P. Sheshadri',
30
)

--- Violation of UNIQUE KEY constraint 'UQ__departme__C7D39AE1FA257BA0'. 
--- Cannot insert duplicate key in object 'dbo.department_engg'. The duplicate key value is (Computer Science Engineering).
INSERT INTO department_engg
VALUES
(
'MCANG',
'Computer Science Engineering',
'P. Sheshadri',
30
)


INSERT INTO department_engg
VALUES
(
'MCANG',
'MCA',
'P. Sheshadri',
0
)


INSERT INTO department_engg
(
department_id,
dept_hod,
research_schlor
)values
(
'ELECT',
'P. Sukumaran',
10
);


SELECT * FROM department_engg


--Violation of UNIQUE KEY constraint 'UQ__departme__C7D39AE1FA257BA0'. 
--Cannot insert duplicate key in object 'dbo.department_engg'. The duplicate key value is (<NULL>).
INSERT INTO department_engg
(
department_id,
dept_hod,
research_schlor
)values
(
'CIVIL',
'P. Vijaylakshmi',
80
);

--- DEFAULT
CREATE TABLE promotion
(
promotion_id INT PRIMARY KEY,
promotion_name VARCHAR(10) NOT NULL,
discount DEC(6,2) DEFAULT 10
)


INSERT INTO promotion
VALUES
(
1,
'Ugadi',
25
);

INSERT INTO promotion
(
promotion_id,
promotion_name
)VALUES
(
2,
'Regular'
)


EXEC sp_help promotion;


SELECT * FROM promotion;

--- create table students

DROP TABLE IF EXISTS students
DROP TABLE IF EXISTS student
CREATE TABLE students
(
student_id INT NOT NULL,
student_name VARCHAR(50) NOT NULL,
student_phone CHAR(10) NOT NULL,
student_email VARCHAR(50),
student_address VARCHAR(100) NOT NULL,
PRIMARY KEY (student_id)
);

-- A primary key column cannot be NULL
-- primary key column must be unique
INSERT INTO students
(
student_id,
student_name,
student_phone,
student_address
)
VALUES
(
1001,
'Ramya Ramya',
'8877887788',
'JP Nagar Phase 3'
);


SELECT * FROM students;

INSERT INTO students
(
student_id,
student_name,
student_phone,
student_address
)
VALUES
(
1001, --- primary key value of 1001 already exists in the table.
'Mehul',
'966668899',
'BTM Layout Stage 2'
);
-- Violation of PRIMARY KEY constraint 'PK__student__CD65CB85B8309762'. Cannot insert duplicate key in object 'dbo.students'. The duplicate key value is (1001)


-- Cannot insert the value NULL into column 'student_id', table 'sql_20231030.dbo.students'; column does not allow nulls. INSERT fails.
INSERT INTO students
(
student_name,
student_phone,
student_address,
student_email
)
VALUES
(

'Mehul',
'966668899',
'BTM Layout Stage 2',
'mehul@primarykeynull.com'
);
-- Violation of PRIMARY KEY constraint 'PK__student__CD65CB85B8309762'. Cannot insert duplicate key in object 'dbo.students'. The duplicate key value is (1001)



INSERT INTO students
(
student_id,
student_name,
student_phone,
student_address,
student_email
)
VALUES
(
1002,
'Mehul',
'966668899',
'BTM Layout Stage 2',
'mehul@primarykeynull.com'
);



SELECT * FROM department_engg;

DROP TABLE IF EXISTS  student_marks ;
CREATE TABLE student_marks
(
student_id INT,
dept_id CHAR(5),
marks DEC(6,2) CHECK( marks >= 0 and marks <=100),
PRIMARY KEY (student_id, dept_id), -- here combination of two columns make a primary key, hence this is known as composite primary key
FOREIGN KEY(student_id) REFERENCES students(student_id),
FOREIGN KEY(dept_id) REFERENCES department_engg(department_id)
);

EXEC sp_help student_marks

INSERT INTO student_marks
VALUES
(
1001,
'CSENG', -- 1001 CSENG ( PRIMARY KEY )
88
);


--- This code results in this error
--- Violation of PRIMARY KEY constraint 'PK__student___77F9630D204FD1D9'. 
--- Cannot insert duplicate key in object 'dbo.student_marks'. The duplicate key value is (1001, CSENG).

INSERT INTO student_marks
VALUES
(
1001,
'CSENG', -- 1001 CSENG ( PRIMARY KEY )
98
);

-- Conflict occurred in database "sql_20231030", table "dbo.student_marks", column 'marks'.
INSERT INTO student_marks
VALUES
(
1002,
'ELECT',
-10
)

INSERT INTO student_marks
VALUES
(
1002,
'ELECT',
80
)

-- The INSERT statement conflicted with the FOREIGN KEY constraint "FK__student_m__dept___66603565".
-- The conflict occurred in database "sql_20231030", table "dbo.department_engg", column 'department_id'.

INSERT INTO student_marks
VALUES
(
1002,
'PHYSC',
10
)


EXEC sp_help friends;
-- recreate the friends table so that the CHECK constraint is applied on the GENDER column and the the value of gender can be M, F