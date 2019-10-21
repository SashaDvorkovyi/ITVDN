
USE InternetShopDB

SELECT * FROM sys.objects

SELECT * FROM sys.objects
WHERE type = 'U'

SELECT * FROM sys.objects
WHERE schema_id = SCHEMA_ID('dbo')


SELECT * FROM sys.tables

SELECT * FROM sys.views

SELECT * FROM sys.triggers

SELECT * FROM sys.procedures

SELECT * FROM sys.objects
WHERE type IN ('FN', 'IF', 'TF', 'FS', 'FT') ;

EXEC sp_help 

EXEC sp_help 'Employees'

EXEC sp_help 'PK_Customers'

EXEC sp_databases 
EXEC sp_tables

EXEC sp_tables @table_owner='dbo'

EXEC sp_columns 'Employees'

EXEC sp_pkeys 'Employees'

EXEC sp_depends 'Employees'

EXEC sp_depends 'Orders'

