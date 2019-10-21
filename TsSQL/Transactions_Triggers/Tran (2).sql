
IF EXISTS (SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('TestTable'))
	DROP TABLE TestTable
CREATE TABLE TestTable  (Id INT IDENTITY, Value INT)
INSERT INTO TestTable (Value) VALUES(1)


BEGIN TRAN 

UPDATE TestTable 
SET Value = Value + 3
WHERE Id = 1;

WAITFOR DELAY '00:00:10';

SELECT Value 
FROM TestTable
WHERE Id = 1;
COMMIT TRAN;


BEGIN TRAN;

DECLARE @Value INT;

SELECT @Value = Value
FROM TestTable
WHERE Id = 1;

WAITFOR DELAY '00:00:10';

UPDATE TestTable 
SET Value = @Value + 3
WHERE Id = 1;

COMMIT TRAN;

SELECT Value 
FROM TestTable
WHERE Id = 1;


BEGIN TRAN;

UPDATE TestTable
SET Value = Value + 3
WHERE Id = 1;

WAITFOR DELAY '00:00:10';

ROLLBACK;

SELECT Value 
FROM TestTable
WHERE Id = 1;


BEGIN TRAN SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT Value 
FROM TestTable
WHERE Id = 1;

WAITFOR DELAY '00:00:10';

SELECT Value 
FROM TestTable
WHERE Id = 1;

COMMIT TRAN;


BEGIN TRAN --SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT * FROM TestTable  

WAITFOR DELAY '00:00:10'  

SELECT * FROM TestTable

COMMIT TRAN;