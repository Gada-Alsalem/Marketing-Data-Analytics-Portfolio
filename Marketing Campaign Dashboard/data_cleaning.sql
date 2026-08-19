-- DATA CLEANING --
-- check for duplicate rows (found 27)--
SELECT date, campaign_id, channel, impressions, clicks, spend, conversions, revenue, COUNT(*) AS duplicates
FROM daily_campaign_performance
GROUP BY date, campaign_id, channel, impressions, clicks, spend, conversions, revenue
HAVING COUNT(*) > 1;

-- check channels are named consistently (they were not) --
SELECT channel, COUNT(*)
FROM daily_campaign_performance
GROUP BY channel
ORDER BY COUNT(*) DESC;

-- check for null values (found 50 in spend)
SELECT * 
FROM daily_campaign_performance
WHERE date IS NULL
OR campaign_id IS NULL
OR channel IS NULL
OR impressions IS NULL
OR clicks IS NULL
OR spend IS NULL
OR conversions IS NULL
OR revenue IS NULL;

-- create cleaned table using cte's --
CREATE TABLE cleaned_daily_campaign_performance AS
WITH cleaned_channels AS (
	SELECT date, campaign_id,
		CASE WHEN TRIM(channel) IN ('Paid-Search', 'PPC', 'paid search') THEN 'Paid Search'
		WHEN TRIM(channel) IN ('Social Paid', 'paid_social', 'paid social') THEN 'Paid Social'
		WHEN TRIM(channel) IN ('EMAIL', 'e-mail') THEN 'Email'
		WHEN TRIM(channel) IN ('Display Ads', 'DISPLAY', 'display ads') THEN 'Display'
		WHEN TRIM(channel) IN ('affiliates', 'Affiliate') THEN 'Affiliate'
		WHEN TRIM(channel) IN ('organic social', 'Organic-Social') THEN 'Organic Social'
		ELSE TRIM(channel)
		END AS channel_clean,
		impressions, clicks, spend, conversions, revenue
	FROM daily_campaign_performance
	),
	
-- removing duplicate rows from cleaned_channels -- 
removed_duplicates AS (
	SELECT DISTINCT * 
	FROM cleaned_channels
	),

-- using the average of campaign_id as estimation for nulls in spend --
fixed_spend_nulls AS (
	SELECT *,
	COALESCE(spend, ROUND(AVG(spend) OVER(PARTITION BY campaign_id), 2)) AS spend_clean,
	CASE WHEN spend IS NULL THEN TRUE WHEN spend IS NOT NULL THEN FALSE
	END AS spend_estimated
	FROM removed_duplicates
)
-- cleaned table:--
SELECT date,
	campaign_id,
	channel_clean AS channel,
	impressions,
	clicks,
	spend_clean AS spend,
	spend_estimated,
	conversions,
	revenue
	FROM fixed_spend_nulls;
