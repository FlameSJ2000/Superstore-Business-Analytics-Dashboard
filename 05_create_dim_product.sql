-- Table: public.dim_product

-- DROP TABLE IF EXISTS public.dim_product;

CREATE TABLE IF NOT EXISTS public.dim_product
(
    product_id character varying COLLATE pg_catalog."default" NOT NULL,
    category character varying COLLATE pg_catalog."default",
    sub_category character varying COLLATE pg_catalog."default",
    product_name character varying COLLATE pg_catalog."default",
    CONSTRAINT dim_product_pkey PRIMARY KEY (product_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_product
    OWNER to postgres;