SELECT BusinessEntityID, LoginID FROM HumanResources.Employee
WHERE Gender = 'F' AND BirthDate > '1969-01-29';
 SELECT DISTINCT PersonType FROM Person.Person
 WHERE (LastName LIKE 'M%' OR LastName LIKE 'N%') OR MiddleName IS NOT NULL;
 SELECT * FROM Sales.SpecialOffer
 WHERE StartDate BETWEEN '2013-01-01' AND '2014-01-01'
 ORDER BY DiscountPct DESC
 SELECT ProductID, Name FROM Production.Product
 WHERE ProductNumber LIKE '_B%[0123456789]'
 ORDER BY ProductID DESC
 SELECT ProductId, Name FROM Production.Product
 WHERE (Color = 'Red' OR Color = 'Silver' OR Color = 'Black') AND Size IS NOT NULL;
 SELECT DISTINCT JobTitle FROM HumanResources.Employee
 WHERE (SickLeaveHours <= 15 OR VacationHours !> 20) AND JobTitle NOT LIKE '%Vice President%' AND JobTitle NOT LIKE '%Manager%';