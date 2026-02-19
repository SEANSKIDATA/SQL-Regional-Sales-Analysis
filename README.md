```sql
/*
=====================================================
SQL REGIONAL SALES ANALYSIS (MySQL)
Author: Sean Codner
Objective: Evaluate regional performance, top customers, and sales trends
Assumed Tables: orders, customers
=====================================================
*/

-- Assumed schema:
-- orders(order_id, customer_id, order_date, units)
-- customers(customer_id, customer_name, region)



-- =====================================================
-- 1) BUSINESS QUESTION:
-- Which region generates the highest total unit sales?
--
-- PURPOSE:
-- Identify top-performing geographic markets to prioritize
-- strategic investment and marketing allocation.
-- =====================================================

SELECT
    c.region,
    SUM(o.units) AS total_units
FROM orders o
JOIN customers c
    ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY total_units DESC;



-- =====================================================
-- 2) BUSINESS QUESTION:
-- Who are the top 5 customers by total purchase volume?
--
-- PURPOSE:
-- Detect high-value customers and assess potential
-- revenue concentration risk.
-- =====================================================

SELECT
    c.customer_name,
    SUM(o.units) AS total_units
FROM orders o
JOIN customers c
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_units DESC
LIMIT 5;



-- =====================================================
-- 3) BUSINESS QUESTION:
-- Which regions exceed 500 total units sold?
--
-- PURPOSE:
-- Identify markets that meet high-performance thresholds
-- for operational scaling decisions.
-- =====================================================

SELECT
    c.region,
    SUM(o.units) AS total_units
FROM orders o
JOIN customers c
    ON c.customer_id = o.customer_id
GROUP BY c.region
HAVING SUM(o.units) > 500
ORDER BY total_units DESC;



-- =====================================================
-- 4) BUSINESS QUESTION:
-- What does the monthly sales trend look like?
--
-- PURPOSE:
-- Detect seasonality patterns and performance shifts
-- over time.
-- =====================================================

SELECT
    order_month,
    SUM(units) AS total_units
FROM (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS order_month,
        units
    FROM orders
) t
GROUP BY order_month
ORDER BY order_month;




-- =====================================================
-- 5) BUSINESS QUESTION:
-- What is the average order size (units per order)?
--
-- PURPOSE:
-- Understand purchasing behavior and average transaction
-- intensity.
-- =====================================================

SELECT
    AVG(o.units) AS avg_units_per_order
FROM orders o;

-- =====================================================
-- 6) BUSINESS QUESTION:
-- What percent of total unit sales does each region contribute?
--
-- PURPOSE:
-- Quantify regional share of total volume to guide prioritization
-- and detect over-reliance on a single region.
-- =====================================================

SELECT
    c.region,
    SUM(o.units) AS total_units,
    ROUND(100 * SUM(o.units) / (SELECT SUM(units) FROM orders), 2) AS pct_of_total_units
FROM orders o
JOIN customers c
    ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY total_units DESC;




