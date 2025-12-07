-- 08_load_dim_customer.sql
-- Load distinct customers from staging into dim_customer

TRUNCATE TABLE public.dim_customer;

INSERT INTO public.dim_customer (
    customer_id,
    customer_name,
    segment,
    city,
    state,
    postal_code,
    region,
    country
)
SELECT DISTINCT
    customer_id,
    customer_name,
    segment,
    city,
    state,
    postal_code,
    region,
    country
FROM public.stg_superstore
WHERE customer_id IS NOT NULL
ORDER BY customer_id;
