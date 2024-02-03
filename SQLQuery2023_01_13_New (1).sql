USE personal_info;

DROP TABLE Orders

CREATE TABLE [dbo].[Orders]
(
	order_id INT,
	order_date DATE,
	customer_name VARCHAR(250),
	city VARCHAR(100),	
	order_amount MONEY
)
 
INSERT INTO [dbo].[Orders]
SELECT '1001','04/01/2017','David Smith','GuildFord',10000
UNION ALL	  
SELECT '1002','04/02/2017','David Jones','Arlington',20000
UNION ALL	  
SELECT '1003','04/03/2017','John Smith','Shalford',5000
UNION ALL	  
SELECT '1004','04/04/2017','Michael Smith','GuildFord',15000
UNION ALL	  
SELECT '1005','04/05/2017','David Williams','Shalford',7000
UNION ALL	  
SELECT '1006','04/06/2017','Paum Smith','GuildFord',25000
UNION ALL	 
SELECT '1007','04/10/2017','Andrew Smith','Arlington',15000
UNION ALL	  
SELECT '1008','04/11/2017','David Brown','Arlington',2000
UNION ALL	  
SELECT '1009','04/20/2017','Robert Smith','Shalford',1000
UNION ALL	  
SELECT '1010','04/25/2017','Peter Smith','GuildFord',500


SELECT
	order_id
	,order_date
	,customer_name
	,city
	,order_amount
FROM
	Orders


--- We all know the SUM() aggregate function.
--- It does the sum of specified field for specified group (like city, state, country etc.)
--- or for the entire table if group is not specified.
--- We will see what will be the output of regular SUM() aggregate function and window SUM() aggregate function.
 

SELECT
	Orders.order_id
	, Orders.order_date
	, Orders.customer_name
	, Orders.city
	, Orders.order_amount
	,tb1.total_sales
	, Orders.order_amount / tb1.total_sales * 100 AS percent_sale_city
FROM
(
 SELECT  --- This is an inner query
	city
	,SUM(order_amount) AS total_sales
FROM
	Orders
GROUP BY city
) AS tb1

INNER JOIN

	Orders

ON
	Orders.city = tb1.city

---- Akash

SELECT order_id,order_amount,total_sales,order_amount/total_sales*100
FROM
(SELECT
	Orders.*
	,tb1.total_sales
FROM
(
 SELECT  --- This is an inner query
	city
	,SUM(order_amount) AS total_sales
FROM
	Orders
GROUP BY city
) AS tb1

INNER JOIN

	Orders

ON
	Orders.city = tb1.city) as tb2


SELECT city, SUM(order_amount) total_order_amount
FROM [dbo].[Orders] GROUP BY city


--- Example of a Common Table Expression
WITH  temp_tab_1
AS
(
SELECT  --- this is the outer query
	Orders.order_id
	, Orders.order_date
	, Orders.customer_name
	, Orders.city
	, Orders.order_amount
	,tb1.total_sales
FROM
(
 SELECT  --- This is an inner query
	city
	,SUM(order_amount) AS total_sales
FROM
	Orders
GROUP BY city
) AS tb1
INNER JOIN
	Orders
ON
	Orders.city = tb1.city
)
 
 SELECT order_id,
	order_date,
	customer_name
	,city
	,order_amount
	,total_sales
	,order_amount / total_sales * 100 AS percent_sales_city
FROM
	temp_tab_1
 WHERE
 city = 'Arlington'

 SELECT * FROM temp_tab_1
 WHERE
 city != 'Arlington'






SELECT order_id, order_date, customer_name, city, order_amount
 ,SUM(order_amount) OVER(PARTITION BY city) as grand_total 
FROM [dbo].[Orders]
 

WITH temp_tab_1
AS
(
 SELECT
	order_id
	,order_date
	,customer_name
	,city
	,order_amount
	,SUM(order_amount) OVER(PARTITION BY CITY) as grand_total
FROM
	orders
)

SELECT
	order_id,
	order_date,
	customer_name,
	city,
	order_amount,
	grand_total,
	order_amount / grand_total  * 100 AS percent_sale_city
FROM
	temp_tab_1   -- this is where the temp_tab_1 is a valid table. after this point the table created from a CTE ceases to exists


WITH
	temp_tab_1
AS
(
SELECT order_id, order_date, customer_name, city, order_amount
 ,AVG(order_amount) OVER(PARTITION BY city, MONTH(order_date)) as   average_order_amount 
FROM [dbo].[Orders]
)

SELECT
	*
	, CASE
		WHEN order_amount > average_order_amount THEN 'Order is greater than average order'
		WHEN order_amount = average_order_amount THEN 'Order amount is equal to average order amount'
		WHEN order_amount < average_order_amount THEN 'Order is lower than average order'
	END AS order_compared_to_average
FROM
	temp_tab_1 ;



SELECT order_id, order_date, customer_name, city, order_amount
 ,MIN(order_amount) OVER(PARTITION BY city) as minimum_order_amount 
FROM [dbo].[Orders]



SELECT order_id, order_date, customer_name, city, order_amount
 ,MAX(order_amount) OVER(PARTITION BY city) as maximum_order_amount 
FROM [dbo].[Orders]


-- How much bigger is the maximum_order_amount to order_amount to each record as % to the order_amount of each record
--- Akash
WITH temp_tab_1
AS
(
SELECT order_id, order_date, customer_name, city, order_amount
 ,MAX(order_amount) OVER(PARTITION BY city) as maximum_order_amount 
FROM [dbo].[Orders]
)

SELECT *,(maximum_order_amount-order_amount)/order_amount *100
FROM
   temp_tab_1

--- Sarvesh
WITH temp_tab_1
AS
(
SELECT order_id, order_date, customer_name, city, order_amount
 ,MAX(order_amount) OVER(PARTITION BY city) as maximum_order_amount 
FROM [dbo].[Orders]
)

SELECT 
	*,
	(maximum_order_amount -  order_amount)/ order_amount *100 as [salary_diff_percent]
FROM 
	temp_tab_1


---- Abhishek
WITH temp_tab_1
AS
(
SELECT order_id, order_date, customer_name, city, order_amount,
 MAX(order_amount) OVER (PARTITION BY city) as maximum_order_amount 
FROM Orders
)



SELECT *,
(maximum_order_amount-order_amount)/order_amount *100
FROM
   temp_tab_1




SELECT city,COUNT(DISTINCT customer_name) number_of_customers
FROM [dbo].[Orders] 
GROUP BY city


SELECT order_id, order_date, customer_name, city, order_amount
 ,COUNT(DISTINCT customer_name) OVER(PARTITION BY city) as number_of_customers
FROM [dbo].[Orders] 


SELECT order_id, order_date, customer_name, city, order_amount
 ,COUNT(order_id) OVER(PARTITION BY city) as total_orders
FROM [dbo].[Orders]
 

-- Rank()

WITH
	temp_tab_1
AS
(
SELECT order_id,order_date,customer_name,city, order_amount,
RANK() OVER(ORDER BY order_amount DESC) [Rank]
FROM [dbo].[Orders]
)

SELECT
	*
FROM
	temp_tab_1
WHERE
	[Rank] = 
(SELECT MAX([Rank]) FROM temp_tab_1)


---- WITH FIRST_CTE_1
----AS


--- RAM  JAMSHEDPUR  19-10-1991 1    1 RANK() OVER(ORDER BY name, place, dob) DND
--- RAM  JAMSHEDPUR  19-10-1991 1    2
--- SHYAM  DEHRADUN  21-10-1990 2     3      DND
--- SHYAM  DEHRADUN  21-10-1990 2     4
--- SHYAM  DEHRADUN  21-10-1990 2    5
--- GITA   HYDERABAD 11-06-1990 3     6     DND
--- GITA   HYDERABAD 11-06-1990 3     7


----- SECOND_CTE_2
--AS
---
---  SELECT MIN(RW_NUM) FROM TEMP_TAB_1 GROUP BY  NAME, PLACE, DOB, DENSE_RNK 

----   1
-----    3 
------    6

---- DELETE THE FIRST COMMON TABLE EXPRESSION
----- FROM USING THE OUTPUT OF THE SECOND COMMON TABLE EXPRESSION
---- DELETE EVERYTHING EXCEPT 1, 3, 6


----- DELETE FROM CTE_TAB_1 WHERE row_num_val NOT IN ( SELECT * FROM CTE_TAB_2)


--- DENSE_RANK()

SELECT order_id,order_date,customer_name,city, order_amount,
DENSE_RANK() OVER(ORDER BY order_amount DESC) [Rank]
FROM [dbo].[Orders]
 
WITH
	temp_tab_1
AS
	(
 SELECT order_id,order_date,customer_name,city, order_amount,
DENSE_RANK() OVER( ORDER BY order_amount DESC) AS [dense rank],
ROW_NUMBER() OVER(ORDER BY order_amount DESC) [row_number]
FROM [dbo].[Orders]
)


SELECT  -- outer query which uses A CTE
	*
FROM
	temp_tab_1
WHERE
	order_amount = 
	(
		SELECT   -- Using this subquery
			order_amount	
		FROM
			temp_tab_1
		WHERE
			[row_number] = 4
	)
USE personal_info;

SELECT order_id,order_date,customer_name,city, order_amount,
ROW_NUMBER() OVER(PARTITION BY city ORDER BY order_amount DESC) [row_number]
FROM [dbo].[Orders]

--- get the second highest order for every city
WITH temp_tab_1
AS
(
SELECT order_id,order_date,customer_name,city, order_amount,
ROW_NUMBER() OVER(PARTITION BY city ORDER BY order_amount DESC) [row_number]
FROM [dbo].[Orders]
)

SELECT 
	*
FROM 
	temp_tab_1
WHERE
	row_number = 2
 
SELECT order_id,order_date,customer_name,city, order_amount,
NTILE(4) OVER(ORDER BY order_amount) [row_number]
FROM [dbo].[Orders]


---- 500 , 1000, 2000, 5000, 7000, 10000, 15000, 15000,                    20000, 25000
----                                         15000/25000 *100                   20000/25000 

SELECT 20000/25000.00


SELECT order_id,customer_name,city, order_amount,order_date,
 --in below line, 1 indicates check for previous row of the current row
 LAG(order_amount, 1) OVER(PARTITION BY city ORDER BY order_date) prev_order_amount
FROM [dbo].[Orders]



SELECT order_id,customer_name,city, order_amount,order_date,
 --in below line, 1 indicates check for next row of the current row
 LEAD(order_date,1) OVER(ORDER BY order_date) next_order_date,
 LEAD(order_amount,1) OVER(ORDER BY order_date)  AS  next_order_amount
FROM [dbo].[Orders]


SELECT order_id,order_date,customer_name,city, order_amount,
FIRST_VALUE(order_date) OVER(PARTITION BY city ORDER BY city) first_order_date,
LAST_VALUE(order_date) OVER(PARTITION BY city ORDER BY city) last_order_date
FROM [dbo].[Orders]

--- Subquery
DROP DATABASE IF EXISTS travel;
 
CREATE DATABASE travel;
USE travel;
USE travel;


CREATE TABLE manufacturers 
(  manufacturer_id INT  NOT NULL IDENTITY(1, 1) PRIMARY KEY,
  manufacturer NVARCHAR(50) NOT NULL,
  create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP  zXSWXZ)


CREATE TABLE airplanes (
  plane_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  plane VARCHAR(50) NOT NULL,
  manufacturer_id INT UNSIGNED NOT NULL,
  engine_type VARCHAR(50) NOT NULL,
  engine_count TINYINT NOT NULL,
  max_weight MEDIUMINT UNSIGNED NOT NULL,
  wingspan DECIMAL(5,2) NOT NULL,
  plane_length DECIMAL(5,2) NOT NULL,
  parking_area INT GENERATED ALWAYS AS ((wingspan * plane_length)) STORED,
  icao_code CHAR(4) NOT NULL,
  create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_update TIMESTAMP NOT NULL 
    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (plane_id),
  CONSTRAINT fk_manufacturer_id FOREIGN KEY (manufacturer_id) 
    REFERENCES manufacturers (manufacturer_id) ) 
ENGINE=InnoDB AUTO_INCREMENT=101;






USE AdventureWorksDW2017


--- A view is a virtual table made up of rows and columns. 
--- The data can be from a single table or it can come from many tables. 
--- You query a view just like you would a normal table. 
--- A view is created with the CREATE VIEW statement and is stored within the database in which it is created.
CREATE VIEW v_EmployeeRecordsMale
AS
SELECT
		EmployeeNationalIDAlternateKey
		,FirstName + ' ' + MiddleName + ' ' + LastName AS Employee_Name
		,Title AS [JobTitle]
		,HireDate
		,BirthDate
		,EmailAddress
		,MaritalStatus
		,Gender
FROM
		[dbo].[DimEmployee]
WHERE
		[dbo].[DimEmployee].MaritalStatus = 'M' ;


SELECT
	DISTINCT MaritalStatus
FROM
	v_EmployeeRecordsMale;

SELECT
	*
FROM
	EmployeeRecordsMale

-- There are times when you want to evolve your Database design over time, but you don't want to break existing code
-- A view can handle meeting this business requirement. To demonstrate this,


USE AdventureWorksDW2017
CREATE TABLE DateDimOld (
ID INT IDENTITY, 
DT DATE, 
DOWTitle varchar(10));
GO
-- Populate DateDimOld
INSERT INTO DateDimOld(DT, DOWTitle) VALUES 
  ('12/1/2013',DATENAME(DW,'12/1/2013')),
  ('12/2/2013',DATENAME(DW,'12/2/2013')),
  ('12/3/2013',DATENAME(DW,'12/3/2013'));

SELECT * FROM DateDimOld;


CREATE TABLE DOWTitle (
DowTitleID INT IDENTITY PRIMARY KEY, 
DOWTitle VARCHAR(10));


CREATE TABLE DateDimNew (
ID INT IDENTITY, 
DT DATE, 
DOWTitleID INT);


ALTER TABLE DateDimNew  WITH CHECK ADD  CONSTRAINT [FK_DateDimNew_DOWTitle_DOWTitleID] FOREIGN KEY(DOWTitleID)
REFERENCES DOWTitle (DOWTitleID)


INSERT INTO DOWTitle (DOWTitle) VALUES 
  (DATENAME(DW,'12/1/2013')),
  (DATENAME(DW,'12/2/2013')),
  (DATENAME(DW,'12/3/2013'));

INSERT INTO DateDimNew (DT,DOWTitleID) VALUES
  ('12/1/2013', 1),
  ('12/2/2013', 2),
  ('12/3/2013', 3);


DROP TABLE DateDimOld

-- Create view to similate Old Schema
CREATE VIEW DateDimOld AS
SELECT DDN.ID, DDN.DT, DOWT.DOWTitle 
FROM DateDimNew AS DDN
JOIN DOWTitle AS DOWT
ON DDN.DOWTitleID = DOWT.DowTitleID;
GO
-- Show how VIEW and Simulate Old Schema
SELECT * FROM DateDimOld
-- End New Schema

SELECT * FROM DateDimOld

INSERT INTO DateDimOld (DOWTitle) 
VALUES (DATENAME(DW,'12/4/2013'));

SELECT (DATENAME(DW,'12/4/2013'));

DELETE  FROM DOWTitle WHERE DowTitleID = 5 ;
SELECT
	*
FROM
	DOWTitle
FROM
	DOWTitle


INSERT INTO DateDimNew (DT, DOWTitleID) 
   SELECT '12/4/2013', DOWTitleID FROM DOWTitle 
       WHERE DOWTitle = DATENAME(DW,'12/4/2013')


ALTER VIEW DateDimOld WITH SCHEMABINDING AS 
SELECT DDN.ID, DDN.DT, DOWT.DOWTitle 
FROM dbo.DateDimNew AS DDN
JOIN dbo.DOWTitle AS DOWT
ON DDN.DOWTitleID = DOWT.DowTitleID;
GO


ALTER VIEW DateDimOld WITH SCHEMABINDING AS 
SELECT DDN.ID, DDN.DT, DOWT.DOWTitle 
FROM dbo.DateDimNew AS DDN
JOIN dbo.DOWTitle AS DOWT
ON DDN.DOWTitleID = DOWT.DowTitleID;
GO


ALTER TABLE dbo.DateDimNew 
  ALTER COLUMN DT INT;

--- Another option available with creating a view is the WITH CHECK OPTION.
--- The WITH CHECK option allows you to put constraints on your view to make sure any update made to the underlying 
--- tables are selectable using a view. 

CREATE TABLE DayOfTheWeek(DayOfTheWeek varchar (10), 
              DayOfTheWeekNum int);
INSERT INTO  DayOfTheWeek VALUES
    ('Monday',0),
    ('Tuesday',1),
    ('Wednesday',2),
    ('Thursday',3),
    ('Friday',4);

CREATE VIEW DisplayDayOfTheWeek 
AS 
SELECT DayOfTheWeek, DayOfTheWeekNum FROM DayOfTheWeek
WHERE DayOfTheWeekNum < 5
WITH CHECK OPTION;
--- To show you how the WITH CHECK OPTION is used review the code above


--- By adding the WITH CHECK OPTION, SQL Server will not allow me to INSERT or 
--- UPDATE a row using the DisplayDayOfTheWeek view unless the DayOfTheWeekNum value is less than 5.
INSERT INTO  DisplayDayOfTheWeek VALUES
    ('Saturday',5);

UPDATE DisplayDayOfTheWeek
SET DayOfTheWeekNum = 5
WHERE DayOfTheWeek = 'Friday';


--- We are able to insert records directly into the table
INSERT INTO DayOfTheWeek   --- Inserting directly into the table
	(
				DayOfTheWeek,
				DayOfTheWeekNum
	) VALUES
	(
				'Saturday',
				5
	);

)