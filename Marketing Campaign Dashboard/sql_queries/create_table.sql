-- CREATE TABLES --
CREATE TABLE daily_campaign_performance (date date,
										campaign_id text,
										channel text,
										impressions integer,
										clicks integer,
										spend numeric,
										conversions integer,
										revenue numeric);

-- confirm csv was imported --
SELECT * FROM daily_campaign_performance;



CREATE TABLE campaigns (campaign_id text,
						campaign_name text,
						channel text,
						objective text,
						start_date date,
						end_date date,
						planned_budget integer);

SELECT * FROM campaigns;



CREATE TABLE customer_orders (order_id text,
								customer_id text,
								order_date date,
								acquisition_channel text,
								order_amount numeric);

SELECT * FROM customer_orders;
