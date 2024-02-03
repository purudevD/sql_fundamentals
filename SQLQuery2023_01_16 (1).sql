USE [Movies]
GO


USE [Movies]
GO

/****** Object:  StoredProcedure [dbo].[myStoredProc]    Script Date: 16-01-2023 20:28:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON


GO  --- This GO tell's SQL SERVER to start a new Batch

CREATE PROC [dbo].[myStoredProc]
AS
BEGIN
SELECT 
	CountryName
	,SUM(FilmRunTimeMinutes) AS [TotalRunTime]
	,AVG(CAST(FilmRunTimeMinutes AS DECIMAL)) AS [AvgRunTime]
FROM
	tblCountry AS c
INNER JOIN
	tblFilm AS f
ON
	c.CountryID = f.FilmCountryID
GROUP BY
	CountryName
ORDER BY
	CountryName ASC
END   --- end of the previously created batch


--- 3 places before the decimal and 4 places after the decimal
--- so decide on the datatype accordingly
GO    --- start of a new batch


USE Movies;


--- What is a Stored Procedure?

--- Stored Procedure is like a methods

GO  --- SQL SERVER creates a new Batch
CREATE PROC myStoredProcAgain
AS
BEGIN
SELECT 
	CountryName
	,SUM(FilmRunTimeMinutes) AS [TotalRunTime]
	,AVG(CAST(FilmRunTimeMinutes AS DECIMAL)) AS [AvgRunTime]
FROM
	tblCountry AS c
INNER JOIN
	tblFilm AS f
ON
	c.CountryID = f.FilmCountryID
GROUP BY
	CountryName
ORDER BY
	CountryName ASC
END



GO  --- SQL SERVER creates a new Batch
ALTER PROC myStoredProcAgain(@countryName NVARCHAR(200))
AS
BEGIN
SELECT 
	CountryName
	,SUM(FilmRunTimeMinutes) AS [TotalRunTime]
	,AVG(CAST(FilmRunTimeMinutes AS DECIMAL)) AS [AvgRunTime]
FROM
	tblCountry AS c
INNER JOIN
	tblFilm AS f
ON
	c.CountryID = f.FilmCountryID
WHERE
	CountryName =  @countryName
GROUP BY
	CountryName
ORDER BY
	CountryName ASC
END


EXECUTE myStoredProcAgain  'Japan' ;

EXECUTE myStoredProc ; -- also can write EXEC

EXEC myStoredProcAgain;
-- Writing a Basic Stored procedure
USE Movies
GO --- The create proc should be a first statement in a Batch
CREATE PROC spFilmList
AS
BEGIN
SELECT
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
ORDER BY
	FilmName
END  --- End of the stored procedure

EXECUTE spFilmList   -- you can execute the stored procedure this way --- CTRL + SHFT + R to refresh the local Cache



--- Modify  the stored Procedure

----- 
GO --- This starts a new Batch
ALTER PROC myStoredProcAgain( @totalRunTime DECIMAL(10,2))
AS---- @totalRunTime is a value(input value that the user provides)
SELECT      --- SELECT
	CountryName  -- The column CountryName
	,SUM(FilmRunTimeMinutes) AS [TotalRunTime]  -- SUM of all the values in the column FilmRunTimeMinutes
	,AVG(CAST(FilmRunTimeMinutes AS DECIMAL)) AS [AvgRunTime]  ---- Average of FilmRunTimeMinutes 
FROM
	tblCountry AS c  --- from table tblCountry
INNER JOIN    ---- get common records
	tblFilm AS f   -- between these two tables ( tblCountry and tblFilm)
ON
	c.CountryID = f.FilmCountryID   -- these two column values should be equal (country table countryId should be equal to film table column FilmCountryID)
GROUP BY
	CountryName   --- GROUP The output got from the above operation
HAVING  SUM(FilmRunTimeMinutes) > @totalRunTime
ORDER BY
	CountryName ASC   
END



EXEC myStoredProcAgain  500


GO
ALTER PROC myStoredProcAgain( @avgRunTime DECIMAL(10,2)) --- when you pass the value 300 , the input parameter gets the value 300
AS---- @totalRunTime is a value(input value that the user provides)
SELECT      --- SELECT
	CountryName  -- The column CountryName
	,SUM(FilmRunTimeMinutes) AS [TotalRunTime]  -- SUM of all the values in the column FilmRunTimeMinutes
	,AVG(CAST(FilmRunTimeMinutes AS DECIMAL)) AS [AvgRunTime]  ---- Average of FilmRunTimeMinutes 
FROM
	tblCountry AS c  --- from table tblCountry
INNER JOIN    ---- get common records
	tblFilm AS f   -- between these two tables ( tblCountry and tblFilm)
ON
	c.CountryID = f.FilmCountryID   -- these two column values should be equal (country table countryId should be equal to film table column FilmCountryID)
GROUP BY
	CountryName   --- GROUP The output got from the above operation
HAVING  AVG(CAST(FilmRunTimeMinutes AS DECIMAL)) < @avgRunTime
ORDER BY
	CountryName ASC
END


EXEC myStoredProcAgain 120 ; --- the input parameter , @avgRunTime will be assigned the value 120


SELECT
	*
FROM
	tblFilm
WHERE
	YEAR(CONVERT(DATETIME, FilmReleaseDate)) > 1990
AND
	FilmName LIKE 'P%'


--- GET ME those records where for a particular year the number of movies releases was greater than 15

--- and for latest movies (movies released after 2003)
SELECT   
	YEAR(CONVERT(DATETIME, FilmReleaseDate)) AS release_year
	, COUNT(FilmID) AS film_count   -- SUM AVG MAX MIN COUNT STD  <-- These are my aggregation functions
FROM
	tblFilm
WHERE
	YEAR(CONVERT(DATETIME, FilmReleaseDate)) > 2003  --- here we are not using an agg function but directly the column name
GROUP BY
	YEAR(CONVERT(DATETIME, FilmReleaseDate))
HAVING   -- I am the having clause as the filter is happening on an AGGREGATION function (in this case COUNT)
	COUNT(FilmID) > 15 --- This is not a normal column. This is an agg function column (agg here is COUNT)
ORDER BY release_year ;    --- ORDER BY CLAUSE executes at the very end.


SELECT
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
ORDER BY
	FilmName DESC


/****** Object:  StoredProcedure [dbo].[spFilmList]    Script Date: 16-01-2023 16:38:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER  PROC [dbo].[spFilmList]
AS
BEGIN
SELECT
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
ORDER BY
	FilmName DESC
END  --- End of the stored procedure
GO


EXECUTE spFilmList


---- How can we add parameters to stored procedure


--- What are parameters

--- Creating Parameters

--- Execute Procedures with Parameters

--- 
USE Movies;
GO

CREATE PROC spFilmCriteria(@MinLength AS INT)
AS
	BEGIN
		SELECT
			FilmName,
			FilmReleaseDate,
			FilmRunTimeMinutes
		FROM tblFilm
		WHERE
			FilmRunTimeMinutes >= @MinLength
		ORDER BY
			FilmRunTimeMinutes DESC
	END

-- Execute the procedure
EXECUTE spFilmCriteria 180;

--- Add more paramters
GO
ALTER PROC spFilmCriteria(
		@MinLength AS INT,
		@releaseYear AS INT,
		@title AS VARCHAR(100)
)
AS
	BEGIN
		SELECT
			FilmName,
			FilmReleaseDate,
			FilmRunTimeMinutes
		FROM tblFilm
		WHERE
		(
			FilmRunTimeMinutes >=  @MinLength
		AND
			YEAR(FilmReleaseDate) >=  @releaseYear
		)
		AND
			FilmName LIKE '%' + @title + '%' -- @title = 'die' --- '%' + @title + '%'  --- '%die%'/ % = 0 or more characters
		ORDER BY
			FilmRunTimeMinutes DESC
	END

USE Movies;
EXECUTE spFilmCriteria 90, 1995, 'die' ;


--- We have seen a stored procedure with multiple parameters

--- Let's make the parameters optionial

--- Add more paramters
ALTER PROC spFilmCriteria(
		@MinLength AS INT = NULL,
		@releaseYear AS INT,
		@title AS VARCHAR(100)
)
AS
	BEGIN
		SELECT
			FilmName,
			FilmReleaseDate,
			FilmRunTimeMinutes
		FROM tblFilm
		WHERE
		(
			( @MinLength IS NULL  OR FilmRunTimeMinutes >=  @MinLength )
		OR
			YEAR(FilmReleaseDate) >=  @releaseYear
		)
		OR
		(
			FilmName LIKE '%' + @title + '%'
		)
		ORDER BY
			FilmRunTimeMinutes DESC
	END

EXEC spFilmCriteria  @MinLength =100,
@releaseYear = 2000,
@title = 'Die'
;


--- Declaring variables
--- A variable is a piece of memory

USE Movies;
GO

DECLARE @myDate AS DATETIME  -- This is declaring a variable called @myDate and the type DATETIME

SET @myDate = '01/01/1970' --- mm/dd/YYYY   --- This is to set the date to 1 Jan 1970

DECLARE @filmCount AS INT   --- declare variable @filmCount to be of type Int
SET @filmCount = (   
SELECT
	COUNT(*)
FROM
	tblFilm
WHERE
	FilmReleaseDate > @myDate   --- FilmReleaseDate > Ist Jan 1970

)


print 'The number of movies released after ' + CONVERT(NVARCHAR(12), @myDate ) + ' is ' + CONVERT(NVARCHAR(3), @filmCount)

----------------------------------  *********************** --------------------------------------------------------------------
---- Done till here on 16 Jan 2023 ----------------------------------------------------------------------------------------------
----------------------------------- *********************** ---------------------------------------------------------------------


DECLARE @myDate AS DATETIME

SET @myDate = '01/01/1975' --- mm/dd/YYYY

SELECT
	filmName AS [Name]
	,filmReleaseDate AS [Date]
	,'Film' AS [Type]
FROM
	tblFilm
WHERE
	FilmReleaseDate >= @myDate

UNION ALL


SELECT
	actorName AS [Name]
	,ActorDOB AS [Date]
	,'Actor' AS [Type]
FROM
	tblActor
WHERE
	ActorDOB >= @myDate

UNION ALL

SELECT
	DirectorName AS [Name]
	,DirectorDOB AS [Date]
	,'Director' AS [Type]
FROM
	tblDirector
WHERE
	DirectorDOB >= @myDate

ORDER BY [Date] ASC


DECLARE @myDate AS DATETIME
SET @myDate = '01/01/1970'

DECLARE @numFilms INT
SET @numFilms = (
					SELECT
							COUNT(*) FROM tblFilm
					WHERE
						FilmReleaseDate  > @myDate
				)
print 'Number of films = '+   CONVERT(VARCHAR(100), @numFilms)

DECLARE @numActors INT
DECLARE @numDirectors INT

SET @numActors = ( SELECT 
						COUNT(*) FROM tblActor
					WHERE
						ActorDOB > @myDate
				)
print @numActors;


--- Assign more than one variables
GO
DECLARE @ID INT
DECLARE @Name VARCHAR(100)
DECLARE @Date DATETIME

SELECT TOP 1
		@ID = ActorID
		,@Name = ActorName
		,@Date = ActorDOB
FROM
	tblActor
WHERE
	ActorDOB >  '01/01/1970'

print CONVERT(NVARCHAR(5), @ID)+'|'+@Name + '|' + CONVERT(NVARCHAR(11), @Date)

--- Using IF Statements
--- What is a IF Statement
DECLARE @NumFilms INT

SET @NumFilms = ( SELECT COUNT(*) FROM tblFilm WHERE FilmName LIKE 'P%' )

print @NumFilms

-- Perform the logical test

if @NumFilms > 5
	print('There are too many films that start with P in the database')


if @NumFilms > 10
	print('There are too many films that start with P in the database')


--- More than
ELSE
	print('There are no more than 10 films that start with P in the database')

--- More than one action will be within BEGIN AND END

if @NumFilms > 10
	BEGIN
		print('There are too many films that start with P in the database')
		print('I am in the if block')
	END
ELSE
	BEGIN
		print('There are no more than 10 films that start with P in the database')
		print('I am in the else block of code')
	END
