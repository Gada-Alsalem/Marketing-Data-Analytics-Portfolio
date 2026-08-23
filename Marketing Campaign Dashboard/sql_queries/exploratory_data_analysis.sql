-- EXPLORATORY DATA ANALYSIS --
SELECT * FROM cleaned_daily_campaign_performance;

-- look at average impressions, clicks, conversions, spend and revenue for each campaign --
SELECT campaign_id, channel, 
	ROUND(AVG(impressions), 2) AS avg_impressions, 
	ROUND(AVG(clicks), 2) AS avg_clicks, 
	ROUND(AVG(conversions), 2) AS avg_conversions,
	ROUND(AVG(spend), 2) AS avg_spend,	
	ROUND(AVG(revenue), 2) AS avg_revenue
FROM cleaned_daily_campaign_performance
GROUP BY campaign_id, channel
ORDER BY campaign_id;

-- join campaigns table to daily campaign performance table to see campaign budgeting --
SELECT d.campaign_id,
	c.campaign_name,
	c.start_date,
	c.end_date,
	c.planned_budget,
	SUM(spend) AS total_spend,
	SUM(revenue) AS total_revenue,
	CASE WHEN c.planned_budget > SUM(spend) THEN 'Under Budget'
	WHEN sum(spend) > c.planned_budget THEN 'Over Budget' END AS spend_status
FROM cleaned_daily_campaign_performance AS d
JOIN campaigns AS c
ON d.campaign_id = c. campaign_id
GROUP BY d.campaign_id, c.campaign_name, c.planned_budget, c.start_date, c.end_date
ORDER BY d.campaign_id;

-- total orders and revenue per customer and acquisition channel --
SELECT customer_id, acquisition_channel,
	COUNT(DISTINCT order_id) AS total_orders,
	SUM(order_amount) AS total_revenue
FROM customer_orders
GROUP BY customer_id, acquisition_channel;



-- CAMPAIGN MEASURES --
-- calculating CTR, CPC, CV, ROAS, CAC --
SELECT campaign_id, 
	channel, 
	SUM(clicks) AS total_clicks, 
	SUM(impressions) AS total_impressions,
	SUM(spend) AS total_spend,
	SUM(conversions) AS total_conversions,
	SUM(revenue) AS total_revenue,
-- calculating CTR --
ROUND(SUM(clicks)::numeric/SUM(impressions)::numeric * 100, 2) AS click_through_rate,
-- calculating CPC --
ROUND(SUM(spend)::numeric/SUM(clicks)::numeric, 2) AS cost_per_click,
-- calculating CVR --
ROUND(SUM(conversions)::numeric/SUM(clicks)::numeric * 100, 2) AS conversion_rate,
-- calculating ROAS --
ROUND(SUM(revenue)::numeric/NULLIF(SUM(spend)::numeric, 0), 2) AS return_on_ad_spend,
-- calculating CAC --
ROUND(SUM(spend)::numeric/SUM(conversions)::numeric, 2) AS customer_acquisition_cost
FROM cleaned_daily_campaign_performance
GROUP BY campaign_id, channel
ORDER BY campaign_id;
