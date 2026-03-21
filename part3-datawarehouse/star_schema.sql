-- Section 3.1: Star Schema Design

-- 1. Create Dimension Tables (Descriptive data)
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month_name VARCHAR(20),
    year INT
);

CREATE TABLE dim_store (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE dim_product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- 2. Create Fact Table (Numeric measures)
CREATE TABLE fact_sales (
    sale_id SERIAL PRIMARY KEY,
    date_id INT REFERENCES dim_date(date_id),
    store_id INT REFERENCES dim_store(store_id),
    product_id INT REFERENCES dim_product(product_id),
    units_sold INT,
    total_revenue DECIMAL(12, 2)
);

-- 3. INSERT Cleaned Sample Data (10 cleaned rows)
-- Data was cleaned by unifying date formats and correcting category casing.

INSERT INTO dim_date (date_id, full_date, month_name, year) VALUES
(20230829, '2023-08-29', 'August', 2023),
(20231212, '2023-12-12', 'December', 2023),
(20230205, '2023-02-05', 'February', 2023),
(20230220, '2023-02-20', 'February', 2023),
(20230115, '2023-01-15', 'January', 2023),
(20230809, '2023-08-09', 'August', 2023),
(20230331, '2023-03-31', 'March', 2023),
(20231026, '2023-10-26', 'October', 2023),
(20231208, '2023-12-08', 'December', 2023),
(20230815, '2023-08-15', 'August', 2023);

INSERT INTO dim_store (store_name, city) VALUES
('Chennai Anna', 'Chennai'),
('Delhi South', 'Delhi'),
('Bangalore MG', 'Bangalore'),
('Pune FC Road', 'Pune');

INSERT INTO dim_product (product_name, category) VALUES
('Speaker', 'Electronics'),
('Tablet', 'Electronics'),
('Phone', 'Electronics'),
('Smartwatch', 'Electronics'),
('Atta 10kg', 'Groceries'),
('Jeans', 'Clothing'),
('Biscuits', 'Groceries');

-- Note: Revenue is calculated as (units_sold * unit_price) from CSV
INSERT INTO fact_sales (date_id, store_id, product_id, units_sold, total_revenue) VALUES
(20230829, 1, 1, 3, 147788.34),
(20231212, 1, 2, 11, 255487.32),
(20230205, 1, 3, 20, 974067.80),
(20230220, 2, 2, 14, 325165.68),
(20230115, 1, 4, 10, 588510.10),
(20230809, 3, 5, 12, 629568.00),
(20230331, 4, 4, 6, 353106.06),
(20231026, 4, 6, 16, 37079.52),
(20231208, 3, 7, 9, 247229.91),
(20230815, 3, 4, 3, 176553.03);
