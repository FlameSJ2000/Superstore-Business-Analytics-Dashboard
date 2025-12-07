-- Table: public.dim_customer

-- DROP TABLE IF EXISTS public.dim_customer;

CREATE TABLE IF NOT EXISTS public.dim_customer
(
    customer_id character varying COLLATE pg_catalog."default" NOT NULL,
    customer_name character varying COLLATE pg_catalog."default",
    segment character varying COLLATE pg_catalog."default",
    city character varying COLLATE pg_catalog."default",
    state character varying COLLATE pg_catalog."default",
    postal_code character varying COLLATE pg_catalog."default",
    region character varying COLLATE pg_catalog."default",
    country character varying COLLATE pg_catalog."default",
    CONSTRAINT dim_customer_pkey PRIMARY KEY (customer_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_customer
    OWNER to postgres;