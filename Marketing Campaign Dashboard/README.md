## Business Problem and Goal:

 Flower Power, a US based fashion brand, runs marketing campaigns across six channels: paid search, paid social, email, display, affiliate and organic social. 
They want to see whether spend leads to a proportional increase in revenue across channels or if some channels are underperforming.

The aim of is to analyse campaign and channel performance using KPIs such as CTR, CPC, CVR, ROAS and CAC to inform how marketing budget should be redistributed in 2026.



## Questions:

- Which channels account for highest ROAS and which are underperforming?
- How should the budget be reallocated across channels to improve marketing ROI?



## The Dataset:

The datasets used were:
- A dimensional dataset containing 21 rows and 7 columns of campaigns that were running from Jan - Nov 2025. 
- A fact table tracking daily campaign performance for this period containing over 3000 rows and 8 columns.



## Approach:
1. Cleaned data using SQL to deal with duplicate values, nulls, inconsistent channel labelling.
2. Did exploratory data analysis to understand the data.
3. Imported data into Power BI and created DAX measures for each KPI.
4. Used data visualisation to see which campaigns are underperforming.



#### Tools Used:

  SQL (PostgreSQL) and Power BI

#### Techniques Used:

- Data cleaning
- Data aggregation
- CTE’s
- Joins
- CASE WHEN statements
- DAX measures
- Data modeling 




## Dashboard:
<img width="1192" height="686" alt="Screenshot 2026-08-20 at 19 08 21" src="https://github.com/user-attachments/assets/cfb32b8e-ee8f-4a1f-8b37-bffb0e0cbd53" />




## Key Findings:

- Flower Power has a healthy ROAS of 4.89 across all campaigns but a deeper dive shows that some campaigns perform worse than others.
- Email campaigns have consistently high ROAS (30-53x), followed by Affiliate (4.3-5.2x) and Paid Search (3.1-3.5x). Paid Social (0.81-1.6x) and Display (0.41-1.26x) fare worse on this metric both having campaigns that either lose money or just about break even.
- While the campaigns table suggests that the primary objective of the campaigns that are losing money is to raise awareness or consideration, perhaps a new creative approach to both of these channels could increase ROAS by reducing the steep drop off from impressions to clicks (CTR for these campaigns range from 0.4-1.3%).


## Recommendations:

- Continue Email, Paid Search and Affiliate campaigns as they are. They consistently deliver high ROAS and should remain prioritised in the budget.
  
  Potential improvements for Paid Social:
  - Improve targeted marketing across social media platforms to increase the likelihood of engagement.
  - Consider testing new creative approaches to build a connection with the customer.

  Potential improvements for Display:
  - Run A/B tests to see if a different Call To Action leads to higher CTR.
  - Reassess whether the Displays are placed in the appropriate locations as CTR is low enough to be concerned that there is an issue with targeting.

- Overall, if Paid Social and Display improvement strategies do not work, some of that budget should be reallocated to Email, Paid Search or Affiliate campaigns as these channels have already demonstrated a consistently high return per dollar spent.



## Next Steps:

- Before reallocating the budget, trial the above steps (new creative approach and A/B testing) for a set period and compare whether it has made a meaningful difference. If effective, carry on with the new marketing strategies.
- If not, reduce spend on the underperforming campaigns and reallocate to Email, Paid Search and Affiliate. Then monitor for a period to see if this change actually improves overall ROAS or only makes a marginal difference.
