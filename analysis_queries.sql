--1 Monthly Revenue & Growth

WITH monthly_revenue AS (
  SELECT
    DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1) AS [month],
    SUM(order_value) AS revenue
  FROM orders
  GROUP BY
    DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1)
)
SELECT
  [month],
  revenue,
  ROUND(
    (revenue - LAG(revenue) OVER (ORDER BY [month])) * 100.0
    / LAG(revenue) OVER (ORDER BY [month]), 2
  ) AS mom_growth_percent
FROM monthly_revenue;



--2️ New vs Repeat Customers
WITH first_orders AS (
  SELECT
    customer_id,
    MIN(order_date) AS first_order_date
  FROM orders
  GROUP BY customer_id
)
SELECT
  DATEFROMPARTS(YEAR(o.order_date), MONTH(o.order_date), 1) AS [month],
  COUNT(DISTINCT CASE
    WHEN o.order_date = f.first_order_date THEN o.customer_id
  END) AS new_customers,
  COUNT(DISTINCT CASE
    WHEN o.order_date > f.first_order_date THEN o.customer_id
  END) AS repeat_customers
FROM orders o
JOIN first_orders f
  ON o.customer_id = f.customer_id
GROUP BY
  DATEFROMPARTS(YEAR(o.order_date), MONTH(o.order_date), 1)
ORDER BY
  [month];



--3 Customer Cohort & Retention Analysis 
WITH cohorts AS (
  SELECT
    customer_id,
    DATEFROMPARTS(YEAR(MIN(order_date)), MONTH(MIN(order_date)), 1) AS cohort_month
  FROM orders
  GROUP BY customer_id
),
activity AS (
  SELECT
    o.customer_id,
    c.cohort_month,
    DATEFROMPARTS(YEAR(o.order_date), MONTH(o.order_date), 1) AS order_month
  FROM orders o
  JOIN cohorts c
    ON o.customer_id = c.customer_id
)
SELECT
  cohort_month,
  DATEDIFF(MONTH, cohort_month, order_month) AS month_number,
  COUNT(DISTINCT customer_id) AS active_customers
FROM activity
GROUP BY
  cohort_month,
  DATEDIFF(MONTH, cohort_month, order_month)
ORDER BY
  cohort_month,
  month_number;



--4 Average Order Value (AOV) Trend
SELECT
  DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1) AS [month],
  ROUND(SUM(order_value) * 1.0 / COUNT(order_id), 2) AS avg_order_value
FROM orders
GROUP BY
  DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1)
ORDER BY
  [month];



--5️ Top Products by Revenue
SELECT TOP 10
  p.product_name,
  SUM(oi.quantity * oi.price) AS total_revenue
FROM order_items oi
JOIN products p
  ON oi.product_id = p.product_id
GROUP BY
  p.product_name
ORDER BY
  total_revenue DESC;




--6️ Customer Lifetime Value (CLV – SQL Logic)
SELECT
  customer_id,
  ROUND(SUM(order_value), 2) AS lifetime_value
FROM orders
GROUP BY
  customer_id
ORDER BY
  lifetime_value DESC;




