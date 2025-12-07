-- Table: public.fact_sales

-- DROP TABLE IF EXISTS public.fact_sales;

CREATE TABLE IF NOT EXISTS public.fact_sales
(
    row_id integer NOT NULL,
    order_id character varying COLLATE pg_catalog."default",
    order_date date,
    ship_date date,
    ship_mode character varying COLLATE pg_catalog."default",
    customer_id character varying COLLATE pg_catalog."default",
    product_id character varying COLLATE pg_catalog."default",
    sales numeric,
    CONSTRAINT fact_sales_pkey PRIMARY KEY (row_id),
    CONSTRAINT fk_customer FOREIGN KEY (customer_id)
        REFERENCES public.dim_customer (customer_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_order_date FOREIGN KEY (order_date)
        REFERENCES public.dim_date (date_key) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_product FOREIGN KEY (product_id)
        REFERENCES public.dim_product (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.fact_sales
    OWNER to postgres;