# Retail Inventory Intelligence System

https://github.com/user-attachments/assets/83985520-a35a-4d40-a24e-9855cdc8dfea

## Project Overview

The Retail Inventory Intelligence System is an end-to-end analytics project developed using SQL and Python to analyze retail inventory performance, demand patterns, and pricing strategies.

The project aims to help businesses make data-driven decisions by identifying sales trends, inventory risks, stockout patterns, pricing opportunities, and operational inefficiencies.

Using demand forecasting, inventory monitoring, and pricing optimization datasets, this project provides actionable insights to improve inventory planning and overall supply chain performance.

---

## Business Problem

Retail businesses often face challenges such as:

- Inventory shortages (Stockouts)
- Excess inventory holding costs
- Inefficient warehouse utilization
- Pricing competitiveness issues
- High product return rates
- Seasonal demand fluctuations

This project addresses these challenges by analyzing inventory, demand, and pricing data to uncover business opportunities and operational risks.

---

## Datasets Used

### 1. Demand Forecasting Dataset

Contains information related to product sales and demand.

Columns:

- Product_ID
- Date
- Store_ID
- Sales_Quantity
- Price
- Promotions
- Seasonality Factors
- External Factors
- Demand Trend
- Customer Segments

Total Records: 10,000+

---

### 2. Inventory Monitoring Dataset

Contains inventory and supply chain information.

Columns:

- Product_ID
- Store_ID
- Stock_Levels
- Supplier_Lead_Time_Days
- Stockout_Frequency
- Reorder_Point
- Expiry_Date
- Warehouse_Capacity
- Order_Fulfillment_Time_Days

Total Records: 10,000+

---

### 3. Pricing Optimization Dataset

Contains pricing and customer-related metrics.

Columns:

- Product_ID
- Store_ID
- Price
- Competitor_Prices
- Discounts
- Sales_Volume
- Customer_Reviews
- Return_Rate
- Storage_Cost
- Elasticity_Index

Total Records: 10,000+

---

## Tools & Technologies

### Database

- MySQL

### Programming Language

- Python

### Libraries

- Pandas
- NumPy
- Matplotlib
- MySQL Connector

### SQL Concepts

- Joins
- Aggregations
- CTEs
- Window Functions
- Ranking Functions
- Data Validation Queries

---

## SQL Analysis

The project includes extensive SQL analysis across demand, inventory, and pricing datasets.

### Demand Analysis

- Top-selling products
- Top-performing stores
- Promotion effectiveness
- Revenue by customer segment
- Seasonal sales analysis
- External factor impact assessment

### Inventory Analysis

- Products below reorder point
- Stockout frequency analysis
- Warehouse capacity evaluation
- Supplier lead time assessment
- Order fulfillment analysis

### Pricing Analysis

- Return rate analysis
- Customer review analysis
- Price competitiveness analysis
- Discount effectiveness analysis
- Elasticity analysis

### Advanced SQL

The project also includes:

- Common Table Expressions (CTEs)
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- NTILE()
- Running Totals
- Business Ranking Models

---

## Key Performance Indicators (KPIs)

The following business KPIs were developed:

1. Revenue Analysis
2. Inventory Risk Analysis
3. Price Difference Analysis
4. Inventory Coverage Analysis
5. Stockout Risk Analysis
6. Return Rate Analysis
7. Warehouse Capacity Utilization Analysis
8. Procurement Lead Time Analysis
9. Order Fulfillment Time Analysis
10. Customer Review Analysis
11. Discount Impact Analysis

---

## Data Visualizations

The project contains multiple visualizations including:

- Top 10 Products by Sales
- Revenue by Customer Segment
- Promotion Impact on Sales
- Seasonal Sales Analysis
- Monthly Return Rate Analysis
- Top 10 Products by Revenue
- Lead Time vs Stockout Frequency
- Customer Reviews vs Return Rate
- Price Competitiveness Analysis
- Correlation Analysis

---

## Key Findings

- Budget customers generated the highest overall sales volume.
- Promotions positively influenced sales performance.
- Sales demand varied significantly across seasons.
- Several products operated below their reorder threshold.
- Products with longer supplier lead times showed greater stockout risk.
- A small number of products generated a large percentage of total revenue.
- Return rates were concentrated among specific products.
- Inventory risk was observed across selected products and stores.
- Customer reviews showed a noticeable relationship with product returns.
- Pricing remained competitive across most products.

---

## Recommendations

1. Prioritize replenishment for products below the reorder point.

2. Increase safety stock levels for products with longer supplier lead times.

3. Review products with high return rates and investigate possible quality issues.

4. Continue targeted promotional campaigns that show strong sales impact.

5. Allocate additional inventory before high-demand seasons.

6. Focus inventory planning on top revenue-generating products.

7. Monitor inventory risk products regularly to reduce stockout occurrences.

---

## Project Structure

```text
Retail-Inventory-Intelligence-System
│
├── datasets
│   ├── demand_forecasting.csv
│   ├── inventory_monitoring.csv
│   └── pricing_optimization.csv
│
├── SQL
│   ├── 01_database_setup.sql
│   ├── 02_demand_analysis.sql
│   ├── 03_inventory_analysis.sql
│   ├── 04_pricing_analysis.sql
│   └── 05_advanced_analysis.sql
│
├── Notebook
│   └── Retail_Inventory_Intelligence_System.ipynb
│
└── README.md
```

---

## Conclusion

The Retail Inventory Intelligence System demonstrates how SQL and Python can be used together to solve real-world inventory and supply chain problems.

The project provides actionable insights into product demand, inventory performance, supplier efficiency, pricing competitiveness, and customer behavior, helping organizations improve operational decision-making and inventory optimization.

---

### Author

**Lucky Meshram**

Data Analytics | SQL | Python | Business Intelligence
