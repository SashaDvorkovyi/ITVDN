
DECLARE cursor_name CURSOR  
	FOR SELECT * FROM Players 

OPEN cursor_name 

FETCH NEXT FROM cursor_name

CLOSE cursor_name

DEALLOCATE cursor_name


DECLARE @lName VARCHAR(50), @rank INT, @players_cursor CURSOR

SET @players_cursor = CURSOR
	FOR SELECT LName, [Rank] FROM Players

OPEN @players_cursor 

FETCH NEXT FROM @players_cursor INTO @lName, @rank
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT 'Player: ' + ISNULL(@lName, 'undefined') + ', rank: ' + ISNULL(CAST(@rank AS VARCHAR), 'undefined')  
		FETCH NEXT FROM @players_cursor INTO @lName, @rank
	END

CLOSE @players_cursor

DEALLOCATE @players_cursor


DECLARE courts_cursor CURSOR 
	SCROLL 
	FOR SELECT * FROM Courts 

OPEN courts_cursor 

FETCH NEXT FROM courts_cursor
FETCH PRIOR FROM courts_cursor
FETCH LAST FROM courts_cursor
FETCH FIRST FROM courts_cursor
FETCH ABSOLUTE 2 FROM courts_cursor
FETCH RELATIVE 3 FROM courts_cursor
FETCH RELATIVE -2 FROM courts_cursor

CLOSE courts_cursor

DEALLOCATE courts_cursor

SELECT * FROM Courts