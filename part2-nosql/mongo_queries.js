// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    "product_id": "E-1001",
    "name": "Gaming Monitor 24-inch",
    "category": "Electronics",
    "price": 25000,
    "specs": { "warranty": "2 Years", "voltage": "240V" },
    "tags": ["4K", "144Hz"]
  },
  {
    "product_id": "C-2002",
    "name": "Premium Cotton Hoodie",
    "category": "Clothing",
    "price": 4500,
    "details": { "material": "100% Cotton", "sizes": ["S", "M", "L"] }
  },
  {
    "product_id": "G-3003",
    "name": "Greek Almond Yogurt",
    "category": "Groceries",
    "price": 180,
    "expiry_info": { "expiry_date": "2024-12-25" }
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({ 
    "category": "Electronics", 
    "price": { "$gt": 20000 } 
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
// Note: We use dot notation to reach inside the 'expiry_info' nested object
db.products.find({ 
    "category": "Groceries", 
    "expiry_info.expiry_date": { "$lt": "2025-01-01" } 
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
    { "product_id": "C-2002" },
    { "$set": { "discount_percent": 15 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ "category": 1 });
/* EXPLANATION: Creating an index on the 'category' field improves query performance. 
Instead of scanning every document in the collection (a Collection Scan), 
MongoDB can use the index to jump directly to the relevant documents, 
making searches much faster as the dataset grows.
*/
