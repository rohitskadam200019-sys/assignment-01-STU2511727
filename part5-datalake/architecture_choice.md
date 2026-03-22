# Part 5.2 — Architecture Recommendation

## Architecture Recommendation

For a fast-growing food delivery startup managing a diverse mix of GPS location logs, customer text reviews, payment transactions, and restaurant menu images, I recommend a **Data Lakehouse** architecture (such as Databricks or AWS Lake Formation). A Lakehouse effectively bridges the gap between the flexible storage of a Data Lake and the structured analytical power of a Data Warehouse.

There are three specific reasons for this choice:

1. **Multimodal Data Support:** The startup deals with "Unstructured" data (images and GPS logs) alongside "Structured" data (transactions). A Lakehouse allows us to store these diverse formats in a single low-cost storage layer (like S3 or Azure Blob) while still providing a schema layer for SQL querying.

2. **Unified Analytics and Machine Learning:** Text reviews and restaurant images require Machine Learning (ML) for sentiment analysis and categorization. Unlike a traditional Data Warehouse, which is strictly for SQL, a Lakehouse allows data scientists to run Python/ML models and data analysts to run SQL queries on the exact same data simultaneously.

3. **Cost-Efficient Scalability:** GPS logs generate massive volumes of data every second. Storing this "Cold" data in a Data Warehouse would be prohibitively expensive. A Lakehouse keeps the bulk of the data in inexpensive storage and only uses high-performance compute when a query is actually running, making it the most financialy viable option for a growing startup.
