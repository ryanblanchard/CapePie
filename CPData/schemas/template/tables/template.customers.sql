CREATE TABLE template.customers
(
    customer_id        INT          NOT NULL IDENTITY(1,1) CONSTRAINT template_customers_pk PRIMARY KEY,
    customer_full_name VARCHAR(100) NOT NULL CONSTRAINT template_customers_customer_name_ch CHECK (LEN(customer_full_name) > 0)
);
