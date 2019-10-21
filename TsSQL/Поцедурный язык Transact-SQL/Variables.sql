
DECLARE @name varchar(10); 
PRINT ISNULL(@name, 'NULL')


DECLARE @age smallint = 2; 
PRINT @age


SET @name = 'Elijah';
PRINT @name


SELECT @age = 5;
PRINT @age


SELECT @name = LName FROM GrandSlamDB.dbo.Players 
							WHERE Id = 3
PRINT @name


SELECT @name = LName FROM GrandSlamDB.dbo.Players 
							--WHERE Id = 3
PRINT @name


SELECT @name = LName FROM GrandSlamDB.dbo.Players 
							WHERE Id = 100
PRINT @name


SELECT @name = (SELECT LName FROM GrandSlamDB.dbo.Players 
							WHERE Id = 3)
PRINT @name


SELECT @name = (SELECT LName FROM GrandSlamDB.dbo.Players) 
							--WHERE Id = 3)
PRINT @name


SELECT @name = (SELECT LName FROM GrandSlamDB.dbo.Players 
							WHERE Id = 100)
PRINT ISNULL(@name, 'NULL')