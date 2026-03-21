## ETL Decisions

### Decision 1 — Date Normalization and Standardization
**Problem:** The raw `retail_transactions.csv` contained inconsistent date formats, including `DD/MM/YYYY` (e.g., 29/08/2023), `DD-MM-YYYY` (e.g., 12-12-2023), and `YYYY-MM-DD` (e.g., 2023-02-05). Standard SQL databases cannot perform time-series analysis or sorting on mixed string formats.
**Resolution:** During the Transform phase, I standardized all dates to the ISO `YYYY-MM-DD` format. I also generated a numeric surrogate key `date_id` (in the format YYYYMMDD) for the `dim_date` table to ensure high-performance joins with the fact table.

### Decision 2 — Category Casing and Unification
**Problem:** The source data had inconsistent casing and naming for product categories. For instance, the same category appeared as both `electronics` (lowercase) and `Electronics` (Proper Case). Additionally, `Grocery` and `Groceries` were used interchangeably, which would lead to fragmented reporting in a `GROUP BY` query.
**Resolution:** I implemented a transformation rule to convert all category strings to Proper Case (`Electronics`). I also performed a mapping to unify `Grocery` into the plural `Groceries`. This ensures that all sales for these items are aggregated into a single, accurate category total.

### Decision 3 — Handling NULL Values in Geographic Data
**Problem:** The `store_city` column in the raw dataset contained several `NULL` or blank values, even when the `store_name` was clearly provided (e.g., 'Chennai Anna' had transactions where the city was missing). 
**Resolution:** I performed a "Master Data Lookup." Since the store names are unique and consistent, I mapped each `store_name` to its correct city (e.g., mapping all 'Chennai Anna' entries to 'Chennai') before loading the data into the `dim_store` dimension table. This fixed the referential integrity issues mentioned in the lecture.
