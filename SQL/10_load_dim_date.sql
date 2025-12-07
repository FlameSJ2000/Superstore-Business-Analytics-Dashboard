-- 10_load_dim_date.sql
-- Build date dimension from order_date + ship_date

TRUNCATE TABLE public.dim_date;

WITH all_dates AS (
    SELECT DISTINCT order_date AS d
    FROM public.stg_superstore
    WHERE order_date IS NOT NULL

    UNION

    SELECT DISTINCT ship_date AS d
    FROM public.stg_superstore
    WHERE ship_date IS NOT NULL
)
INSERT INTO public.dim_date (
    date_key,
    date,
    year,
    quarter,
    month,
    month_name
)
SELECT
    TO_CHAR(d, 'YYYYMMDD')::int                AS date_key,
    d::date                                     AS date,
    EXTRACT(YEAR    FROM d)::int               AS year,
    EXTRACT(QUARTER FROM d)::int               AS quarter,
    EXTRACT(MONTH   FROM d)::int               AS month,
    TO_CHAR(d, 'Mon')                          AS month_name
FROM all_dates
ORDER BY date;
