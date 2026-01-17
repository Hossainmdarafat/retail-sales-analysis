/* =========================
   Retail Sales Analysis - MySQL
   Table: superstore_clean
   Columns: `Order Date`, Segment, Market, Sales, Profit
   ========================= */

-- 0) Quick sanity checks
SELECT COUNT(*) AS total_rows
FROM superstore_clean;

SELECT 
  MIN(`Order Date`) AS min_date,
  MAX(`Order Date`) AS max_date
FROM superstore_clean;


-- 1) Total Sales & Total Profit
SELECT 
  ROUND(SUM(Sales), 2)  AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM superstore_clean;


-- 2) Profit by Market (ranking)
SELECT 
  Market,
  ROUND(SUM(Profit), 2) AS profit
FROM superstore_clean
GROUP BY Market
ORDER BY profit DESC;


-- 3) Profit by Segment (ranking)
SELECT 
  Segment,
  ROUND(SUM(Profit), 2) AS profit
FROM superstore_clean
GROUP BY Segment
ORDER BY profit DESC;


-- 4) Market × Segment (Pivot-style result)
SELECT 
  Market,
  Segment,
  ROUND(SUM(Profit), 2) AS profit
FROM superstore_clean
GROUP BY Market, Segment
ORDER BY Market, profit DESC;


-- 5) Year-wise Profit Trend
SELECT 
  YEAR(`Order Date`) AS year,
  ROUND(SUM(Profit), 2) AS profit
FROM superstore_clean
GROUP BY YEAR(`Order Date`)
ORDER BY year;


-- 6) Year + Market wise Profit
SELECT 
  YEAR(`Order Date`) AS year,
  Market,
  ROUND(SUM(Profit), 2) AS profit
FROM superstore_clean
GROUP BY YEAR(`Order Date`), Market
ORDER BY year, profit DESC;


-- 7) Year + Market + Segment wise Profit (Most detailed)
SELECT 
  YEAR(`Order Date`) AS year,
  Market,
  Segment,
  ROUND(SUM(Profit), 2) AS profit
FROM superstore_clean
GROUP BY YEAR(`Order Date`), Market, Segment
ORDER BY year, profit DESC;


-- 8) Filter example: Specific Market + Specific Year (e.g., APAC in 2013)
SELECT *
FROM superstore_clean
WHERE Market = 'APAC'
  AND YEAR(`Order Date`) = 2013;


-- 9) Segment-wise Profit for a specific Market + Year (APAC, 2013)
SELECT 
  Segment,
  ROUND(SUM(Profit), 2) AS profit
FROM superstore_clean
WHERE Market = 'APAC'
  AND YEAR(`Order Date`) = 2013
GROUP BY Segment
ORDER BY profit DESC;


-- 10) Loss analysis: how many loss-making orders + total loss
SELECT 
  COUNT(*) AS loss_orders,
  ROUND(SUM(Profit), 2) AS total_loss
FROM superstore_clean
WHERE Profit < 0;


-- 11) Loss analysis by Market (where losses are concentrated)
SELECT 
  Market,
  COUNT(*) AS loss_orders,
  ROUND(SUM(Profit), 2) AS total_loss
FROM superstore_clean
WHERE Profit < 0
GROUP BY Market
ORDER BY total_loss ASC;  -- ASC shows most negative first
