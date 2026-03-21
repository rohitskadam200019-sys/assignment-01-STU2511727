## Anomaly Analysis

### Insert Anomaly
In the dataset, product-related columns such as product_id, product_name, category, and unit_price are stored only when an order exists (linked with order_id). For example, in Row 0 (order_id = ORD1027), product details are recorded along with an order. This means a new product cannot be inserted into the system unless a corresponding order is created. If a new product is introduced but not yet ordered, it cannot be stored in the table.

### Update Anomaly
Product information such as unit_price is repeated across multiple rows for the same product_id. For example, the same product_id appears in Row 0 (ORD1027), Row 10 (ORD1162), and Row 13 (ORD1133). If the unit_price of this product changes, all these rows must be updated. If even one row is missed, it will result in inconsistent data where the same product has different prices.

### Delete Anomaly
Customer information such as customer_id, customer_name, customer_email, and customer_city is stored together with order data. For example, if a row like Row 0 (order_id = ORD1027) is deleted and that is the only order for that customer, then all customer details will also be lost. This results in unintended deletion of important customer information.
