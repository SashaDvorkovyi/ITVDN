
BEGIN TRY
    SELECT 1/0;
    --DROP TABLE NonexistentTable;
END TRY
BEGIN CATCH
    SELECT
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO


BEGIN TRY
    SELECT 1/0;
END TRY
BEGIN CATCH
   RAISERROR('������� �� ����', 11, 2); 
END CATCH;
GO

BEGIN TRY
    SELECT 1/0;
END TRY
BEGIN CATCH
   RAISERROR('������ %s %d', 11, 2, N'�����', 10);   
END CATCH;
GO


BEGIN TRY
    RAISERROR('������� �� ����', 11, 3);
	PRINT 'TRY'
END TRY
BEGIN CATCH
   PRINT 'CATCH'
END CATCH;
GO

BEGIN TRY	     
    RAISERROR('������� �� ����', 10, 3);
	PRINT 'TRY'
END TRY
BEGIN CATCH
   PRINT 'CATCH'
END CATCH;
GO


BEGIN TRY
    SELECT 1/0;
END TRY
BEGIN CATCH
   THROW 51000, '������� �� ����', 2;   
END CATCH;
GO

BEGIN TRY
    THROW 51000, '������� �� ����', 2;
END TRY
BEGIN CATCH
   SELECT
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO