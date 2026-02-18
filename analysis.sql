/*
====================================================
SQL REGIONAL SALES ANALYSIS
Author: Sean Codner
Project: Regional Sales Performance Case Study
====================================================
*/

-- ================================================
-- 1. TOTAL UNITS SOLD BY REGION
-- ================================================

SELECT 
    c.region,
    SUM(o.units) AS total_units
FROM orders o
JOIN customers c
    ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY total_units DESC;


-- ================================================
-- 2. TOP 5 CUSTOMERS BY TOTAL PURCHASE VOLUME
-- ================================================

SELECT 
    c.customer_name,
    SUM(o.units) AS total_units
FROM orders o
JOIN customers c
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_units DESC
LIMIT 5;


-- ================================================
-- 3. REGIONS EXCEEDING 500 TOTAL UNITS
-- ================================================

SELECT 
    c.region,
    SUM(o.units) AS total_units
FROM orders o
JOIN customers c
    ON c.customer_id = o.customer_id
GROUP BY c.region
HAVING SUM(o.units) > 500
ORDER BY total_units DESC;


-- ================================================
-- 4. MONTHLY SALES TREND
-- ================================================

SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
    SUM(o.units) AS total_units
FROM orders o
GROUP BY order_month
ORDER BY order_month;


-- ================================================
-- 5. AVERAGE ORDER SIZE
-- ================================================

SELECT 
    AVG(units) AS average_order_size
FROM orders;
