DECLARE @myid uniqueidentifier = NEWID();
SELECT CONVERT(CHAR(255), @myid) AS 'char';

SELECT * FROM Production.Document;

--4. Вывод ограничений
--Итого 3 ограничения: PK, FK и DEFAULT
--Я бы сама до такого не додумалась, есть ли способоб проще? Кроме написания кода, использования SSMS или способа "ну, видно же, по логике")
SELECT 
    cons.name AS constraint_name,
    cols.name AS column_name,
    cons.type_desc AS constraint_type
FROM 
    sys.objects AS cons
INNER JOIN 
    sys.columns AS cols ON cons.parent_object_id = cols.object_id
INNER JOIN 
    sys.tables AS tbl ON cols.object_id = tbl.object_id
WHERE 
    tbl.name = 'Address';

--5.
CREATE TABLE Patients (
ID INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(50),
LastName VARCHAR(50) NOT NULL,
SSN INT UNIQUE,
Email AS UPPER(LEFT(FirstName, 1))+LOWER(SUBSTRING(LastName, 1, 3))+'@mail.com',
Temp DECIMAL(4,2) CHECK (Temp <= 45),
CreatedDate DATETIME
);

--6.
INSERT INTO Patients (FirstName, LastName, SSN, Temp)
VALUES ('Tom', 'Brown', 4569, 36.60),
('', 'Smith', 3498, 40.37),
('Kate', 'Hill', 8963, 35.84);
/*, ('Mary', 'Jane', 7852-3, 48.36),
('Sansa', 'Stark', 8963, 35.84);*/

SELECT * From Patients;

--7.
ALTER TABLE Patients
ADD TempType AS (CASE
WHEN Temp<0 THEN '< 0°C'
ELSE '> 0°C'
END);

SELECT * From Patients;
