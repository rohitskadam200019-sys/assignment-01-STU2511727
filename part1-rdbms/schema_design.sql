-- Q1.2: Schema Design
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) UNIQUE NOT NULL,
    customer_city VARCHAR(50)
);

CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price INTEGER NOT NULL
);

CREATE TABLE SalesReps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) UNIQUE NOT NULL,
    office_address TEXT
);

CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) REFERENCES Customers(customer_id),
    product_id VARCHAR(10) REFERENCES Products(product_id),
    sales_rep_id VARCHAR(10) REFERENCES SalesReps(sales_rep_id),
    quantity INTEGER NOT NULL,
    order_date DATE NOT NULL
);

-- Insert 5 rows per table
INSERT INTO Customers VALUES ('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'), ('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'), ('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'), ('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'), ('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');
INSERT INTO Products VALUES ('P001', 'Laptop', 'Electronics', 55000), ('P002', 'Mouse', 'Electronics', 800), ('P003', 'Desk Chair', 'Furniture', 8500), ('P004', 'Notebook', 'Stationery', 120), ('P005', 'Headphones', 'Electronics', 3200);
INSERT INTO SalesReps VALUES ('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ'), ('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office'), ('SR03', 'Ravi Kumar', 'ravi@corp.com', 'Bangalore Office'), ('SR04', 'Suresh Raina', 'suresh@corp.com', 'Chennai Branch'), ('SR05', 'Meera Nair', 'meera@corp.com', 'Hyderabad Hub');
INSERT INTO Orders VALUES ('ORD1001', 'C001', 'P001', 'SR01', 1, '2023-01-15'), ('ORD1002', 'C002', 'P005', 'SR02', 1, '2023-01-17'), ('ORD1003', 'C003', 'P003', 'SR03', 2, '2023-01-20'), ('ORD1004', 'C004', 'P004', 'SR01', 10, '2023-01-22'), ('ORD1005', 'C005', 'P002', 'SR01', 3, '2023-01-25');
