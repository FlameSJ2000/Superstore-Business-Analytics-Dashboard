-- Table: public.dim_date

-- DROP TABLE IF EXISTS public.dim_date;

CREATE TABLE IF NOT EXISTS public.dim_date
(
    date_key date NOT NULL,
    year integer,
    month integer,
    month_name character varying COLLATE pg_catalog."default",
    quarter integer,
    CONSTRAINT dim_date_pkey PRIMARY KEY (date_key)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_date
    OWNER to postgres;