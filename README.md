📊 SQL Regional Sales Analysis
Overview

This project analyzes regional sales performance and customer purchasing behavior using structured SQL queries in MySQL. The objective is to translate transactional data into actionable business insights that support strategic decision-making.

Business Objectives

Identify top-performing geographic markets

Detect high-value customers and revenue concentration risk

Evaluate monthly sales trends and potential seasonality

Measure regional contribution to total sales volume

Understand average purchasing intensity per transaction

Dataset Assumptions

Tables Used:

orders(order_id, customer_id, order_date, units)

customers(customer_id, customer_name, region)

The dataset simulates a transactional sales environment where customer purchases are aggregated for performance evaluation.

Key Analyses Performed

1️⃣ Regional Performance Ranking

Determined which regions generate the highest total unit sales to guide market prioritization.

2️⃣ Top Customer Identification

Ranked top 5 customers by purchase volume to evaluate revenue concentration and retention opportunities.

3️⃣ Performance Threshold Filtering

Identified regions exceeding defined sales thresholds to highlight high-performing markets.

4️⃣ Monthly Sales Trend Analysis

Analyzed month-over-month unit totals to detect growth patterns and seasonality.

5️⃣ Average Order Size

Calculated average units per transaction to understand purchasing behavior.

6️⃣ Regional Share of Total Sales

Measured each region’s percentage contribution to overall sales volume to assess dependency risk.

Sample Query
SELECT
    c.region,
    SUM(o.units) AS total_units
FROM orders o
JOIN customers c
    ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY total_units DESC;
Skills Demonstrated

Relational Joins

Aggregation (SUM, COUNT, AVG)

Grouping & Filtering (GROUP BY, HAVING)

Business-Oriented Metric Design

Structured Analytical Query Writing

Tools Used

MySQL

SQL

Next Improvements

Future enhancements may include:

Window functions for advanced ranking

Customer segmentation logic

Profit margin simulation

Visualization layer integration
