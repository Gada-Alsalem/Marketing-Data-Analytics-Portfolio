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
