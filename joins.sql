-- in office database
-- need joins to fetch details spread across different tables
-- we need to join multiple tables together in a single tables

-- what are the different kinds of joins



--- CREATE table
--- What is the plan for today and tomorrow
--- 12:30 - 3:30 MySQL
--- 3:30 - 5:30 Testing

-- 9:30 - 11:30 pandas

--- 5:30 -- 9:30 pandas and windows FUNCTION

--- 12:30 - 5:30 pandas


-- A database is a container that holds table and other SQL structures
--- related to those tables

--- A Database is a container that holds table and other MySQL
-- Structures related to those tables
--- Everytime you search online, go shopping, call information
--- make a reservation, get a booking order or buy groceries
--- a database is asked for information otherwise known as being
--- queried
--- Think of database as a container that holds information

-- A table is a structure inside your Database that contains database
-- organized in columns and rows

--- A atble is a structure inside your Database that contains
-- Organized in columns and rows

--- rememer those categoris you came up with?
--- each category becomes a column in our table.
--- a row will contain all the information abour one object in your
--- table

--- A table row contains all the information about one object in your tables
-- in our database table one row would be all information about one person
-- here is an example of some of the data that might be in a row
--- John, Jackson, single, writer, jj@boards-r-us.com

--- Create tables
DROP TABLE IF EXISTS my_contacts;
CREATE TABLE my_contacts
(
    last_name VARCHAR(50)
    ,first_name VARCHAR(50)
    ,email VARCHAR(100)
    ,birthday DATE
    ,gender CHAR(1)
    ,profession VARCHAR(50)
    ,location VARCHAR(50)
    ,relationship VARCHAR(50)
    ,interests VARCHAR(100)
    ,seeking VARCHAR(100)
);




-- You would need datatypes for other kinds of Data, like Numbers
--- You would need datatypes for other kinds of Data Like Numbers
--- we wouldnt want to store that as a VARCHAR

--values stored in VARCHAR are interpreted as TEXT and you wont be able to perform
--- mathematical operation on those columns_name
--- example of few othe rdata datatypes

--- price , The cost of an item, 5678.99 DEC(5, 2)
--- zip CHAR(6)
--- atomic weights 89.929292 DEC(2, 6)
--- Comments -- Threse are large blob of TEXT
--- quanitity, How many items in stock
--- tax rate example 3.755 DEC (1, 3)
--- Book Title NVARCHAR(200)
--- gender Single character like M F CHAR(1)
--- phone_number CHAR(10)
--- state_code CHAR(2)
--- anniversy DATE
--- state VARCHAR(100)
--- games_won INT
--- meeting time DATETIME

-- Why do I need seperate numeric datatypes for INT AND DEC
--- Why do I need seperate numeric datatypes for INT and DEC. It all Comes
-- to database storage and efficiency, choose the best matchin datatypes for
--- each column in your table will reduce the size of the table and make operations on your data faster



-- Steps to create table
-- Break your data into categories before you create your tables
-- pay attention to the type of data for each columns.
-- pay attention to the type of data for each columns


-- use the CREATE DATABASE statement to create a DATABASE, which will hold ALL
--- of you tables
--- Use the USE DATABASE statements to get inside your database to create your tables


-- all tables are created with a create table statement , containing column names
-- and their corresponding data datatypes
-

-- check if a table is created properly
DESC my_contacts;

-- You cannot create a table that already exists. You cannot create a database that
--- already exists,

-- You can't create a table that already exists, And once you create a database
--


USE classic_models;

--- To drop a table we will use the DROP TABLE IF Exists
--- use the drop tale with extreme caution because as you drop the table
--- you will also drop the data that is present in that tables


-- To add data from your sticky notes to yor table we will use the INSERT INTO


-- CHAR, VARCHAR and DATE use single quotes around them
-- Numerical values like DEC, INT dont use quotes
INSERT INTO my_contacts
  ( --- Set up your column nmes seperated by commans, Y
      last_name
      ,first_name
      ,email
      ,birthday
      ,gender
      ,profession
      ,location
      ,relationship
      ,interests
      ,seeking
  )VALUES  --- the values in the second set of parenthesis should be same order as the column names
  (        --- The command below isn't a real command
      'Mukherjee'
      ,'Purnendu'
      ,'puru.muk@email.com'
      ,'1981-12-08'
      ,'M'
      ,'Software Developer'
      ,'Bengaluru'
      ,'Married'
      ,'Drawing'
      ,'Trekking Partners'
    );
DROP TABLE IF EXISTS employee;
CREATE TABLE employee
(
  emp_id  VARCHAR(20)
  ,emp_name VARCHAR(50)
  ,salary INT
  ,dept_id VARCHAR(20)
  ,manager_id VARCHAR(20)
);

--- Create an EMPLOYEE table where there is INT column datatypes
DROP TABLE IF EXISTS employee;
CREATE table employee
  (
    employee_id INT
    ,emp_name VARCHAR(60)
    ,emp_dob DATE
    ,dept_name VARCHAR(60)
    ,location VARCHAR(50)
    ,salary DEC(10, 2)
  );

-- Another way of inserting data into the employee table

INSERT INTO employee
VALUES
(
  1
  ,'Unmesh Panigrahy'
  ,'1985-06-20'
  ,'SD-Report'
  ,'Behrampur, Orissa'
  ,50000
);

INSERT INTO employee
VALUES
(2, 'Rahul', '1987-08-12', 'SD-DB', 'Bengaluru, Karnataka', 15000),
(3, 'Manoj',  '1991-08-12', 'SD-WEB', 'Hyderabad', 5000),
(4, 'Jamuna',  '1980-08-12', 'SD-DB', 'Mysuru, Karnataka', 85000),
(5, 'Madhusudhan',  '1999-07-12', 'SD-Report', 'Bhubaneshwar, Orissa', 30000),
(6, 'Amit',  '1989-10-22', 'SD-Web', 'Kolkata, West Bengal', 75000),
(7, 'Robin',  '1986-11-12', 'SD-DB', 'Chennai, Tamil Nadu', 55000);


INSERT INTO employee VALUES (8, 'Parth Bedi', '1984-05-10', 'SD-DB', 'Kannur, Kerela', 37543 );
INSERT INTO employee VALUES (9, 'Anika Bakshi', '1981-02-18', 'SD-DB', 'Cochin, Kerela', 72882 );
INSERT INTO employee VALUES (10, 'Arjun Bhatt', '1983-04-24', 'SD-Web', 'Indore, Madhya Pradesh', 42840 );
INSERT INTO employee VALUES (11, 'Krishna Jain', '1981-02-21', 'SD-Report', 'Vishakapatnam, Andra Pradesh', 49713 );
INSERT INTO employee VALUES (12, 'Sai Bhatt', '1989-10-21', 'SD-Infra', 'Jamshedpur, Jharkhand', 64356 );
INSERT INTO employee VALUES (13, 'Atharv Anand', '1984-05-11', 'SD-Web', 'Indore, Madhya Pradesh', 34800 );
INSERT INTO employee VALUES (14, 'Mithila Arya', '1991-12-23', 'SD-Web', 'Indore, Madhya Pradesh', 67496 );
INSERT INTO employee VALUES (15, 'Moon Laghari', '1983-04-11', 'SD-Infra', 'Indore, Madhya Pradesh', 71100 );
INSERT INTO employee VALUES (16, 'Krishna Kumar', '1989-10-23', 'SD-DB', 'Coimbatore, Tamil Nadu', 79182 );
INSERT INTO employee VALUES (17, 'Raj Das', '1990-11-17', 'SD-Web', 'Jamshedpur, Jharkhand', 78129 );
INSERT INTO employee VALUES (18, 'Ayaan Agarwal', '1984-05-14', 'SD-DB', 'Chennai, Tamil Nadu', 71726 );
INSERT INTO employee VALUES (19, 'Aditi Basu', '1985-06-16', 'SD-DB', 'Cochin, Kerela', 21883 );
INSERT INTO employee VALUES (20, 'Aarav Ahluwalia', '1984-05-20', 'SD-Report', 'Jamshedpur, Jharkhand', 38829 );
INSERT INTO employee VALUES (21, 'Ananya Banerjee', '1980-01-15', 'SD-Web', 'Indore, Madhya Pradesh', 16553 );
INSERT INTO employee VALUES (22, 'Parth Jha', '1991-12-12', 'SD-DB', 'Cochin, Kerela', 23045 );
INSERT INTO employee VALUES (23, 'Aditya Kumar', '1989-10-19', 'SD-Infra', 'Vijaywada, Andra Pradesh', 36019 );
INSERT INTO employee VALUES (24, 'Aditi Ganguly', '1985-06-15', 'SD-Web', 'Pune, Maharashtra', 16342 );
INSERT INTO employee VALUES (25, 'Yash Ahluwalia', '1991-12-14', 'SD-Web', 'Nashik, Maharashtra', 11321 );
INSERT INTO employee VALUES (26, 'Parth Ahluwalia', '1980-01-21', 'SD-Web', 'Bengaluru, Karnataka', 17762 );
INSERT INTO employee VALUES (27, 'Abhay Deshpande', '1990-11-21', 'SD-DB', 'Ranchi, Jharkhand', 39920 );
INSERT INTO employee VALUES (28, 'Advik Laghari', '1990-11-21', 'SD-DB', 'Jamshedpur, Jharkhand', 33726 );
INSERT INTO employee VALUES (29, 'Navya Kumar', '1982-03-17', 'SD-Web', 'Vishakapatnam, Andra Pradesh', 52308 );
INSERT INTO employee VALUES (30, 'Yash Ganguly', '1981-02-11', 'SD-Infra', 'Kolkata, West Bengal', 29445 );
INSERT INTO employee VALUES (31, 'Ayaan Kumar', '1988-09-18', 'SD-DB', 'Kolkata, West Bengal', 29988 );
INSERT INTO employee VALUES (32, 'Kabir Burman', '1981-02-17', 'SD-Web', 'Kannur, Kerela', 75343 );
INSERT INTO employee VALUES (33, 'Arjun Acharya', '1982-03-15', 'SD-Infra', 'Kolkata, West Bengal', 77710 );
INSERT INTO employee VALUES (34, 'Aditya Anand', '1991-12-13', 'SD-Web', 'Coimbatore, Tamil Nadu', 68580 );
INSERT INTO employee VALUES (35, 'Aditi Jain', '1987-08-19', 'SD-DB', 'Kolkata, West Bengal', 19038 );
INSERT INTO employee VALUES (36, 'Kabir Das', '1986-07-17', 'SD-DB', 'Bhopal, Madhya Pradesh', 49218 );
INSERT INTO employee VALUES (37, 'Kabir Banerjee', '1986-07-12', 'SD-DB', 'Kolkata, West Bengal', 41312 );
INSERT INTO employee VALUES (38, 'Mithila Laghari', '1986-07-12', 'SD-Infra', 'Kolkata, West Bengal', 58858 );
INSERT INTO employee VALUES (39, 'Aarav Jain', '1988-09-15', 'SD-DB', 'Kolkata, West Bengal', 55837 );
INSERT INTO employee VALUES (40, 'Raj Rao', '1991-12-19', 'SD-DB', 'Mysuru, Karnataka', 75144 );
INSERT INTO employee VALUES (41, 'Aditi Jain', '1984-05-18', 'SD-DB', 'Ranchi, Jharkhand', 48008 );
INSERT INTO employee VALUES (42, 'Mithila Deshpande', '1983-04-17', 'SD-Report', 'Mumbai, Maharashtra', 53266 );


-- We want to select all the data in our table
-- we want to select all the data in our TABLE
SELECT
  *
FROM
  employee;

--- Create the Department TABLE
DROP TABLE IF EXISTS department;
CREATE TABLE department
(
  dept_id VARCHAR(20) PRIMARY KEY
  ,dept_name VARCHAR(50) NOT NULL
);







INSERT INTO department
VALUES
('D1', 'IT')
,('D2', 'HR')
,('D3', 'Finance')
,('D4', 'Admin');


DROP TABLE IF EXISTS manager;
CREATE TABLE manager
(
  manager_id VARCHAR(20) PRIMARY KEY
  ,manager_name VARCHAR(50) NOT NULL
  ,dept_id VARCHAR(20)
);

INSERT INTO manager
VALUES
('M1', 'Prem', 'D3')
,('M2', 'Shripadh', 'D4')
,('M3', 'Nick', 'D1')
,('M4', 'Cory', 'D1');


DROP TABLE IF EXISTS projects;
CREATE TABLE projects
(
  project_id VARCHAR(20) NOT NULL
  ,project_name VARCHAR(100) NOT NULL
  ,team_member_id VARCHAR(20)
);

INSERT INTO projects
VALUES
('P1', 'Data Migration', 'E1')
,('P1', 'Data Migration', 'E2')
,('P1', 'Data Migration', 'M3')
,('P2', 'ETL TOOL', 'E1')
,('P2', 'ETL TOOL', 'M4');

-------------------- INNER JOIN -------------------------------------
---------------------------------------------------------------------
------------------- Get employee and there department information ----

--- These table look like part of a office database
-- Fetch the employee and the department name they belong to
--- This is an example of a
SELECT *
FROM
employee AS e
INNER JOIN
department AS d
ON
e.dept_id = d.dept_id;


--- if we only want the employee emp_name
SELECT
e.emp_name,
e.salary,
d.dept_name
FROM
employee AS e
INNER JOIN
department AS d
ON e.dept_id = d.dept_id;

-- When we connect
-- the column names do have to be same
-- the values in the column must be same, the name of the columns
--may be different
--Fetch the employee name and department name

--- Inner join will fetch the records that are present in both the tables
-- Any record present in both the tables will be

-- LEFT JOIN
SELECT
e.emp_name,
e.salary,
d.dept_name
FROM
employee AS e
LEFT JOIN
department AS d
ON e.dept_id = d.dept_id;

--- RIGHT JOIN
SELECT
e.emp_name,
e.salary,
d.dept_name
FROM
employee AS e
RIGHT JOIN
department AS d
ON e.dept_id = d.dept_id;


--- FULL OUTER join
SELECT *
FROM
(
SELECT
e.emp_name,
e.salary,
d.dept_name
FROM
employee AS e
LEFT JOIN
department AS d
ON e.dept_id = d.dept_id;
) AS query_1
UNION ALL
(
SELECT
e.emp_name,
e.salary,
d.dept_name
FROM
employee AS e
RIGHT JOIN
department AS d
ON e.dept_id = d.dept_id;
) AS query_2


--- fetch data from more than one tables
---Fetch table about employee manager, project and department
SELECT  emp.emp_name AS employee_name
,emp.salary AS salary
,dept.dept_name AS department_name
,m.manager_name AS manager_name
FROM
employee AS emp
LEFT JOIN
department AS dept
ON
emp.dept_id = dept.dept_id
LEFT JOIN
manager AS m
ON m.dept_id = dept.dept_id;

-- TO fecth all the employees coming from the employee table, i will use the
-- left JOIN as I have to fetch
SELECT
emp.emp_name AS empployee_name
,emp.salary AS salary
,dept.dept_name AS department_name
,m.manager_name AS manager_name
--,proj.project_name AS project_name
FROM
employee AS emp
LEFT JOIN
department AS dept
ON emp.dept_id = dept.dept_id
LEFT JOIN
manager AS m
ON m.dept_id = emp.dept_id
LEFT JOIN
projects as proj
ON emp.emp_id = proj.team_member_id;

-- Inner join will fetch records that are present in both the tables
-- You need to fetch all the employees, the employee table is on the left hand side
SELECT
emp.emp_name AS empployee_name
,emp.salary AS salary
,dept.dept_name AS department_name
,m.manager_name AS manager_name
-- ,proj.project_name AS project_name
FROM
employee AS emp
LEFT JOIN
department AS dept
ON emp.dept_id = dept.dept_id
LEFT JOIN
manager AS m
ON m.dept_id = dept.dept_id


-- FULL Outer join
-- FULL OUTER JOIN is the join condition needed to do a FULL outer join
-- In MySQL the FULL OUTER JOIN can be performed by doing a UNION on a LEFT JOIN
--- right JOIN
SELECT
emp.*
,dept.*
FROM
employee AS emp
LEFT JOIN
department AS dept
ON
emp.dept_id = dept.dept_id
UNION ALL
SELECT
emp.*
,dept.*
FROM
employee AS emp
RIGHT JOIN
department AS dept
ON
emp.dept_id = dept.dept_id;


--- LEFT JOIN on employee and manager
--The last two records which are not
SELECT
  e.emp_name
  ,d.dept_name
FROM
  employee AS e
LEFT OUTER JOIN
  department AS d
ON
  e.dept_id = d.dept_id
;

--- FULL Join would internally do a inner join
--- then full join would do a RIGHT OUTER Join

--- SELF JOIN
-- Self join will Join the table with itself
CREATE TABLE family_tree
(
  member_id VARCHAR(20) PRIMARY KEY
  ,name VARCHAR(100) NOT NULL
  ,age INT NOT NULL
  ,parent_id VARCHAR(20)
);

INSERT INTO family_tree
VALUES
('F1', 'David', 4, 'F5')
,('F2', 'Carol', 10, 'F5')
,('F3', 'Micheal', 12, 'F5')
,('F4', 'Johnson', 36, NULL)
,('F5', 'Maryam', 40, 'F6')
,('F6', 'Stewart', 70, NULL)
,('F7', 'Rohan', 6, 'F4')
,('F8', 'Asha', 8, 'F4');


SELECT
*
FROM
family_tree AS ft_left
INNER JOIN
family_tree AS ft_right
ON
ft_left.parent_id = ft_right.member_id;


SELECT
*
FROM
family_tree AS ft_left
LEFT JOIN
family_tree AS ft_right
ON
ft_left.parent_id = ft_right.member_id;



SELECT
*
FROM
family_tree AS ft_left
RIGHT JOIN
family_tree AS ft_right
ON
ft_left.parent_id = ft_right.member_id;

SELECT
*
FROM
family_tree AS ft_left
RIGHT JOIN
family_tree AS ft_right
ON
ft_left.parent_id = ft_right.member_id
UNION ALL
SELECT *
FROM
family_tree AS ft_left
LEFT JOIN
family_tree AS ft_right
ON
ft_left.parent_id = ft_right.member_id ;


--- SUBQUERY IN SQL?
---SUBQUERY in SQL

-- Step 1> create the tables
DROP TABLE IF EXISTS employee;
CREATE TABLE employee
(
    emp_id INT PRIMARY KEY AUTO_INCREMENT
    ,emp_name VARCHAR(50) NOT NULL
    ,dept_name VARCHAR(40) NOT NULL
    ,salary INT
);


INSERT INTO employee
(
  emp_name
  ,dept_name
  ,salary
)VALUES
(
  'Prakash'
  ,'IT'
  ,50000
);

INSERT INTO employee
(
  emp_name
  ,dept_name
  ,salary
)VALUES
(
  'Nithin'
  ,'IT'
  ,40000
);

INSERT INTO employee
(
  emp_name
  ,dept_name
  ,salary
)VALUES
(
  'Sumana'
  ,'IT'
  ,90000
);

INSERT INTO employee
(
  emp_name
  ,dept_name
  ,salary
)VALUES
(
  'Kishor'
  ,'IT'
  ,32000
);

INSERT INTO employee
(
  emp_name
  ,dept_name
  ,salary
)VALUES
(
  'Veena'
  ,'Manugfacturing'
  ,45987
);

INSERT INTO employee
(
  emp_name
  ,dept_name
  ,salary
)VALUES
(
  'Govind'
  ,'Hospitality'
  ,45000
);

INSERT INTO employee
(
  emp_name
  ,dept_name
  ,salary
)VALUES
(
  'Vijaya'
  ,'Manugfacturing'
  ,50000
);


INSERT INTO employee
(
  emp_name
  ,dept_name
  ,salary
)VALUES
(
  'Leena'
  ,'IT'
  ,76000
);

INSERT INTO employee
(
  emp_name
  ,dept_name
  ,salary
)VALUES
(
  'Prakash'
  ,'IT'
  ,34000
);



INSERT INTO employee
(
  emp_name
  ,dept_name
  ,salary
)VALUES
(
  'Mani'
  ,'Manugfacturing'
  ,77000
);


INSERT INTO employee
(
  emp_name
  ,dept_name
  ,salary
)VALUES
(
  'Lina Joseph'
  ,'Hospitality'
  ,76000
);

INSERT INTO employee
(
  emp_name
  ,dept_name
  ,salary
)VALUES
(
  'Prakash'
  ,'Hospitality'
  ,78000
);

-- Find all the employees who earn more than the average salary


SELECT *
FROM
employee
WHERE
salary >
(
SELECT AVG(salary) FROM employee
);

-- The same query can be written as a JOIN condition
SELECT emp.*
FROM
employee AS emp
INNER JOIN
(
SELECT AVG(salary) AS avg_salary FROM employee
) AS average_salary
ON emp.salary > average_salary.avg_salary;


--- Multiple row SUBQUERY

--- subquery which returns multiple rows and multiple rows

--- subquery return one column and multiple rows


--- Employee who earn highest salary in each department

--- step 1> highest salary in each department


--- solve the above query using the join condition
--- Solve the problem using multiple row and multiple column
SELECT emp.*
FROM
employee AS emp
JOIN
(
SELECT dept_name, MAX(salary) AS max_salary FROM employee
GROUP BY dept_name
) AS max_salary_dept
ON
emp.dept_name = max_salary_dept.dept_name
AND
emp.salary = max_salary_dept.max_salary;

--- the subquery has no dependency on the outer query_1


--- SQL will execute this SUBQUERY
--- for every record for outer query the filter condition is matched


--- lETS look at single row


DROP TABLE IF EXISTS department;
CREATE TABLE department
(
    dept_id INT UNIQUE NOT NULL
    ,dept_name VARCHAR(50) PRIMARY KEY
    ,location VARCHAR(50)
);


INSERT INTO department
VALUES
(1, 'Admin', 'Bangalore')
,(2, 'HR', 'Bangalore')
,(3, 'IT', 'Bangalore')
,(4, 'Finance', 'Mumbai')
,(5, 'Marketing', 'Bangalore')
,(6, 'Sales', 'Mumbai');

INSERT INTO department
VALUES
(7, 'Manugfacturing', 'Jamshedpur'),
(8, 'Hospitality', 'Delhi');



-- Which department's that does not have no employees
SELECT * FROM department
WHERE --- ELIMATE Departments where not
dept_name
NOT IN
(
  SELECT DISTINCT  dept_name FROM employee
);

-- CORELATED SUBQUERY in SQL
-- It is a subquery that are returned from the outer query
-- it is a subquery that are dependent in the outer query

-- example in a department who earn more than the average salary of the department
-- Can easy do using the scalar SUBQUERY
-- greater than the average salary of that department

-- Co-related subquery
SELECT  AVG(salary)
FROM
employee
WHERE
dept_name =

--- corelaed subquery
SELECT * FROM
employee AS outer_emp
WHERE
salary >
(
  SELECT avg(salary) FROM employee AS inner_emp
  WHERE outer_emp.dept_name = inner_emp.dept_name
);


SELECT * FROM employee AS emp1
WHERE
salary >
        (
          SELECT AVG(salary) FROM employee AS emp2
          WHERE
          emp1.dept_name = emp2.dept_name
        );


--- Co-related SUBQUERY
-- Department that do not have any employees
SELECT * FROM department AS outer_dept
WHERE
0 =
(
  SELECT COUNT(*)
  FROM employee
  WHERE employee.dept_name = outer_dept.dept_name
);;


SELECT
*
FROM
department AS outer_dept
WHERE
0 =
(
SELECT COUNT(*)
FROM
employee
WHERE employee.dept_name = outer_dept.dept_name
);

SELECT
*
FROM
department AS outer_dept
WHERE
0 <
(
  SELECT COUNT(*) FROM employee WHERE dept_name = outer_dept.dept_name
);

-- https://www.youtube.com/watch?v=AFY3z4FwRg0



# WINDOWS FUNCTION
# RANK
# DENSE_RANK
#

-- in this table if I want to find the MAX salary
SELECT MAX(salary) FROM employee;
--- MAX salary of employee in each department
SELECT dept_name, MAX(salary)
FROM
employee
GROUP BY dept_name;
-- but here we do not see employee details


SELECT *
,MAX(salary) OVER() as max_salary
FROM
employee AS emp;

SELECT MAX(salary) OVER() -- TREAT like a window FUNCTION
-- create a window of records
-- create one window for all the records
-- for one window of the 24 records SQL will



-- max salary by department
SELECT *
,MAX(salary) OVER( PARTITION BY dept_name) AS max_salary_dept
FROM
employee;

--- Window FUNCTION
--- treats all the rows in one window
 SELECT *, ROW_NUMBER() OVER() AS row_n FROM employee;


 SELECT *,
 ROW_NUMBER() OVER(PARTITION BY dept_name) AS row_n
 FROM employee;

 --- ROW NUMBER ORDER
 SELECT *,
 ROW_NUMBER() OVER(PARTITION BY dept_name ORDER BY salary DESC)
 AS row_n
 FROM employee;

 -- RANK
 SELECT *,
 RANK() OVER( PARTITION BY dept_name ORDER BY salary DESC) AS rank_val
 FROM
 employee;

-- find highest avg_salary
WITH emp_rank AS
(
SELECT *,
RANK() OVER( PARTITION BY dept_name ORDER BY salary DESC) AS rank_val
FROM
employee
)

SELECT * FROM emp_rank WHERE rank_val = 1;


--- What is LAG and LEAD
--- Check if the current emp is greater than previous emp

SELECT *,
LAG(salary) OBER(PARTITION BY dept_name ORDER BY emp_id)


--- Aggregate functions
# SUM, MAX , MIN, COUNT, avg
---- SELECT SUM(salary) FROM employee

--- Calculate the aggreagte for different groups of data

--- AVG salary for each department_name
--- filter using the AGGREGATE calculations
SELECT dept_name , AVG(salary) AS avg_sal
from
employee
WHERE
emp_name LIKE 'A%'
GROUP BY dept_name
HAVING AVG(salary) > 44000
ORDER BY
  avg_sal DESC;

--- group by multiple columns_name
---subquery

--- PRIMARY KEYS
--- PRIMARY KEY CAN BE APPLIED TO A COLUMN
--- A PRIMARY KEYS


DROP TABLE IF EXISTS transaction_info;
CREATE TABLE transaction_info
(
  transaction_id INT
  ,item VARCHAR(100)
  ,quantity INT
  ,transaction_date DATE
);


ALTER TABLE transaction_info
ADD PRIMARY KEY(transaction_id);


--- Test the condition of one primary key to a tables
INSERT INTO transaction_info
VALUES
(1000, 'Lenovo Laptop', 20, '2023-10-23')
,(1001, 'Asus Laptop', 25, '2020-01-01')
,(1002, 'Logitech BlueTooth Mouse', 40, '2023-02-17')
,(1003, 'LG 34 Inch Flat Screen Monitor', 10, '2023-04-18');


--- Primary key is used as an UNIQUE identifier for each row
--- Primary column cannot be NULL
--- PRIMARY KEY COLUMN MUST BE UNIQUE
--- There can be one primary key per tables
---if you try to add multiple primary key in a table we will get ERROR
--- Multiple primary key defined



CREATE TABLE transaction_info_again
(

    transaction_id INT ,
    customer_id INT,
    quantity DECIMAL(10,2),
    price DECIMAL(20, 2),
    transaction_date DATE
);


ALTER TABLE transaction_info_again
ADD PRIMARY KEY (transaction_id
                , customer_id);

DROP TABLE IF EXISTS races;
CREATE TABLE races
(
    races_id TINYINT  AUTO_INCREMENT PRIMARY KEY AUTO_INCREMENT(1,1)
    ,race_name VARCHAR(30) NOT NULL
);

CREATE TABLE characters
(
    charcter_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,character_name  VARCHAR(50) NOT NULL
    ,race_id TINYINT UNSIGNED NOT NULL
    ,FOREIGN KEY(race_id) REFERENCES races(races_id)
);



CREATE TABLE friends_info
(
  friend_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  , phone_number CHAR(10) NOT NULL UNIQUE
  , email VARCHAR(40) NOT NULL UNIQUE
);




INSERT INTO friends_info
(
    phone_number
    ,email
)
VALUES
(
      '9898989898'
    , 'dummy121@email.com'
  );


--- Let's say we have two tables  USERS and SCORES
DROP TABLE IF EXISTS user_info;
CREATE TABLE  user_info
  (
      user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
      ,user_name VARCHAR(60) NOT NULL
      ,psswrd VARCHAR(60) NOT NULL
  );


CREATE TABLE scores_info
(
    user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
    ,game_1_score INT DEFAULT 0
    ,game_2_score INT DEFAULT 0
    ,FOREIGN KEY(user_id) REFERENCES user_info(user_id)
);




def test_write_dq_expectation_suite_results(tmpdir):
    location = f"file://{tmpdir}/test_write_dq_expectation_suite_results0"
    error_location = f"file://{tmpdir}/test_write_dq_expectation_suite_errors"
    database_name = "slv_testdb1"
    adf_pipeline_run_id = "mock_pipeline_id"

    # ARRANGE
    spark.createDataFrame(
        [
            {"id": 1, "username": "user1", "city_id": 1},
            {"id": 2, "username": "user2", "city_id": 2},
            {"id": 3, "username": "user3", "city_id": None},
            {"id": 3, "username": "user4", "city_id": None},
        ]
    ).createOrReplaceTempView("slv_users")

    spark.createDataFrame(
        [
            {"id": 1, "name": "London"},
            {"id": 2, "name": "Rome"},
        ]
    ).createOrReplaceTempView("slv_cities")

    # ACT
    expectation_suite = ConfigLoader.load(
        file_path=f"{support_files_root_path}/yml_scenario3/meta.yml",
        file_reader=LocalFileSystemReader(),
        expectation_store=BrewDatExpectationStore,
        adf_pipeline_run_id=adf_pipeline_run_id,
        error_table_location=error_location,
    )

    write_dq_expectation_suite_results(
        location,
        expectation_suite,
        zone="ghq",
        business_domain="finance",
        data_product="sap",
        database_name=database_name,
        dlz_name="platform",
        fail_quietly=False,
        adf_pipeline_run_id=adf_pipeline_run_id,
    )
    df = spark.table(f"{database_name}.{DQ_WIDE_CHECK_TABLE}")
    columns_name = df.schema.names
    assert df is not None
    assert len(set(columns_name) - {*result_schema.fieldNames(), *additional_fields}) == 0
    assert len({*result_schema.fieldNames(), *additional_fields} - set(columns_name)) == 0
