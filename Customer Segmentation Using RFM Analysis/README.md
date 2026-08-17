__Business Problem and Goal:__

  The marketing team for GiftsForAll, a UK based online retailer selling occasion gifts, wants to shift from a generalised marketing strategy across its customer base to a targeted segment approach. They need to reprioritise their marketing expenditures to avoid overspending on low-value customers and underinvesting in high-value ones.
      
  Aim is to reprioritise marketing expenditure in upcoming year by employing targeted strategies across customer segments to improve marketing ROI.



__Questions:__

Who are our most valuable customers?

 What strategies should be implemented to market to each segment?
 
How should next years’ marketing budget be allocated?



__The Dataset:__

  Transactional dataset containing 8 columns and 540,000+ rows.
  Covers the period 01-12-2010 to 09-12-2011. 
  The majority of their customers are wholesalers.



__Approach:__
1. Cleaned data to deal with duplicate values and nulls.
2. Did exploratory data analysis to understand the data.
3. Scored each customer a value between 1 and 5 for RFM analysis on each metric (recency, frequency, and monetary).
4. Used CASE WHEN statements to organise each customer into one of six segments.



__Tools Used:__

  SQL and Power BI



__Dashboard:__
<img width="1248" height="721" alt="Screenshot 2026-08-16 at 18 55 31" src="https://github.com/user-attachments/assets/cb4d93e3-9027-4499-a655-381d5ea56616" />



__Key Findings:__

  Our ‘Champions’ segment makes up the majority of sales (5.7M) despite only comprising 21.5% of customers. They vastly overtake all other segments in quantity of orders as well.
  
  ‘Loyal Customers’ similarly make up 18.48% of all segments. While the visuals  suggest they lean much closer to our ‘Average’ customer in terms of sales and orders, their per customer value is significantly higher at 1.85K compared to 0.52K.
  
  Our ‘At Risk’ customers only make up 6.8% of total customers compared to the ‘Average’ segment at 41.32% yet are responsible for 550K in sales which is over half of our ‘Average’ segment at 930K. 
  
  ‘New Customers’ are our smallest segment at 3.2% which is to be expected and our ‘Lost’ segment is also a minority at 8.62% but further research should be done to understand why they churned and if the reason is a cause for concern.
  


__Recommendations:__

Concentrate marketing budget allocations to our ‘Champions’, ‘Loyal Customers’ and ‘At Risk’ segments with dedicated marketing strategy for each group. 

Plan out targeted segment-based marketing campaigns for upcoming year.

‘Champions’ ⟶ Exclusive early access to new products especially for holiday seasons, thank you messages

‘Loyal Customers’ ⟶ Incentivise to order by suggesting similar products, bulk order discounts 

‘At Risk’ ⟶ Win-back strategy, reactivation emails, limited time discount, free shipping

‘New Customers’ ⟶ One-time second order discount, onboarding email of top products 

‘Lost’ ⟶ No paid marketing

‘Average’ ⟶ Further analysis needed. Currently the largest segment yet only accounts for 10% of sales. 

Further investigate whether customers are individuals or wholesalers and segment both groups separately.



__Limitations and Next Steps:__

Data limitations: nearly 1M in sales cannot be attributed to any segment due to large amount of null values in the Customer ID field.

Wholesaler vs Individual: more research needs to be done to measure what percentage of customers are wholesalers vs individuals as they have different behavioural patterns and individuals could be misrepresented as less valuable because wholesalers over-inflate the ‘Champions’ category. 

‘Average’ segment limitations: turned out to be largest segment yet does not provide clear insights instead acts more as a dump for miscellaneous customers that don’t fit other categories. This potentially could be eased by answering wholesaler vs individual question.

Investigate churn reasons: why have 8.62% of customers fallen into our ‘Lost’ segment?
