-- Database Setup & Data Preparation

create database 
Inventory_stock_managemant;

Drop tables demand_forecasting,inventory_monitoring;

alter table demand_forecasting modify Date_ date, modify store_id int,
modify Price_ int,modify Promotions_ varchar(255), modify Seasonality_Factors varchar(255)
,modify External_Factors varchar(255), modify Demand_Trend varchar(255),modify Customer_Segments varchar(255);

alter table inventory_monitoring rename column ï»¿Product_ID to Product_ID;

alter table inventory_monitoring modify Expiry_Date date;

-- Duplicate Checks
SELECT
    Product_ID,
    Store_ID,
    COUNT(*) AS cnt
FROM inventory_monitoring
GROUP BY Product_ID, Store_ID
HAVING cnt > 1;

-- Duplicate Checks
select  store_id, count(product_id) as prd_by_store  
from inventory_monitoring group by store_id having prd_by_store > 1 ;

-- Check row counts
SELECT COUNT(*) FROM demand_forecasting;
SELECT COUNT(*) FROM inventory_monitoring;
SELECT COUNT(*) FROM pricing_optimization;

-- Check invalid values
select * from 
inventory_monitoring where Stock_Levels <1;

-- Check Zero values
SELECT *
FROM pricing_optimization
WHERE Price_ <= 0;

-- Check Zero values
SELECT *
FROM demand_forecasting
WHERE Sales_Quantity <= 0;

-- Business Questions

-- 1. which are the top sold products?
Select product_id, Sum(Sales_Quantity) total_sales  
from demand_forecasting group by product_id order by total_sales desc;

-- 2. which are the top 5 best selling product?
Select product_id, Sum(Sales_Quantity) Top_5_product  
from demand_forecasting group by product_id order by Top_5_product desc limit 5;

-- 3. Do promotions increase sales? -
Select Promotions_,AVG(Sales_Quantity) AS Avg_Sales
 from demand_forecasting group by Promotions_;

-- 4. which are top 10 Stores as per sales ?
select store_id, sum(Sales_Quantity) Total_sales  from 
demand_forecasting group by store_id order by Total_sales desc limit 10;

-- 5. Which customer segment contributes the most sales?
 select Customer_Segments, sum(Sales_Quantity) Total_sales from demand_forecasting
 group by Customer_Segments order by Total_sales desc;
 
-- 6. Which customer segment generates the highest revenue?
select 
Customer_Segments, sum(Sales_Quantity * price_) as Revenue from demand_forecasting 
group by Customer_Segments order by Revenue desc;

-- 7. Which products gain the most sales during promotions?
-- Business Insight - These products should be prioritized in future marketing campaigns
select 
Product_ID, Promotions_,
Sum(Sales_Quantity) as Total_sales from demand_forecasting
group by Product_ID, Promotions_ order by Total_sales desc; 

-- 8. Which season generates the highest average sales?
select Seasonality_Factors, avg(Sales_Quantity) as avg_sales from 
demand_forecasting group by Seasonality_Factors order by avg_sales desc;

-- 9. Which season generates the highest revenue?
select Seasonality_Factors, sum(Sales_Quantity * Price_) as Revenue 
from demand_forecasting group by Seasonality_Factors order by Revenue desc;

-- 10. How do external factors affect sales?
select External_Factors, avg(Sales_Quantity) as avg_sales 
from demand_forecasting group by External_Factors order by avg_sales desc;

-- 11. Which products are below the reorder point?
select * from inventory_monitoring where 
Stock_Levels < Reorder_Point;

-- 12. Which products have the lowest stock levels?
select product_id,Stock_Levels from 
inventory_monitoring order by Stock_Levels limit 10;

-- 13. Which products have the highest stock levels? 
select product_id,Stock_Levels from 
inventory_monitoring order by Stock_Levels desc limit 10;

-- 14. Which stores have the highest stockout frequency?
select store_id, avg(Stockout_Frequency) avg_stockout from inventory_monitoring
group by store_id order by avg_stockout desc;

-- 15. Which products have the highest stockout frequency?
SELECT Product_ID,avg(Stockout_Frequency) Avg_Stockout
FROM inventory_monitoring group by Product_ID
ORDER BY Avg_Stockout desc;

-- 16. Which products have the longest supplier lead times?
select Product_ID , Supplier_Lead_Time_ from inventory_monitoring
order by Supplier_Lead_Time_ desc;

 -- 17. Which stores have the largest warehouse capacity?
 select Store_ID, Warehouse_Capacity
 from inventory_monitoring  order by Warehouse_Capacity desc;
 
 -- 18. Which products are closest to expiry?
select Product_ID, Expiry_Date from 
inventory_monitoring order by Expiry_Date;

-- 19. Which stores have the slowest fulfilment times?
select Store_ID, avg(Order_Fulfillment_Time) avg_time from 
inventory_monitoring group by Store_ID  order by avg_time desc;

-- 20. Does longer supplier lead time increase stockout frequency?
select Supplier_Lead_Time_, avg(Stockout_Frequency) as avg_Stockout_Frequency from inventory_monitoring
group by Supplier_Lead_Time_ order by Supplier_Lead_Time_;

-- 21 Which products have the highest return rates?
select Product_ID , Return_Rate_ from pricing_optimization order by Return_Rate_ desc;

-- 22. Which products have the lowest return rates?
select Product_ID,
Return_Rate_ from pricing_optimization order by Return_Rate_ ;

-- 23. Which products have the highest discounts?
SELECT Product_ID, Discounts_
FROM pricing_optimization ORDER BY Discounts_ DESC;

-- 24. Do discounts increase sales volume?
select Discounts_, avg(Sales_Volume)  avg_sales from  pricing_optimization
group by Discounts_ order by Discounts_;

-- 25. Which products are priced above competitors?
select * from pricing_optimization 
where Price_ > Competitor_Prices;

-- 26. Which products are priced below competitors?
select * from pricing_optimization 
where Price_ < Competitor_Prices;

-- 27. Which products have the highest storage costs?
select Product_ID, Storage_Cost from pricing_optimization 
order by Storage_Cost DESC;

-- 28. Which products have the best customer reviews?
select Product_ID,Customer_Reviews from pricing_optimization
order by Customer_Reviews DESC;

-- 29. Which products are most price-sensitive?
select Product_ID,Elasticity_Index from pricing_optimization
order by Elasticity_Index DESC;

-- 30. Which products combine high sales volume and low return rates?
select product_id, avg(Sales_Volume) as avg_sales, avg(Return_Rate_) as avg_returns 
from pricing_optimization group by product_id order by avg_sales desc,avg_returns asc;

-- 31. Which products have high stock levels but low demand?
select i.Product_ID,
avg(i.Stock_Levels) as Avg_Stock,
SUM(d.Sales_Quantity) as Total_Demand
from inventory_monitoring i JOIN demand_forecasting d
ON i.Product_ID = d.Product_ID
and i.Store_ID = d.Store_ID
group by i.Product_ID
order by Avg_Stock DESC;

-- 32. Which products generate the most revenue and what is their rank?
with product_revenue AS (
select
Product_ID,
SUM(Sales_Quantity * Price_) AS Revenue
FROM demand_forecasting GROUP BY Product_ID
)
select *,
dense_rank() over(order by Revenue DESC) AS Revenue_Rank
from product_revenue;

-- 33. Which are the top 3 selling products in every store?
With product_sales as(
select Store_ID, Product_ID , sum(sales_Quantity) as total_sales
from demand_forecasting group by store_id, Product_ID) -- here i created a temp_table 
select * from (
select *,row_number() over(partition by Store_ID
order by Total_Sales DESC
) rn from product_sales
) x -- this is also a table but not made of cte
WHERE rn <= 3; -- condition 

-- 34. How much revenue does each customer segment contribute?
WITH segment_revenue AS (
select Customer_Segments, SUM(Sales_Quantity * Price_) AS Revenue
from demand_forecasting
group by Customer_Segments
)
select *, ROUND(Revenue * 100.0 /
SUM(Revenue) over(),2
) AS Revenue_Percentage
from segment_revenue;

-- 35. Which products should be replenished first?
WITH replenishment AS (
select Product_ID, Stock_Levels,
Reorder_Point,Stockout_Frequency,
(Reorder_Point - Stock_Levels) AS Shortage
FROM inventory_monitoring
WHERE Stock_Levels < Reorder_Point
)
select *,
ROW_NUMBER() over(
order by Shortage DESC,
Stockout_Frequency DESC
) AS Priority_Rank
from replenishment;






Use Inventory_stock_managemant;
select * from demand_forecasting;
select * from inventory_monitoring;
select * from pricing_optimization;
