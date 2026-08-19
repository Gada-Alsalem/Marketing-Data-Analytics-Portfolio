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
