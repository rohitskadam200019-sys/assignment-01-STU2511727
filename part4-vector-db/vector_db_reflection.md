## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for the law firm's requirement. Keyword search works by matching exact words or phrases in the text, which can lead to missing important information if the wording in the contract differs from the user’s query. For example, a lawyer may search for "termination clauses," but the contract might use different wording such as "conditions for ending the agreement" or "contract cancellation terms." In such cases, a keyword-based system may fail to retrieve relevant results.

A vector database, on the other hand, uses embeddings to understand the semantic meaning of both the query and the documents. Instead of relying on exact word matches, it converts text into numerical vectors that capture the context and meaning of the content. This allows the system to identify similar concepts even when different words are used.

In this system, each section of the 500-page contracts would be converted into embeddings and stored in a vector database. When a lawyer enters a query in plain English, the system generates an embedding for that query and compares it with stored vectors using similarity measures such as cosine similarity. The most relevant sections are then retrieved and presented to the user.

Thus, a vector database plays a crucial role in enabling semantic search, making it far more effective than traditional keyword-based approaches for complex legal documents.
