--2.a)
SELECT UnitMeasureCode FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%';

SELECT COUNT(DISTINCT UnitMeasureCode) AS unique_code FROM Production.UnitMeasure;

/*INSERT INTO Production.UnitMeasure (UnitMeasureCode, Name, ModifiedDate)
VALUES
('TT1', 'Test 1', (CONVERT(DATE, '9 —≈Ќ“яЅ–я 2023', 104)),
('TT2', 'Test 2', GETDATE());
существует ли така€ комбинаци€? почему не работает мо€ ошибка где-то, просто бред или не поддерживает MS?
задумка была в форматировании формата даты в стандартный вид в Ѕƒ*/


INSERT INTO Production.UnitMeasure (UnitMeasureCode, Name, ModifiedDate)
VALUES
('TT1', 'Test 1', '2023-09-09'),
('TT2', 'Test 2', GETDATE());

--2.b)
--ошибочно скопировала всю таблицу
SELECT * 
INTO Production.UnitMeasureTest 
FROM Production.UnitMeasure;

SELECT * FROM Production.UnitMeasureTest;

DROP TABLE Production.UnitMeasureTest;

--попытка 2
SELECT UnitMeasureCode, Name, ModifiedDate
INTO Production.UnitMeasureTest
FROM Production.UnitMeasure
WHERE UnitMeasureCode IN ('TT1', 'TT2', 'CAN');

SELECT * FROM Production.UnitMeasureTest;

--2.c)
UPDATE Production.UnitMeasureTest
SET UnitMeasureCode='TTT';
 
SELECT * FROM Production.UnitMeasureTest;

--2.d)
DELETE FROM Production.UnitMeasureTest;

SELECT * FROM Production.UnitMeasureTest;

--2.e)
SELECT SalesOrderID, 
MAX(LineTotal) AS max_LineTotal, 
MIN(LineTotal) AS min_LineTotal, 
AVG(LineTotal) AS avg_LineTotal
FROM Sales.SalesOrderDetail
WHERE SalesOrderID='43659' OR SalesOrderID='43664'
GROUP BY SalesOrderID;

--2.f) Sales.vSalesPerson объедин€ет данные из нескольких таблиц, включа€ таблицы SalesPerson, SalesOrderHeader и SalesOrderDetail
SELECT BusinessEntityID, SalesYTD, SalesLastYear,
RANK() OVER (ORDER BY SalesYTD DESC) AS rank_SalesYTD,
RANK() OVER (ORDER BY SalesLastYear DESC) AS rank_SalesLastYear,
UPPER(LEFT(LastName, 3))+'login'+ISNULL(TerritoryGroup, '') AS LoginName
FROM Sales.vSalesPerson;


