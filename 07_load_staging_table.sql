-- 07_load_staging_table.sql
-- Load data from CSV into staging table

TRUNCATE TABLE public.stg_superstore;

COPY public.stg_superstore
FROM 'S:/BusinessAnalystProject/Dataset/train.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);
