## Storage Systems

The system uses multiple storage solutions, each aligned with a specific goal. For predicting patient readmission risk, a Relational Database (OLTP) is used to store structured patient records such as treatments, diagnoses, and admissions. This ensures data consistency and supports real-time updates. For generating monthly reports like bed occupancy and department-wise costs, a Data Warehouse (OLAP) is used. It aggregates historical data and supports analytical queries efficiently.

To handle real-time ICU monitoring data, a Data Lake is used along with a streaming buffer (e.g., Kafka). This allows ingestion of high-volume, unstructured time-series data such as vitals without strict schema constraints. For enabling doctors to query patient history in plain English, a Vector Database is used. Text data from medical records is converted into embeddings using an NLP model and stored in the vector database, enabling semantic search rather than keyword-based matching.

This combination ensures that each type of workload—transactional, analytical, streaming, and semantic search—is handled by the most suitable storage system.

## OLTP vs OLAP Boundary

The OLTP system consists of the Relational Database where real-time patient data is stored and updated. This includes patient details, treatment records, and ongoing hospital operations. It is optimized for fast inserts, updates, and queries related to individual records.

The boundary between OLTP and OLAP occurs at the point where data is extracted from the relational database and loaded into the Data Warehouse through ETL processes. Once data enters the Data Warehouse, it becomes part of the analytical system. The OLAP layer is used for reporting, trend analysis, and decision-making by hospital management.

In this design, the OLTP system handles day-to-day operations, while the OLAP system supports long-term insights and reporting. This separation improves performance and prevents analytical queries from affecting transactional workloads.

## Trade-offs

One significant trade-off in this design is the increased system complexity due to the use of multiple storage systems (Relational DB, Data Warehouse, Data Lake, and Vector Database). While each system is optimized for a specific task, managing data consistency and synchronization across these systems can be challenging.

To mitigate this, a well-defined data pipeline is implemented using batch and streaming ingestion processes. ETL workflows ensure that data is consistently transferred from OLTP to OLAP systems. Additionally, using centralized data governance and monitoring tools can help track data flow and detect inconsistencies.

Although this architecture requires more effort to maintain, it provides better scalability, flexibility, and performance compared to a single unified system.
