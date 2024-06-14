--3.A)
SELECT CONCAT(FirstName, ' ', LastName) AS full_name, Person.PersonPhone.PhoneNumber FROM Person.Person
INNER JOIN Person.PersonPhone ON Person.Person.BusinessEntityID=Person.PersonPhone.BusinessEntityID;

--3.B)
SELECT Production.Product.Name, AVG(Purchasing.ProductVendor.StandardPrice) AS avg_cost FROM Production.Product
INNER JOIN Purchasing.ProductVendor ON Purchasing.ProductVendor.ProductID=Production.Product.ProductID
INNER JOIN Purchasing.Vendor ON Purchasing.ProductVendor.BusinessEntityID=Purchasing.Vendor.BusinessEntityID
WHERE (Purchasing.Vendor.Name LIKE '%A%' OR Purchasing.Vendor.AccountNumber LIKE 'A%')
GROUP BY Production.Product.Name
HAVING AVG(Purchasing.ProductVendor.StandardPrice)>10;

--3.C) SELECT * FROM Purchasing.ProductVendor
SELECT Purchasing.Vendor.Name FROM Purchasing.Vendor
LEFT JOIN Purchasing.ProductVendor ON Purchasing.Vendor.BusinessEntityID=Purchasing.ProductVendor.BusinessEntityID
WHERE Purchasing.ProductVendor.BusinessEntityID IS NULL;

--4.A)
SELECT * FROM Purchasing.ProductVendor
WHERE DATEDIFF(CURRENT_TIMESTAMP, LastReceiptDate)<=3650;
--если гуглить такую комбинацию ф-ий, то в DATEDIFF необходимо 2 аргумента, но здесь требует 3,какие варианты еще могут быть?

--4.B)
SELECT * FROM Purchasing.ProductVendor
WHERE MONTH(LastReceiptDate) = MONTH(CURRENT_TIMESTAMP);

--4.C)
SELECT 
DATENAME(dw, LastReceiptDate) AS DayOfWeek,
COUNT(*) AS NumberOfEvents
FROM Purchasing.ProductVendor
GROUP BY DATENAME(dw, LastReceiptDate)
ORDER BY CASE DATENAME(dw, LastReceiptDate) 
WHEN 'Monday' THEN 1
WHEN 'Tuesday' THEN 2
WHEN 'Wednesday' THEN 3
WHEN 'Thursday' THEN 4
WHEN 'Friday' THEN 5
WHEN 'Saturday' THEN 6
WHEN 'Sunday' THEN 7
END;
--сделала по найденому примеру и не совсем разобралась с синтаксиом CASE, WHEN, THEN, END

--4.D)
SELECT
FORMAT(LastReceiptDate, 'dd') AS day,
FORMAT(LastReceiptDate, 'MM') AS month,
FORMAT(LastReceiptDate, 'yy') AS year,
(SELECT COUNT(LastReceiptDate) FROM Purchasing.ProductVendor WHERE FORMAT(LastReceiptDate, 'dd')=FORMAT(LastReceiptDate, 'dd')) AS events_on_day,
(SELECT COUNT(LastReceiptDate) FROM Purchasing.ProductVendor WHERE FORMAT(LastReceiptDate, 'MM')=FORMAT(LastReceiptDate, 'MM')) AS events_in_month,
(SELECT COUNT(LastReceiptDate) FROM Purchasing.ProductVendor WHERE FORMAT(LastReceiptDate, 'yy')=FORMAT(LastReceiptDate, 'yy')) AS events_in_year
FROM Purchasing.ProductVendor;
--почему в части подзапросных селектов не работают алисы из основоного первого селекта (day, month, year)?