1. Which customer segment generates the highest revenue?

SELECT Customer_Segments,
       SUM(Sales_Quantity * Price_) AS Revenue
FROM demand_forecasting
GROUP BY Customer_Segments
ORDER BY Revenue DESC;



