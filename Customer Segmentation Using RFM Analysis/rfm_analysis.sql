-- RFM Segmentation --
WITH "RFM" AS (
	SELECT "CustomerID",
		DATE '2011-12-10' - MAX("InvoiceDate")::DATE AS "Recency",
		COUNT(DISTINCT "InvoiceNo") AS "Frequency",
		SUM("Quantity" * "UnitPrice") AS "Monetary"
	FROM public."Online_Retail"
	WHERE "CustomerID" IS NOT NULL
		AND "InvoiceNo" NOT LIKE 'C%'
	GROUP BY "CustomerID"
),

"Scores" AS (
	SELECT *,
    NTILE(5) OVER (ORDER BY "Recency" DESC) AS "R_Score",   -- lowest recency → bucket 5
    NTILE(5) OVER (ORDER BY "Frequency" ASC) AS "F_Score",  -- highest frequency → bucket 5
    NTILE(5) OVER (ORDER BY "Monetary" ASC) AS "M_Score"    -- highest spend → bucket 5
FROM "RFM"
)
SELECT *,
	CONCAT("R_Score", "F_Score", "M_Score") AS "RFM_Combined",
	CASE WHEN "R_Score" >= 4 AND "F_Score" >= 4 AND "M_Score" >= 4 THEN 'Champions'
	WHEN "R_Score" >= 3 AND "F_Score" >= 3 AND "M_Score" >= 3 THEN 'Loyal Customers'
	WHEN "R_Score" >= 4 AND "F_Score" = 1 THEN 'New Customers'
	WHEN "R_Score" <= 2 AND "F_Score" >= 4 THEN 'At Risk'
	WHEN "R_Score" = 1 AND "F_Score" = 1 THEN 'Lost'
	ELSE 'Average' END AS "CustomerSegment"
FROM "Scores"
