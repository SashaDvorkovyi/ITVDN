
USE ITVDNdb

SELECT ProductId, SUM(Qty) Total_Qty FROM Orders
GROUP BY ProductId

SELECT ProductId, SUM(Qty) Total_Qty FROM Orders
WHERE City IS NOT NULL
GROUP BY ProductId

SELECT ProductId, SUM(Qty) Total_Qty FROM Orders
GROUP BY ProductId
HAVING SUM(Qty) >= 10

SELECT ProductId, SUM(Qty) Total_Qty FROM Orders
WHERE City IS NOT NULL
GROUP BY ProductId
HAVING SUM(Qty) >= 10

SELECT ProductId, MIN(Price) MIN_Price, MAX(Price) MAX_Price FROM Orders
WHERE City IS NOT NULL
GROUP BY ProductId

SELECT ProductId, 
MIN(Price) MIN_Price, 
MAX(Price) MAX_Price,
AVG(Price) AVG_Price
FROM Orders
GROUP BY ProductId

SELECT ProductId, 
MIN(Price) MIN_Price, 
MAX(Price) MAX_Price,
SUM(Price*Qty)/SUM(Qty) AVG_Price
FROM Orders
GROUP BY ProductId

SELECT COUNT(*) FROM Orders

SELECT COUNT(City) FROM Orders

SELECT COUNT(DISTINCT City) FROM Orders

SELECT 
COUNT(DISTINCT ProductId) Products,
COUNT(DISTINCT City) Cities
FROM Orders

SELECT City, COUNT(*) Sales FROM Orders
GROUP BY City

SELECT City, COUNT(City) Sales FROM Orders
GROUP BY City

SELECT City, COUNT(City) Sales FROM Orders
WHERE City IS NOT NULL
GROUP BY City

SELECT ProductID,
COUNT(Id), 
SUM(Qty) Total_Qty,
SUM(Price*Qty) Total_Sum,
MIN(Price) MIN_Price, 
MAX(Price) MAX_Price,
SUM(Price*Qty)/SUM(Qty) AVG_Price
FROM Orders
WHERE City IS NOT NULL
GROUP BY ProductID

SELECT City,
AVG(Qty * Price) AVG_Sale
FROM Orders
GROUP BY City