-- Confirm table has been created and data has been imported --
SELECT * FROM public."Online_Retail";

----- Data cleaning -----
	
-- Check for null values --
SELECT *
FROM public."Online_Retail"
WHERE "InvoiceNo" IS NULL
OR "StockCode" IS NULL
OR "Description" IS NULL
OR "Quantity" IS NULL
OR "InvoiceDate" IS NULL
OR "UnitPrice" IS NULL
OR "CustomerID" IS NULL
OR "Country" IS NULL;

-- Update table- found nulls in Description and CustomerID --
Update public."Online_Retail"
SET "Description" = 'Unknown'
WHERE "Description" IS NULL;

-- Confirm nulls in Description have been updated to 'Unknown'- leave CustomerID as is --
SELECT * FROM public."Online_Retail"
WHERE "Description" IS NULL;

-- Check for duplicates --
SELECT "InvoiceNo",
	"StockCode",
	"Description",
	"Quantity",
	"InvoiceDate",
	"UnitPrice",
	"CustomerID",
	"Country",
	COUNT(*) AS "Duplicates"
FROM public."Online_Retail"
GROUP BY "InvoiceNo",
	"StockCode",
	"Description",
	"Quantity",
	"InvoiceDate",
	"UnitPrice",
	"CustomerID",
	"Country"
HAVING COUNT(*) > 1;

-- Create table with cleaned data --
CREATE TABLE public."Online_Retail_Clean" AS
	SELECT DISTINCT * FROM public."Online_Retail";

-- Check table has removed the duplicate rows --
SELECT COUNT(*)
FROM public."Online_Retail_Clean";

SELECT COUNT(*)
FROM public."Online_Retail";

-- Drop old table and keep cleaned one --
DROP TABLE public."Online_Retail";

ALTER TABLE public."Online_Retail_Clean" 
RENAME TO "Online_Retail";
