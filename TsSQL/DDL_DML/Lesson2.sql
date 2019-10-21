E
CREATE DATABASE ITVDNdb  

ALTER DATABASE ITVDNdb            
COLLATE Cyrillic_General_CI_AS	


DROP DATABASE ITVDNdb


CREATE DATABASE ITVDNdb
COLLATE Cyrillic_General_CI_AS

USE ITVDNdb


CREATE TABLE Students
(
    Id int NOT NULL IDENTITY,
    FName nvarchar(20),
	LName nvarchar(20),
	Phone char(12),
	EMail varchar(20),
);

ALTER TABLE Students
ALTER COLUMN LName nvarchar(30) NOT NULL

ALTER TABLE Students
ADD MName nvarchar(30) 

ALTER TABLE Students
DROP COLUMN MName

DROP TABLE Students


INSERT INTO Students 

	VALUES
		(N'Александр', N'Македонский', '(012)3456789', 'alex@imperium.com'),
		(N'Диоген', N'Синопский', NULL, 'sinop@pithos.com')

		

SET IDENTITY_INSERT Students ON

INSERT INTO Students 
(Id, FName, LName, Phone, EMail)
	VALUES
		(3, NULL, N'Семирамида', '(012)3456788', 'assyria@imperium.com')
		

SET IDENTITY_INSERT Students OFF


SELECT * FROM Students

SELECT LName, EMail FROM Students

SELECT LName, EMail FROM Students
	WHERE Id = 1
	

CREATE TABLE StudentPhones
(
    Id int,
	LastName nvarchar(20),
	PhoneNumber char(12)
);

INSERT StudentPhones
	SELECT Id, LName, Phone FROM Students

SELECT * FROM StudentPhones

UPDATE Students
	SET Phone = NULL

UPDATE Students
	SET Phone = sp.PhoneNumber
	FROM Students s 
	JOIN StudentPhones sp ON s.Id = sp.Id


DELETE Students
	--WHERE Id = 1


TRUNCATE TABLE Students
TRUNCATE TABLE StudentPhones

INSERT Students (FName, LName, Phone, EMail)
OUTPUT inserted.*
	VALUES
		(N'Александр', N'Македонский', '(012)3456789', 'alex@imperium.com'),
		(N'Диоген', N'Синопский', NULL, 'sinop@pithos.com'),
		(NULL, N'Семирамида', '(012)3456788', 'assyria@imperium.com')

DELETE Students
OUTPUT deleted.Id, deleted.LName
	WHERE Id = 1
	
UPDATE Students
	SET Phone = '(012)3456789'
	OUTPUT inserted.Id, inserted.LName, inserted.Phone AS [Новый телефон], deleted.Phone "Старый телефон"
	WHERE Id = 2
	
DELETE Students
OUTPUT deleted.Id, deleted.LName, deleted.Phone INTO StudentPhones

DECLARE @deleteTable table (Id int, LastName nvarchar(20));	

DELETE Students
OUTPUT deleted.Id, deleted.LName INTO @deleteTable

SELECT * FROM @deleteTable