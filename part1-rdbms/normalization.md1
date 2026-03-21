## Anomaly Analysis

* **Insert Anomaly**: In `orders_flat.csv`, all data is tied to an `order_id`. If the company hires a new Sales Representative (e.g., **SR06**) and we want to store their name and email, we cannot do so until they make their first sale. We cannot leave `order_id` (Column A) null, so the representative's information cannot exist in the system without an order.

* **Update Anomaly**: The Sales Representative **Deepak Joshi (SR01)** has his `office_address` (Column O) recorded inconsistently. In **Row 2** (ORD1114), the address is "Mumbai HQ, Nariman Point, Mumbai - 400021", but in **Row 38** (ORD1176), it is abbreviated to "Mumbai HQ, Nariman Pt, Mumbai - 400021". To update his address correctly, we would have to find and change every single row where he appears, or risk having conflicting data.

* **Delete Anomaly**: The product **'Eraser' (P008)** in Column G appears only once in the entire dataset, in **Row 44** (ORD1043). If we delete this specific order record, we also accidentally delete all information about the product itself—including its name, category, and `unit_price` (Column I). We lose the product from our catalog simply by deleting a transaction.

## Normalization Justification
## Normalization Justification

While a single flat table like `orders_flat.csv` may appear simpler for initial data entry, the manager’s argument that normalization is "over-engineering" falls apart when considering long-term data integrity and operational efficiency. Using the provided dataset, we can clearly see that a denormalized structure creates a "maintenance nightmare" rather than simplicity.

For example, the Sales Representative **Deepak Joshi (SR01)** appears in over 80 rows. In a flat file, his office address must be typed manually every single time. As evidenced in the dataset, this led to an inconsistency where his address is spelled as "Nariman Point" in Row 2 but abbreviated to "Nariman Pt" in Row 38. If the manager’s "simple" table contains thousands of rows, fixing a single typo or updating a phone number becomes a massive manual task prone to human error. In a normalized 3NF schema, we store the address exactly **once** in a `SalesReps` table. An update there instantly reflects across all related orders, ensuring a "Single Source of Truth."

Furthermore, the flat-file approach prevents the business from performing basic administrative tasks. We cannot add a new product to our catalog (like a 'Keyboard') without inventing a fake order for it, nor can we store a new customer's details until they make a purchase. Conversely, if we delete a cancelled order for the 'Eraser' (P008), we accidentally wipe that product's entire existence from our system. 

Normalization to 3NF is not over-engineering; it is a necessary architectural standard. It protects the business from data corruption, saves storage space by eliminating redundancy, and allows the database to scale as the company grows from 100 orders to 100,000.
