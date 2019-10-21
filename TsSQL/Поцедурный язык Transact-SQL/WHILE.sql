
DECLARE @counter int = 0

WHILE @counter < 10
BEGIN	
	SET @counter = @counter + 1
	PRINT 'counter: ' + CAST(@counter as varchar)
END


PRINT '--continue--'

SET @counter = 0
WHILE @counter < 10
BEGIN	
	SET @counter = @counter + 1
	
	IF @counter % 2 = 0
		CONTINUE

	PRINT 'counter: ' + CAST(@counter as varchar)
END


PRINT '--break--'

SET @counter = 0
WHILE @counter < 10
BEGIN	
	SET @counter = @counter + 1
	
	IF @counter = 6
		BREAK

	PRINT 'counter: ' + CAST(@counter as varchar)
END