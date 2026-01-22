# E-Commerce SQL Analytics: Revenue, Retention & Customer Insights

## 📌 Project Overview

This project analyzes an e-commerce platform using **SQL Server** to uncover insights related to **revenue growth, customer retention, cohort behavior, and customer lifetime value (CLV)**.

The objective is to simulate **real-world data analyst work** by answering business questions using advanced SQL concepts such as **CTEs, window functions, cohort analysis, views, and indexing**.

---

## 🎯 Business Objectives

- Analyze monthly revenue trends and growth
- Understand new vs repeat customer behavior
- Measure customer retention using cohort analysis
- Identify high-value customers and products
- Provide actionable, data-driven business insights

---

## 🗂️ Dataset Description

The dataset represents a simplified e-commerce system and was **synthetically generated** to simulate real-world scenarios.

### Tables Used

- **customers** – customer signup information
- **orders** – order-level transaction data
- **order_items** – product-level order details
- **products** – product catalog information

---

## 🛠️ Tools & Technologies

- **Database:** SQL Server
- **Language:** SQL
- **Concepts Used:**

  - CTEs (Common Table Expressions)
  - Window Functions (`LAG`, `ROW_NUMBER`)
  - Cohort & retention analysis
  - Views for reusable logic
  - Indexes for performance optimization
  - Aggregations and joins

---

## 📊 Key Analyses Performed

### 1. Revenue & Growth Analysis

- Monthly revenue trends
- Month-over-Month (MoM) revenue growth

### 2. Customer Analysis

- New vs repeat customers by month
- Average Order Value (AOV)
- Customer Lifetime Value (CLV)

### 3. Cohort & Retention Analysis

- Customer cohorts based on first purchase month
- Retention tracking by cohort and month number
- Identification of early churn patterns

### 4. Product Performance

- Top products by revenue contribution
- Category-level revenue insights

---

## 🧱 Views Created

To improve **readability, reuse, and maintainability**, analysis logic was refactored into views:

- `vw_order_details`
- `vw_customer_first_order`
- `vw_monthly_revenue`
- `vw_new_vs_repeat_customers`
- `vw_customer_lifetime_value`

---

## 📈 Key Business Insights

- Revenue growth is **driven primarily by repeat customers**, not new acquisitions
- Customer retention drops significantly after the **first month**
- A small segment of customers contributes a **large share of total revenue**
- A few top products account for most sales (Pareto effect)
- Improving early retention can significantly increase long-term revenue

---

## 🧠 Recommendations

- Focus on **first-month engagement and onboarding**
- Invest in **retention strategies** (loyalty programs, personalized offers)
- Target **high-CLV customers** with premium campaigns
- Prioritize marketing and inventory for top-performing products

---

## ▶️ How to Run This Project

1. Create tables using `schema.sql`
2. Insert data using `sample_data.sql`
3. Run analysis queries from `analysis_queries.sql`
4. Create views using `views.sql`

---

## 📌 Project Outcome

This project demonstrates the ability to:

- Translate business questions into SQL queries
- Use advanced SQL Server features effectively
- Communicate insights in a business-friendly manner
- Build production-style, maintainable analytics solutions

---
