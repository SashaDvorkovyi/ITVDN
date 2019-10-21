
SELECT ASCII('hello') [ASCII],
	   UNICODE(N'быть') [UNICODE]
 преобразует int код ASCII / UNICODE в символ.

SELECT CHAR(104) [CHAR],
	   NCHAR(1073) [NCHAR]


SELECT LEFT('abcdefg',2) [LEFT],
	   RIGHT('abcdefg',2) [RIGHT],
	   LOWER('ABCDEFG') [LOWER],
	   UPPER('abcdefg') [UPPER],
	   LEN('12345   ') [LEN],
	   REVERSE('12345') [REVERSE]


SELECT STUFF('abcdefg', 3, 2, '!!!') [STUFF],
	   SUBSTRING('abcdefg', 3, 2) [SUBSTRING]

PRINT LTRIM('    hello')
PRINT RTRIM('world    ')
PRINT 'Hello,' + SPACE(5) + 'world'
PRINT REPLICATE('&', 7)

SELECT CHARINDEX('Two', 'One Two Three Two Four'),
	   CHARINDEX('Two', 'One Two Three Two Four', 6),
	   PATINDEX('%Th_ee%', 'One Two Three Two Four')

SELECT REPLACE('One Two Three Two Four', 'Two', '2')

SELECT N'јйседора' + ' ' + N'ƒункан',
	   N'јйседора' + ' ' + NULL,
	   N'јйседора' + ' ' + ISNULL(NULL, ''),
	   CONCAT(N'јйседора', ' ', NULL)

SELECT value
FROM STRING_SPLIT('PRODUCTION & ENGINEERING|SUPPLY|LOGISTICS|
PLANNED-ECONOMIC|QUALITY ASSURANCE & CONTROL|ADMINISTRATION & SUPPORT|
MARKETING|HR MANAGEMENT|SALES|FINANCE & ACCOUNTING|LAW', '|')






