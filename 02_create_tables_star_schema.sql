CREATE TABLE dim_customer (
    customer_id   VARCHAR PRIMARY KEY,
    customer_name VARCHAR,
    segment       VARCHAR,
    city          VARCHAR,
    state         VARCHAR,
    postal_code   VARCHAR,
    region        VARCHAR,
    country       VARCHAR
);

CREATE TABLE dim_product (
    product_id   VARCHAR PRIMARY KEY,
    category     VARCHAR,
    sub_category VARCHAR,
    product_name VARCHAR
);

CREATE TABLE dim_date (
    date_key    DATE PRIMARY KEY,
    year        INT,
    month       INT,
    month_name  VARCHAR,
    quarter     INT
);

CREATE TABLE fact_sales (
    row_id      INT PRIMARY KEY,
    order_id    VARCHAR,
    order_date  DATE,
    ship_date   DATE,
    ship_mode   VARCHAR,
    customer_id VARCHAR,
    product_id  VARCHAR,
    sales       NUMERIC,

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    CONSTRAINT fk_product
        FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    CONSTRAINT fk_order_date
        FOREIGN KEY (order_date) REFERENCES dim_date(date_key)
);
