-- Customers Table
CREATE TABLE Customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- Products Table
CREATE TABLE Products (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- Sales Representatives Table
CREATE TABLE Sales_Reps (
    sales_rep_id VARCHAR(20) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address TEXT NOT NULL
);

-- Orders Table
CREATE TABLE Orders (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    sales_rep_id VARCHAR(20) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id)
);

-- Order Items Table
CREATE TABLE Order_Items (
    order_id VARCHAR(20),
    product_id VARCHAR(20),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Sample Data

INSERT INTO Customers VALUES
('C001','Rahul Sharma','rahul@email.com','Mumbai'),
('C002','Priya Mehta','priya@email.com','Delhi'),
('C003','Amit Joshi','amit@email.com','Mumbai'),
('C004','Neha Iyer','neha@email.com','Chennai'),
('C005','Arjun Verma','arjun@email.com','Pune');

INSERT INTO Products VALUES
('P001','Laptop','Electronics',55000),
('P002','Smartphone','Electronics',25000),
('P003','Shoes','Fashion',3000),
('P004','Watch','Accessories',7000),
('P005','Backpack','Fashion',2000);

INSERT INTO Sales_Reps VALUES
('S001','Raj Malhotra','raj@email.com','Mumbai Office'),
('S002','Sneha Kapoor','sneha@email.com','Delhi Office'),
('S003','Karan Patel','karan@email.com','Pune Office'),
('S004','Anita Nair','anita@email.com','Chennai Office'),
('S005','Vikas Singh','vikas@email.com','Mumbai HQ');

INSERT INTO Orders VALUES
('ORD1001','C001','S001','2024-01-10'),
('ORD1002','C002','S002','2024-01-11'),
('ORD1003','C003','S001','2024-01-12'),
('ORD1004','C004','S004','2024-01-13'),
('ORD1005','C005','S003','2024-01-14');

INSERT INTO Order_Items VALUES
('ORD1001','P001',1),
('ORD1002','P002',2),
('ORD1003','P003',3),
('ORD1004','P004',1),
('ORD1005','P005',2);
