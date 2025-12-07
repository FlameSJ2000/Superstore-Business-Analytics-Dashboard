-- 12_analysis_queries.sql
-- Analysis queries for Superstore Business Analytics Project
-- Database: superstore_analytics (PostgreSQL)
-- Schema: public
-- ------------------------------------------------------------


-- 1) High-level KPIs (Total Sales, Total Orders, Total Customers, AOV)
-- ------------------------------------------------------------
SELECT
    SUM(f.sales)                         AS total_sales,
    COUNT(DISTINCT f.order_id)           AS total_orders,
    COUNT(DISTINCT f.customer_id)        AS total_customers,
    ROUND(SUM(f.sales) * 1.0
          / NULLIF(COUNT(DISTINCT f.order_id), 0), 2) AS avg_order_value
FROM public.fact_sales AS f;


-- 2) Monthly Sales Trend (for line chart)
-- ------------------------------------------------------------
SELECT
    d.year,
    d.month,
    d.month_name,
    SUM(f.sales) AS total_sales
FROM public.fact_sales AS f
JOIN public.dim_date AS d
    ON f.order_date = d.date_key
GROUP BY d.year, d.month, d.month_name
ORDER BY d.year, d.month;


-- 3) Sales by Category and Sub-Category
-- ------------------------------------------------------------
SELECT
    p.category,
    p.sub_category,
    SUM(f.sales) AS total_sales,
    COUNT(DISTINCT f.order_id) AS total_orders
FROM public.fact_sales AS f
JOIN public.dim_product AS p
    ON f.product_id = p.product_id
GROUP BY p.category, p.sub_category
ORDER BY p.category, total_sales DESC;


-- 4) Sales by Customer Segment
-- ------------------------------------------------------------
SELECT
    c.segment,
    SUM(f.sales) AS total_sales,
    COUNT(DISTINCT f.order_id) AS total_orders,
    COUNT(DISTINCT f.customer_id) AS unique_customers
FROM public.fact_sales AS f
JOIN public.dim_customer AS c
    ON f.customer_id = c.customer_id
GROUP BY c.segment
ORDER BY total_sales DESC;


-- 5) Top 10 Products by Sales
-- ------------------------------------------------------------
SELECT
    p.product_id,
    p.product_name,
    p.sub_category,
    p.category,
    SUM(f.sales) AS total_sales,
    COUNT(DISTINCT f.order_id) AS total_orders
FROM public.fact_sales AS f
JOIN public.dim_product AS p
    ON f.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.sub_category, p.category
ORDER BY total_sales DESC
LIMIT 10;


-- 6) Top 10 Customers by Sales
-- ------------------------------------------------------------
SELECT
    c.customer_id,
    c.customer_name,
    c.segment,
    c.city,
    c.state,
    c.region,
    SUM(f.sales) AS total_sales,
    COUNT(DISTINCT f.order_id) AS total_orders
FROM public.fact_sales AS f
JOIN public.dim_customer AS c
    ON f.customer_id = c.customer_id
GROUP BY
    c.customer_id, c.customer_name, c.segment,
    c.city, c.state, c.region
ORDER BY total_sales DESC
LIMIT 10;


-- 7) Regional Performance (Sales by Region)
-- ------------------------------------------------------------
SELECT
    c.region,
    SUM(f.sales) AS total_sales,
    COUNT(DISTINCT f.order_id) AS total_orders,
    COUNT(DISTINCT f.customer_id) AS unique_customers
FROM public.fact_sales AS f
JOIN public.dim_customer AS c
    ON f.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_sales DESC;


-- 8) Sales by Ship Mode
-- ------------------------------------------------------------
SELECT
    f.ship_mode,
    SUM(f.sales) AS total_sales,
    COUNT(DISTINCT f.order_id) AS total_orders
FROM public.fact_sales AS f
GROUP BY f.ship_mode
ORDER BY total_sales DESC;


-- 9) Yearly Sales and YoY Growth
-- ------------------------------------------------------------
-- Note: Uses window function LAG to calculate YoY % growth.
SELECT
    d.year,
    SUM(f.sales) AS total_sales,
    LAG(SUM(f.sales)) OVER (ORDER BY d.year) AS last_year_sales,
    ROUND(
        (SUM(f.sales) - LAG(SUM(f.sales)) OVER (ORDER BY d.year))
        / NULLIF(LAG(SUM(f.sales)) OVER (ORDER BY d.year), 0) * 100.0
    , 2) AS yoy_growth_pct
FROM public.fact_sales AS f
JOIN public.dim_date AS d
    ON f.order_date = d.date_key     
GROUP BY d.year
ORDER BY d.year;


-- 10) Monthly Sales by Segment (for stacked charts)
-- ------------------------------------------------------------
SELECT
    d.year,
    d.month,
    d.month_name,
    c.segment,
    SUM(f.sales) AS total_sales
FROM public.fact_sales AS f
JOIN public.dim_date AS d
    ON f.order_date = d.date_key
JOIN public.dim_customer AS c
    ON f.customer_id = c.customer_id
GROUP BY d.year, d.month, d.month_name, c.segment
ORDER BY d.year, d.month, c.segment;

-- 11) Category Contribution (% of Total Sales)
-- ------------------------------------------------------------
WITH category_sales AS (
    SELECT
        p.category,
        SUM(f.sales) AS total_sales
    FROM public.fact_sales AS f
    JOIN public.dim_product AS p
        ON f.product_id = p.product_id
    GROUP BY p.category
),
total AS (
    SELECT SUM(total_sales) AS grand_total
    FROM category_sales
)
SELECT
    c.category,
    c.total_sales,
    ROUND(c.total_sales / t.grand_total * 100.0, 2) AS pct_of_total_sales
FROM category_sales AS c
CROSS JOIN total AS t
ORDER BY c.total_sales DESC;