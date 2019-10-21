
USE GrandSlamDB
GO

DECLARE @MyTableVar table (
	Id int,
	Name varchar(30),
	Rank int
)

INSERT INTO @MyTableVar
SELECT TOP 5 Id, LName, Rank FROM Players
WHERE Rank IS NOT NULL
ORDER BY Rank

SELECT * FROM @MyTableVar

CREATE TABLE #tPlayers(
	Id int,
	Name varchar(30),
	YearsOld int
)
GO

INSERT #tPlayers
SELECT p.Id, p.LName, DATEDIFF(YEAR, pi.BirthDate, GETDATE()) YearsOld FROM Players p
		LEFT JOIN PlayerInfos pi ON p.Id = pi.PlayerId
GO

SELECT * FROM #tPlayers

DELETE #tPlayers

DROP TABLE #tPlayers

SELECT t.Id, t.LName, t.YearsOld
INTO #tPlayers
FROM (SELECT p.Id, p.LName, DATEDIFF(YEAR, pi.BirthDate, GETDATE()) YearsOld FROM Players p
		LEFT JOIN PlayerInfos pi ON p.Id = pi.PlayerId) t

;WITH Players_CTE (Id, LName, YearsOld)
AS

(SELECT p.Id, p.LName, DATEDIFF(YEAR, pi.BirthDate, GETDATE()) YearsOld FROM Players p
		LEFT JOIN PlayerInfos pi ON p.Id = pi.PlayerId)

SELECT * FROM Players_CTE


;WITH Players_CTE 
AS

(SELECT p.Id, p.LName, DATEDIFF(YEAR, pi.BirthDate, GETDATE()) YearsOld FROM Players p
		LEFT JOIN PlayerInfos pi ON p.Id = pi.PlayerId)

SELECT * FROM Players_CTE


;WITH Tall_Players AS(
	SELECT p.Id, p.LName FROM Players p
		LEFT JOIN PlayerInfos pi ON p.Id = pi.PlayerId
		WHERE pi.Height >= (SELECT AVG(Height) FROM PlayerInfos)
),
Heavy_Players AS(
	SELECT p.Id, p.LName FROM Players p
		LEFT JOIN PlayerInfos pi ON p.Id = pi.PlayerId
		WHERE pi.Weight >= (SELECT AVG(Weight) FROM PlayerInfos)
)
SELECT * FROM Tall_Players 
UNION 
SELECT * FROM Heavy_Players



	SELECT p.Id, p.LName FROM Players p
		LEFT JOIN PlayerInfos pi ON p.Id = pi.PlayerId
		WHERE pi.Height >= (SELECT AVG(Height) FROM PlayerInfos)

UNION

	SELECT p.Id, p.LName FROM Players p
		LEFT JOIN PlayerInfos pi ON p.Id = pi.PlayerId
		WHERE pi.Weight >= (SELECT AVG(Weight) FROM PlayerInfos)
