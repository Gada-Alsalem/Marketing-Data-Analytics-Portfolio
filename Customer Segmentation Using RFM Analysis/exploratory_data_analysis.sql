----- Exploratory analysis -----

-- What is total revenue --
SELECT SUM("Quantity"*"UnitPrice") AS "TotalSales"
FROM public."Online_Retail"
	WHERE "CustomerID" IS NOT NULL
		AND "InvoiceNo" NOT LIKE 'C%';

-- Total Sales by month- Use CTE and EXTRACT function to get month and create new column for total sales --
WITH "Total_Sales" AS (
	SELECT "InvoiceNo",
	"StockCode",
	"Description",
	"Quantity",
	EXTRACT('Month' FROM "InvoiceDate") AS "Month",
	"UnitPrice",
	"CustomerID",
	"Country",
	ROUND("Quantity" * "UnitPrice", 2) AS "TotalSales"
	FROM public."Online_Retail"
	WHERE "InvoiceNo" NOT LIKE 'C%'
)

SELECT 
	CASE
    WHEN "Month" = 1 THEN 'January'
    WHEN "Month" = 2 THEN 'February'
    WHEN "Month" = 3 THEN 'March'
    WHEN "Month" = 4 THEN 'April'
    WHEN "Month" = 5 THEN 'May'
    WHEN "Month" = 6 THEN 'June'
    WHEN "Month" = 7 THEN 'July'
    WHEN "Month" = 8 THEN 'August'
    WHEN "Month" = 9 THEN 'September'
    WHEN "Month" = 10 THEN 'October'
    WHEN "Month" = 11 THEN 'November'
    WHEN "Month" = 12 THEN 'December'
END AS "MonthName",
SUM("TotalSales") AS "TotalSales"
FROM "Total_Sales"
GROUP BY "Month";

-- How many individual orders total and out of all these orders how many were cancelled --
SELECT COUNT(DISTINCT "InvoiceNo") AS "TotalOrders", 
	(SELECT COUNT(DISTINCT "InvoiceNo")
		FROM public."Online_Retail"
		WHERE "InvoiceNo" LIKE 'C%')  AS "TotalOrdersCancelled"
FROM public."Online_Retail";

-- How many unique products do they offer --
SELECT COUNT(DISTINCT "StockCode") AS "ItemsOfferedTotal"
FROM public."Online_Retail";

-- What are the top 50 selling products in the UK --
SELECT "StockCode", "Description", "Country",
	SUM ("Quantity") AS "TotalUnitsSold"
FROM public."Online_Retail"
WHERE "InvoiceNo" NOT LIKE 'C%' AND "Country" = 'United Kingdom'
GROUP BY "StockCode", "Description", "Country"
ORDER BY "TotalUnitsSold" DESC
LIMIT 50;

-- What are the top 50 selling products internationally --
SELECT "StockCode", "Description", "Country",
	SUM ("Quantity") AS "TotalUnitsSold"
FROM public."Online_Retail"
WHERE "InvoiceNo" NOT LIKE 'C%' AND "Country" <> 'United Kingdom'
GROUP BY "StockCode", "Description", "Country"
ORDER BY "TotalUnitsSold" DESC
LIMIT 50;
