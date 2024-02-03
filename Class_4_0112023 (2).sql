USE sql_20231030;

EXEC sp_help customers;



EXEC sp_help invoice


SELECT * FROM invoice;


SELECT * FROM customers
WHERE customer_id = 1001

SELECT * FROM customers;


INSERT INTO customers
VALUES
(
1002,
'Sridhar',
'9393939393',
'sridhar.abc@gmail.com',
'Hebbal Bangaluru'
);


INSERT INTO customers
VALUES
(
1003,
'Harini',
'5656565656',
'harinmi@gmail.com',
'Kengere'
);



INSERT INTO customers
VALUES
(
1004,
'Ranganathan',
'7878787669',
'ranga@gmail.com',
'Bhanshankari'
);



INSERT INTO customers
VALUES
(
1005,
'Utsav',
'1023456789',
'utsav@gmail.com',
'Varhur'
);




INSERT into customers VALUES(7001,'Ms dhoni', '9876543210', 'Msdhoni@gmail.com', 'Ranchi')INSERT INTO customers VALUES(5001,'Rahul Pal', 9007891234,'rahul.p@gmail.com','Bellandur Bangalore');INSERT INTO customers VALUES(5001,'Sakshi Dhar', 7007891234,'sakshi.m@gmail.com','kondapur Hyderabad');INSERT INTO customers VALUES(5001,'Malti Roy', 8907891234,'malti.m12@gmail.com','Gachiwali Hyderabad');INSERT INTO customersVALUES(1256,'NK','8989898989','NK@gmail.com','Coimbatore');INSERT INTO customers(customer_id,customer_name,customer_phone,customer_email,Customer_address)VALUES('1709','Divya','7204113558','div@gmail.com','Rajajinagar')-- I have populated the customers tableSELECT * FROM customers;SELECT * FROM invoice;INSERT INTO INVOICEVALUES(122,1005,7387);INSERT INTO INVOICEVALUES(133,1001,722);INSERT INTO INVOICEVALUES(135,1002,4331);SELECT * FROM invoice;SELECT * FROM customers;SELECT invoice.*,-- get me all the columns from the invoice tablecustomers.* -- get me all the columns from the customer tableFROMcustomersINNER JOINinvoiceONcustomers.customer_id = invoice.customer_id;--- Left JoinSELECT customers.*,invoice.*FROMcustomers  LEFT JOIN   invoiceONcustomers.customer_id = invoice.customer_id--- RIGHT JOINSELECT customers.*,invoice.*FROMinvoice  RIGHT JOIN   customersONcustomers.customer_id = invoice.customer_idCREATE TABLE invoice_dummy(invoice_id INT PRIMARY KEY,customer_id INT NOT NULL,price INT NOT NULL);INSERT INTO invoice_dummyVALUES(122,1005,7387);INSERT INTO invoice_dummyVALUES(133,1001,722);INSERT INTO invoice_dummyVALUES(135,1002,4331);INSERT INTO invoice_dummyVALUES(145,9638,3333);INSERT INTO invoice_dummyVALUES(146,8888,100);INSERT INTO invoice_dummyVALUES(147,1313,999);SELECT customers.*, invoice_dummy.*FROMcustomersINNER JOINinvoice_dummyON customers.customer_id = invoice_dummy.customer_id--- LEFT JOIN (I will keep the customers table as the left table)SELECT customers.*, invoice_dummy.*FROMcustomersLEFT JOINinvoice_dummyON customers.customer_id = invoice_dummy.customer_id-- RIGHT JOIN( I will keep the invoice_dummy table as the right table)SELECT customers.*, invoice_dummy.*FROMcustomers RIGHT JOIN invoice_dummyON customers.customer_id = invoice_dummy.customer_id--- OUTER JOINSELECT customers.*, invoice_dummy.*FROMcustomersFULL OUTER JOINinvoice_dummyONcustomers.customer_id = invoice_dummy.customer_id--- CROSS JOINSELECT customers.*, invoice_dummy.*FROMcustomersCROSS JOINinvoice_dummy----
-- create table EMPLOYEE
CREATE TABLE employee
(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(60) NOT NULL,
dept_name VARCHAR(60),
salary INT
);

INSERT INTO employee
VALUES
(1, 'Kamala', 'HR', 30000),
(2, 'Adithya', 'Software Development', 45000),
(3, 'Mudith', 'Infrastructure', 55000),
(4, 'Vinodh', 'HR', 55000),
(5, 'Kamya', 'Software Development', 85000),

(6, 'Lohith', 'HR', 80000),
(7, 'Venu', 'Software Development', 85000),
(8, 'Chandini', 'Infrastructure', 45000),
(9, 'Lopesh', 'HR', 95000),
(10, 'Vaibhav', 'Software Development', 65000),
(11, 'Anjani', 'HR', 70000),
(12, 'Sen', 'Software Development', 95000),
(13, 'Tulidith', 'Infrastructure', 95000),
(14, 'Kannan', 'HR', 105000),
(15, 'KamyaShree', 'Software Development', 105000),

(16, 'LohithSajen Singh', 'HR', 90000),
(17, 'Venu Vasudhev Nandan', 'Software Development', 185000),
(18, 'Chandini Kumari Shree', 'Infrastructure', 145000),
(19, 'Alok', 'HR', 85000),
(20, 'Vibhor Kumaran', 'Software Development', 83000)

-- ORDER RECORDS IN A DATABASE TABLE
SELECT * FROM employee
ORDER BY salary ASC

SELECT * FROM employee
ORDER BY 
salary DESC, emp_name ASC


CREATE TABLE department_info
(
dept_id INT NOT NULL PRIMARY KEY,
dept_name VARCHAR(60) NOT NULL UNIQUE,
dept_head VARCHAR(60),
dept_location VARCHAR(100)
);



INSERT INTO department_info
VALUES
(1, 'HR', 'Asutosh Kumar', 'Lucknow'),
(2, 'Infrastructure', 'Deepika J', 'Chennai'),
(3,  'Software Development', 'Vinod Bansal', 'Bangalore'),
(4,  'Communications and Networks', 'Kanika N.M.', 'Mumbai'),
(5, 'Security',  'Rani Malini', 'Cochin')



SELECT * FROM employee
SELECT * FROM department_info



SELECT *FROMemployee AS emp  -- created an alias for the employee table and I have called the alias as empINNER JOINdepartment_info AS dep  -- alias for department_info is depON emp.dept_name = dep.dept_name
WHERE
dep.dept_location = 'Lucknow'




SELECT *
FROM
department_info
WHERE dept_location = 'Lucknow'


--- use the above query as a table in my join condition

--- I am treating this entire query as a first table
SELECT * FROM
(
SELECT *
FROM
department_info
WHERE dept_location = 'Lucknow'
) AS dep    INNER JOIN   employee  -- The employee table is my second table
ON dep.dept_name = employee.dept_name


-- The output of a query can be used as a Table
SELECT  
dept_name
,dept_head
,dept_location
FROM
department_info

---- subquery
SELECT d.*
FROM
(
SELECT  
dept_name
,dept_head
,dept_location
FROM
department_info
) AS d
WHERE
d.dept_location = 'Bangalore'
OR
d.dept_location = 'Mumbai';


--- if I want to see only those employees who are from Bangalore or Mumbai

--- join method
SELECT *
FROM
employee AS e
INNER JOIN
department_info AS d
ON e.dept_name = d.dept_name
WHERE
d.dept_location = 'Bangalore'
OR
d.dept_location = 'Chennai'
ORDER BY d.dept_location

-- use one of the table in the join as an output from a original table
SELECT 
e.*, 
d.*
FROM
(
SELECT * FROM department_info WHERE
dept_location = 'Chennai' OR dept_location = 'Bangalore'
) AS d  -- d is the nick name(alias) for the above query and we will use the above query as a table
INNER JOIN
employee AS e
ON
d.dept_name = e.dept_name
ORDER BY d.dept_location, e.salary DESC  -- Order happens at the very end



CREATE TABLE location_info
(
location VARCHAR(50) PRIMARY KEY,
avg_temp DEC(5, 2) NOT NULL,
avg_hum  DEC(5, 2) , --- 34.44
state_name VARCHAR(50)  NOT NULL
)


INSERT INTO location_info
VALUES
('Lucknow', 30, 20, 'UP'),
('Chennai', 37.5, 60, 'TN'),
('Bangalore', 23.5, 10, 'KA'),
('Mumbai', 37.5, 60, 'MH'),
('Cochin', 37.5, 80, 'KL')
SELECT 
*
FROM
employee AS e
INNER JOIN
department_info AS d
ON e.dept_name = d.dept_name
INNER JOIN
location_info AS l
ON
l.location = d.dept_location

-- WHERE Clause to see only those employees who are from Bangalore and Lucknow
SELECT 
*
FROM
employee AS e
INNER JOIN
department_info AS d
ON e.dept_name = d.dept_name
INNER JOIN
location_info AS l
ON
l.location = d.dept_location
WHERE
l.location = 'Lucknow' OR l.location = 'Bangalore'
ORDER BY l.location , e.salary DESC --- Order by happens at the very end of the query execution