CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    country VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1,'John','Smith','john.smith@email.com','USA','2023-01-15'),
(2,'Maria','Papadopoulos','maria.p@email.com','Greece','2023-02-10'),
(3,'Liam','Brown','liam.b@email.com','UK','2023-03-05'),
(4,'Anna','Keller','anna.k@email.com','Germany','2023-04-12'),
(5,'Nikos','Ioannou','nikos.i@email.com','Greece','2023-05-20'),
(6,'Sofia','Rossi','sofia.r@email.com','Italy','2023-06-02');

INSERT INTO products VALUES
(1,'Laptop Pro 15','Electronics',1200.00),
(2,'Wireless Mouse','Electronics',25.00),
(3,'Office Chair','Furniture',180.00),
(4,'Water Bottle','Accessories',15.00),
(5,'Smartphone X','Electronics',900.00),
(6,'Notebook Pack','Stationery',12.00);

INSERT INTO orders VALUES
(1,1,'2024-01-10',1225.00),
(2,2,'2024-01-12',195.00),
(3,3,'2024-02-01',900.00),
(4,2,'2024-02-15',40.00),
(5,5,'2024-03-03',1215.00),
(6,1,'2024-03-10',180.00),
(7,6,'2024-03-18',27.00);

INSERT INTO order_items VALUES
(1,1,1,1),
(2,1,2,1),
(3,2,3,1),
(4,2,4,1),
(5,3,5,1),
(6,4,2,1),
(7,4,4,1),
(8,5,1,1),
(9,5,4,1),
(10,6,3,1),
(11,7,2,1),
(12,7,6,1);


