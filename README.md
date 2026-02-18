# sql-regional-sales-analysis
A simulated retail sales dataset was analyzed to evaluate regional performance and customer concentration using SQL.


## Project Overview
This SQL case study analyzes regional sales performance for a retail business.  
The objective is to evaluate geographic revenue distribution, identify high-value customers, and assess overall sales trends using structured query techniques.

---

## Business Questions
- Which region generates the highest total unit sales?
- Who are the top 5 customers by purchase volume?
- Are there regions exceeding 500 total units sold?
- What does the monthly sales trend look like?
- What is the average order size?

---

## Dataset Structure

### orders
- order_id
- customer_id
- order_date
- units

### customers
- customer_id
- customer_name
- region

---

## SQL Techniques Used
- INNER JOIN
- GROUP BY
- HAVING
- ORDER BY
- Aggregate Functions (SUM, AVG)
- LIMIT
- Date-based grouping

---

## Sample Query

```sql
SELECT c.region,
       SUM(o.units) AS total_units
FROM orders o
JOIN customers c
    ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY total_units DESC;
```

---
## Key Insights

- The highest-performing region accounts for a disproportionate share of total unit sales.
- The top 5 customers contribute a significant percentage of total volume, indicating potential concentration risk.
- Monthly aggregation reveals identifiable seasonal fluctuations.
- Regions exceeding 500 total units represent priority markets for strategic focus.

---

## Skills Demonstrated

- Translating business questions into SQL queries
- Writing efficient multi-table JOINs
- Using aggregations for performance analysis
- Applying HAVING filters for threshold evaluation
- Presenting analytical findings in a structured format

