
SELECT Id, LName, BirthDate,
CHOOSE(MONTH(BirthDate), 'Winter','Winter', 'Spring','Spring','Spring','Summer','Summer',   
'Summer','Autumn','Autumn','Autumn','Winter') 
FROM Employees

IF NOT EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('Cars'))
BEGIN
    CREATE TABLE Cars
	(
		Id int IDENTITY,
		Name varchar(20)
	)
END
GO

SELECT OBJECT_ID('Cars'),
       OBJECT_NAME(OBJECT_ID('Cars'))

IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('Cars'))
BEGIN
    DROP TABLE Cars
END
GO