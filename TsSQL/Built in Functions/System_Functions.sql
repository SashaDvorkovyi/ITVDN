
DECLARE @myint int;  
SET @myint = 'ABC';  
GO

SELECT @@ERROR; 
GO

BEGIN TRY
	DECLARE @myint int;  
	SET @myint = 1/0
END TRY
BEGIN CATCH
	SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage
END CATCH

INSERT Students
VALUES 
('Alex', 'Li', NULL, NULL);  
GO  
SELECT @@IDENTITY;  
GO  

UPDATE Students
SET LName = 'Po'
WHERE Id = 6
GO 
SELECT @@ROWCOUNT;  
GO

DELETE Students
GO  
SELECT @@ROWCOUNT;  
GO

DECLARE @myId uniqueidentifier  
SET @myId = NEWID()  
PRINT @myId

SELECT 
	ISNUMERIC('33')
	,ISNUMERIC(17)
	,ISNUMERIC('3abc')
	,ISNUMERIC(@myId)
	,ISNUMERIC('+')
	,ISNUMERIC('$')

SELECT Id, LName, ISNULL(Salary, 0.0) AS Salary
FROM Employees

DECLARE @myInt int;
SELECT 3 + @myInt, 3 + ISNULL(@myInt, 0)
