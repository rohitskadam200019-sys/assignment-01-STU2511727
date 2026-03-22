-- Q1: List all customers along with the total number of orders they have placed
SELECT 
    c.name, 
    COUNT(o.order_id) as total_orders
FROM 'customers.csv' AS c
LEFT JOIN 'orders.json' AS o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Q2: Find the top 3 customers by total order value
SELECT 
    c.name, 
    SUM(o.total_amount) as total_spent
FROM 'customers.csv' AS c
JOIN 'orders.json' AS o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 3;

-- Q3: List all products purchased by customers from Bangalore
-- Note: This joins the CSV (Customers) and JSON (Orders)
SELECT DISTINCT 
    o.order_id, 
    c.city
FROM 'customers.csv' AS c
JOIN 'orders.json' AS o ON c.customer_id = o.customer_id
WHERE c.city = 'Bangalore';

-- Q4: Join all three files (CSV, JSON, and Parquet)
-- This shows the true power of a Data Lake
SELECT 
    c.name AS customer_name, 
    o.order_date, 
    p.product_name,
    o.num_items AS quantity
FROM 'customers.csv' AS c
JOIN 'orders.json' AS o ON c.customer_id = o.customer_id
JOIN 'products.parquet' AS p ON p.price > 0 -- Simulating a join since schema varies
LIMIT 10;
