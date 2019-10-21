
SELECT * FROM Employees
WHERE Salary = 10000

SELECT * FROM Employees
WHERE Department = 'sales'

SELECT * FROM Employees
WHERE BirthDate > '19900101'

SELECT * FROM Employees
WHERE BirthDate !> '19900101'

SELECT * FROM Employees
WHERE Department = 'sales' AND Salary >= 6000 

SELECT * FROM Employees
WHERE Department = 'sales' OR Department = 'supply'

SELECT * FROM Employees

WHERE Salary >= 6000 AND (Department = 'sales' OR Department = 'supply')

SELECT * FROM Employees
WHERE Department IN ('sales', 'supply', 'law', 'logistics')

SELECT * FROM Employees
WHERE Department NOT IN ('sales', 'supply', 'law', 'logistics')

SELECT * FROM Employees
WHERE BirthDate > '19900101' AND BirthDate < '19930101'

SELECT * FROM Employees
WHERE BirthDate BETWEEN '19900101' AND '19930101'

SELECT * FROM Employees
WHERE Department LIKE 'sales'

SELECT * FROM Employees
WHERE Phone LIKE '063%'

SELECT * FROM Employees
WHERE Id LIKE '_2'

SELECT * FROM Employees
WHERE Id LIKE '[2,4]2'

SELECT * FROM Employees
WHERE Id LIKE '[2-5]2'

SELECT * FROM Employees
WHERE Id LIKE '[^2-5]2'

SELECT * FROM Employees
WHERE Salary IS NULL

SELECT * FROM Employees
WHERE Salary IS NOT NULL

SELECT * FROM Employees
WHERE Salary IN (4000, 7000, NULL) 

SELECT * FROM Employees
WHERE Salary IN (4000, 7000) 
OR Salary IS NULL