-- 09_load_dim_product.sql
-- Load distinct products from staging into dim_product

TRUNCATE TABLE public.dim_product;

INSERT INTO public.dim_product (
    product_id,
    product_name,
    sub_category,
    category
)
SELECT DISTINCT
    product_id,
    product_name,
    sub_category,
    category
FROM public.stg_superstore
WHERE product_id IS NOT NULL
ORDER BY product_id;
