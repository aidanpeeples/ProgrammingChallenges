--Question 1
SELECT date, sum(impressions) as 'Daily Impressions'
FROM marketing_data
GROUP BY date;

--Question 2
SELECT state, revenue
FROM website_revenue
ORDER BY revenue DESC
LIMIT 3;

--Question 3
SELECT campaign_info.name, SUM(marketing_data.cost) AS 'Total Cost', SUM(marketing_data.impressions) AS 'Total Impressions', SUM(marketing_data.clicks) as 'Total Clicks', SUM(website_revenue.revenue) AS 'Total Revenue'
FROM campaign_info JOIN marketing_data ON campaign_info.id = marketing_data.campaign_id
JOIN website_revenue ON campaign_info.id = website_revenue.campaign_id
GROUP BY name;

--Question 4
SELECT campaign_info.name, marketing_data.geo, marketing_data.conversions
FROM campaign_info JOIN marketing_data ON campaign_info.id = marketing_data.campaign_id
WHERE campaign_info.name = 'Campaign5'
GROUP BY marketing_data.geo;

--Ohio generated the most conversions for Campaign5

--Question 5
SELECT campaign_info.name, (SUM(website_revenue.revenue) /  SUM(marketing_data.conversions)) AS 'Revenue / Conversions'
FROM campaign_info JOIN marketing_data ON campaign_info.id = marketing_data.campaign_id
JOIN website_revenue ON campaign_info.id = website_revenue.campaign_id
GROUP BY name;
--I utilzied this query to determine cost per conversion to base my decision on which campaign was most efficient. There are many different ways to determine the efficiency of an ad this is simply
--the method I chose. After running this query I determinned that Campaign 2 was most successful, providing a revenue to conversion rate of 17.07. Campaign 3, which I determinned to be the largest
--had, by far, the most revneue but its revenue to conversion rate was the highest at 31.06.

--Question 6, BONUS
SELECT FORMAT(CAST(date AS 'Day of Week'), 'ddd'), conversions
FROM marketing_data
GROUP BY FORMAT(CAST(date AS 'Day of Week'), 'ddd');

--Unfortunately I encountered some difficulties attempting to parse the entire date into a weekday. 
