
-- TO get the monthly_revenue
CREATE OR ALTER VIEW vw_monthly_revenue_growth AS
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




--Base Order Detail View
CREATE OR ALTER VIEW vw_order_details AS
SELECT
  o.order_id,
  o.customer_id,
  o.order_date,
  DATEFROMPARTS(YEAR(o.order_date), MONTH(o.order_date), 1) AS order_month,
  oi.product_id,
  p.product_name,
  p.category,
  oi.quantity,
  oi.price,
  oi.quantity * oi.price AS item_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;



--2️⃣ Customer First Order View
CREATE OR ALTER VIEW vw_customer_first_order AS
SELECT
  customer_id,
  MIN(order_date) AS first_order_date,
  DATEFROMPARTS(YEAR(MIN(order_date)), MONTH(MIN(order_date)), 1) AS cohort_month
FROM orders
GROUP BY customer_id;

--3️⃣ Monthly Revenue View
CREATE OR ALTER VIEW vw_monthly_revenue AS
SELECT
  DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1) AS [month],
  SUM(order_value) AS revenue
FROM orders
GROUP BY
  DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1);


-- Customer Lifetime Value View
CREATE OR ALTER VIEW vw_customer_lifetime_value AS
SELECT
  customer_id,
  SUM(order_value) AS lifetime_value,
  COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;




SELECT * FROM vw_monthly_revenue_growth;

SELECT * FROM vw_order_details
SELECT * FROM vw_customer_first_order
SELECT * FROM vw_monthly_revenue
SELECT * FROM vw_customer_lifetime_value