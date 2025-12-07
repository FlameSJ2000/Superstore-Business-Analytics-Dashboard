-- 11_load_fact_sales.sql
-- Load fact table from staging

TRUNCATE TABLE public.fact_sales;

INSERT INTO public.fact_sales (
    row_id,
    order_id,
    order_date,
    ship_date,
    customer_id,
    product_id,
    sales,
    quantity,
    discount,
    profit
)
SELECT
    row_id,
    order_id,
    -- ถ้า fact_sales.order_date เป็น INT date_key ให้ใช้ TO_CHAR ด้านล่าง
    -- ถ้าเป็น DATE ธรรมดา จะใช้ order_date ตรง ๆ ก็ได้
    TO_CHAR(order_date, 'YYYYMMDD')::int AS order_date,
    TO_CHAR(ship_date,  'YYYYMMDD')::int AS ship_date,
    customer_id,
    product_id,
    sales,
    quantity,
    discount,
    profit
FROM public.stg_superstore
ORDER BY row_id;
