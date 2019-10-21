
USE GrandSlamDB
GO

SELECT p.LName, t.Name, ISNULL(tb.Wins, 0) Wins FROM Players p
		CROSS JOIN Tournaments t
		LEFT JOIN 
		(SELECT ps.PlayerId, COUNT(ps.Win) Wins, m.TournamentId FROM PlayerStats ps 
				JOIN Matches m 
				ON ps.MatchId = m.Id AND ps.Win = 1 
				GROUP BY ps.PlayerId, m.TournamentId) tb 
		ON tb.PlayerId = p.Id AND tb.TournamentId = t.Id
		ORDER BY p.LName


SELECT * FROM Matches
WHERE TournamentId = (SELECT Id FROM Tournaments WHERE Name = 'Wimbledon')


SELECT * FROM PlayerInfos
WHERE BirthDate = (SELECT MIN(BirthDate) FROM PlayerInfos)

õ
SELECT * FROM PlayerInfos
WHERE Height >= (SELECT AVG(Height) FROM PlayerInfos)


SELECT * FROM Players
WHERE Id IN (SELECT Id FROM PlayerInfos WHERE Height = 198)

SELECT * FROM Players p
	JOIN PlayerInfos pi ON p.Id = pi.PlayerId
	WHERE pi.Height = 198


SELECT * FROM Players
WHERE Id IN (SELECT Id FROM PlayerInfos 
			WHERE Height = (SELECT MAX(Height) FROM PlayerInfos))



SELECT * FROM Players
WHERE Id != ALL (SELECT ps.PlayerId FROM Matches m
					JOIN PlayerStats ps ON m.Id = ps.MatchId
					WHERE m.Round = 'FINALS')


SELECT * FROM Courts
WHERE Id != ALL (SELECT CourtId FROM Matches)


SELECT * FROM Courts
WHERE Id NOT IN (SELECT CourtId FROM Matches)

SELECT * FROM Courts c1
WHERE NOT EXISTS (SELECT * FROM Matches m
								JOIN Courts c2 ON m.CourtId = c2.Id AND c1.Id = c2.Id)

SELECT * FROM Courts
WHERE Id = ANY (SELECT CourtId FROM Matches)

SELECT * FROM Courts
WHERE Id IN (SELECT CourtId FROM Matches)

SELECT DISTINCT c.Id, c.Name FROM Courts c 
			JOIN Matches m ON m.CourtId = c.Id


SELECT * FROM PlayerStats ps1
WHERE Aces = (SELECT MAX(Aces) FROM PlayerStats ps2 WHERE ps1.PlayerId = ps2.PlayerId)

SELECT Id, 
(SELECT Date FROM Matches m WHERE m.Id = ps.MatchId) Date,
(SELECT LName FROM Players p WHERE p.Id = ps.PlayerId) Player,
Aces
FROM PlayerStats ps 

SELECT ps.Id, m.Date, p.LName, ps.Aces FROM PlayerStats ps 
			JOIN Matches m ON m.Id = ps.MatchId
			JOIN Players p ON p.Id = ps.PlayerId


SELECT LName,
(SELECT MAX(Aces) FROM PlayerStats ps WHERE ps.PlayerId = p.Id) MAX_Aces
FROM Players p

SELECT * FROM Players p
WHERE NOT EXISTS (SELECT * FROM PlayerStats ps WHERE ps.PlayerId = p.Id) 

SELECT * FROM Players p
WHERE p.Id NOT IN (SELECT PlayerId FROM PlayerStats ps WHERE ps.PlayerId = p.Id) 

SELECT * FROM Players p
WHERE p.Id != ALL (SELECT PlayerId FROM PlayerStats ps WHERE ps.PlayerId = p.Id) 


SELECT LName,
(SELECT MIN(Aces) FROM PlayerStats ps WHERE ps.PlayerId = p.Id) MIN_Aces,
(SELECT MAX(Aces) FROM PlayerStats ps WHERE ps.PlayerId = p.Id) MAX_Aces
FROM Players p

SELECT LName,
psa.MIN_Aces,
psa.MAX_Aces
FROM Players p
CROSS APPLY
(SELECT MAX(Aces) MAX_Aces, MIN(Aces) MIN_Aces FROM PlayerStats ps WHERE ps.PlayerId = p.Id) psa


