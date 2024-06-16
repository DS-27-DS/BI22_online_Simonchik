--1.A)
SELECT StandardCost
, CASE
WHEN StandardCost=0 OR StandardCost IS NULL THEN 'Not for sale'
END
FROM Production.Product;

--1.B)
SELECT StandardCost
, CASE
WHEN StandardCost>0 AND StandardCost<100 THEN '<$100'
END
FROM Production.Product;

--1.C)
SELECT StandardCost
, CASE
WHEN StandardCost>=100 AND StandardCost<500 THEN '<$500'
END
FROM Production.Product;

--1.D)
SELECT StandardCost
, CASE
WHEN StandardCost>=500 THEN '>=500'
END
FROM Production.Product;

SELECT StandardCost
, CASE
WHEN StandardCost=0 THEN 'Not for sale'
WHEN StandardCost>0 AND StandardCost<100 THEN '<$100'
WHEN StandardCost>=100 AND StandardCost<500 THEN '<$500'
WHEN StandardCost>=500 THEN '>=500'
END
FROM Production.Product;

--2.
--IIF(S=0, 'N', IIF(S>0 AND S<100, '<$100', IIF(S>=100 AND S<500, '<$500', IIF(S>=500, '>$500', '')))) AS CostStatus
SELECT StandardCost,
IIF(StandardCost = 0 OR StandardCost IS NULL, 'Not for sale', 
IIF(StandardCost > 0 AND StandardCost < 100, '<$100', 
IIF(StandardCost >= 100 AND StandardCost < 500, '<$500', 
IIF(StandardCost >= 500, '>$500', '')))) AS CostStatus
FROM Production.Product;

--3.
SELECT LastReceiptDate, LastReceiptCost, AverageLeadTime,
CASE 
WHEN MONTH(LastReceiptDate) IN (12, 1, 2) THEN 'Winter'
WHEN MONTH(LastReceiptDate) IN (3, 4, 5) THEN 'Spring'
WHEN MONTH(LastReceiptDate) IN (6, 7, 8) THEN 'Summer'
ELSE 'Autumn'
END AS season,
CASE WHEN LastReceiptCost<2000 THEN 'Do not include' END AS condition
FROM Purchasing.ProductVendor
WHERE AverageLeadTime>15;

--4.
SELECT AverageLeadTime, BusinessEntityID,
SUM(LastReceiptCost) OVER (PARTITION BY BusinessEntityID) AS total_profit,
MAX(LastReceiptCost) OVER (PARTITION BY BusinessEntityID) AS max_profit
FROM Purchasing.ProductVendor
WHERE AverageLeadTime=15;