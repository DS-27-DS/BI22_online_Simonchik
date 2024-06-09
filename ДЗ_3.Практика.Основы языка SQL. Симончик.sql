SELECT MIN(Weight) AS min_weight, MAX(Size) AS max_size FROM Production.Product;

SELECT MIN(Weight) AS min_weight, MAX(Size) AS max_size FROM Production.Product
GROUP BY ProductSubcategoryID;

--мой вариант (b) с доработкой
SELECT MIN(Weight) AS min_weight, MAX(Size) AS max_size, ProductSubcategoryID FROM Production.Product
WHERE Weight IS NOT NULL AND Size IS NOT NULL
GROUP BY ProductSubcategoryID
ORDER BY MAX(Size);

SELECT Color, MIN(Weight) AS min_weight, MAX(Size) AS max_size FROM Production.Product
GROUP BY ProductSubcategoryID, Color;

--мой вариант (c) с доработкой
SELECT Color, MIN(Weight) AS min_weight, MAX(Size) AS max_size FROM Production.Product
WHERE Weight IS NOT NULL AND Size IS NOT NULL AND Color IS NOT NULL
GROUP BY ProductSubcategoryID, Color;

SELECT DISTINCT ProductSubcategoryID FROM Production.Product
WHERE Weight>50;

-- вариант (d) с выводом веса и группировкой
SELECT DISTINCT ProductSubcategoryID, MIN(Weight) AS min_weight FROM Production.Product
GROUP BY ProductSubcategoryID
HAVING MIN(Weight)>50;

SELECT * FROM Production.ProductSubcategory
WHERE ProductSubcategoryID IN (
    SELECT ProductSubcategoryID
    FROM Production.Product
    WHERE Color='Black'
    GROUP BY ProductSubcategoryID
    HAVING MIN(Weight)>50);

	SELECT TaxType FROM Sales.SalesTaxRate
	WHERE TaxRate<7;