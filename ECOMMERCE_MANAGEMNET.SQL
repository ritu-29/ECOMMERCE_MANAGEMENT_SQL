CREATE DATABASE E_COMMERCE;
USE E_COMMERCE;

-- create tables 
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    stock_quantity INT,
    added_date DATE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(200),
    registration_date DATE
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(20),
    payment_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Shipping (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    shipping_date DATE,
    delivery_date DATE,
    shipping_status VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Insert values 
INSERT INTO Categories VALUES
(1,'Electronics'),
(2,'Clothing'),
(3,'Books'),
(4,'Home'),
(5,'Toys');

INSERT INTO Products VALUES
(1,'Mobile',1,15000,50,'2024-01-10'),
(2,'Laptop',1,55000,20,'2024-02-05'),
(3,'T-Shirt',2,500,100,'2024-01-15'),
(4,'Jeans',2,1200,60,'2024-02-20'),
(5,'Novel',3,300,80,'2024-03-01'),
(6,'Cookware Set',4,2500,30,'2024-01-25'),
(7,'Toy bike',5,900,40,'2024-02-10'),
(8,'BhagvatGeeta',3,1800,60,'2024-02-20');

INSERT INTO Customers VALUES
(1,'Rahul Sharma','rahul@gmail.com','9876543210','Ahmedabad','2022-05-10'),
(2,'Priya Patel','priya@gmail.com','9876543211','Surat','2023-01-15'),
(3,'Amit Verma','amit@gmail.com','9876543212','Vadodara','2021-07-20'),
(4,'Neha Singh','neha@gmail.com','9876543213','Rajkot','2024-03-01'),
(5,'Karan Mehta','karan@gmail.com','9876543214','Mumbai','2023-11-05'),
(6,'Riya Desai','riya@gmail.com','9876543215','Pune','2022-08-18'),
(7,'Arjun Shah','arjun@gmail.com','9876543216','Delhi','2024-01-10'),
(8,'Simran Kaur','simran@gmail.com','9876543217','Chandigarh','2022-12-25'),
(9,'Mohit Jain','mohit@gmail.com','9876543218','Indore','2023-06-30'),
(10,'Pooja Nair','pooja@gmaul.com','9876543219','Kochi','2021-09-12');

INSERT INTO Orders VALUES
(1,1,'2024-01-10',15500,'Delivered'),
(2,2,'2024-02-05',55000,'Shipped'),
(3,3,'2023-12-15',300,'Cancelled'),
(4,4,'2024-03-10',1200,'Pending'),
(5,5,'2024-01-20',2500,'Delivered'),
(6,6,'2024-02-25',900,'Delivered'),
(7,7,'2024-03-01',15000,'Pending'),
(8,8,'2023-11-15',500,'Delivered'),
(9,9,'2024-01-30',300,'Cancelled'),
(10,10,'2024-02-10',55000,'Delivered'),
(12, 1, '2024-03-22', 3000, 'Delivered'),
(13, 1, '2024-03-23', 4500, 'Delivered'),
(14, 1, '2024-03-24', 2000, 'Pending');

INSERT INTO Order_Items VALUES
(1,1,1,1,15000),
(2,1,5,1,500),
(3,2,2,1,55000),
(4,3,5,1,300),
(5,4,4,1,1200),
(6,5,6,1,2500),
(7,6,7,1,900),
(8,7,1,1,15000),
(9,8,3,1,500),
(10,10,2,1,55000);

INSERT INTO Payments VALUES
(1,1,'2024-01-10','UPI','Paid'),
(2,2,'2024-02-05','Credit Card','Paid'),
(3,3,'2023-12-15','UPI','Failed'),
(4,4,'2024-03-10','PayPal','Pending'),
(5,5,'2024-01-20','Credit Card','Paid'),
(6,6,'2024-02-25','UPI','Paid'),
(7,7,'2024-03-01','UPI','Pending'),
(8,8,'2023-11-15','Credit Card','Paid'),
(9,9,'2024-01-30','PayPal','Failed'),
(10,10,'2024-02-10','Credit Card','Paid');

INSERT INTO Shipping VALUES
(1,1,'2024-01-11','2024-01-15','Delivered'),
(2,2,'2024-02-06',NULL,'In Transit'),
(3,4,'2024-03-11',NULL,'Dispatched'),
(4,5,'2024-01-21','2024-01-25','Delivered'),
(5,6,'2024-02-26','2024-03-01','Delivered');

SELECT * FROM Categories;

SELECT * FROM Products;

SELECT * FROM Customers;

SELECT * FROM Orders;

SELECT * FROM Order_Items;

SELECT * FROM Payments;

SELECT * FROM Shipping;

-- CRUD
-- INSERT new product
INSERT INTO Products VALUES 
(9, 'Headphones', 1, 2000, 25, '2024-03-15');
SELECT * FROM Products;

-- INSERT new customer
INSERT INTO Customers VALUES 
(11, 'Ritu Rao', 'ritu@gmail.com', '9876500000', 'Jaipur', '2024-03-20');
SELECT * FROM Customers;

-- INSERT new order
INSERT INTO Orders VALUES 
(11, 11, '2024-03-21', 2000, 'Pending');
SELECT * FROM Orders;

-- UPDATE stock when order is placed 
UPDATE Products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;
SELECT * FROM Products;

-- DELETE cancelled orders older than 30 days
DELETE FROM Orders
WHERE status = 'Cancelled'
AND order_date < CURDATE() - INTERVAL 30 DAY;
SELECT * FROM Orders;


-- USE SQL CLAUSES (WHERE, HAVING, LIMIT)
-- Orders placed in last 6 months
SELECT * FROM Orders
WHERE order_date >= CURDATE() - INTERVAL 6 MONTH;

-- Top 5 highest-priced products
SELECT * FROM Products
ORDER BY price DESC
LIMIT 5;

-- Customers who placed more than 3 orders
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) > 3;

-- APPLY SQL OPERATORS (AND, OR, NOT)
-- Orders where status = 'Pending' AND payment_status = 'Paid'
SELECT o.order_id, o.status, p.payment_status
FROM Orders o
JOIN Payments p ON o.order_id = p.order_id
WHERE o.status = 'Pending'
AND p.payment_status = 'Paid';

-- Products that are NOT out of stock
SELECT * FROM Products
WHERE NOT stock_quantity = 0;

-- Customers registered after 2022 OR purchased above 10000
SELECT DISTINCT c.customer_id, c.name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.registration_date > '2022-12-31'
OR o.total_amount > 10000;

-- SORTING & GROUPING (ORDER BY, GROUP BY)
-- Products sorted by price (descending)
SELECT * FROM Products
ORDER BY price DESC;

-- Number of orders placed by each customer
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- Total revenue generated per category
SELECT cat.category_name, SUM(oi.subtotal) AS total_revenue
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
JOIN Categories cat ON p.category_id = cat.category_id
GROUP BY cat.category_name;

-- AGGREGATE FUNCTIONS (SUM, AVG, MAX, MIN, COUNT)
-- Total revenue generated by store
SELECT SUM(total_amount) AS total_revenue
FROM Orders
WHERE status = 'Delivered';

-- Most purchased product
SELECT p.name, SUM(oi.quantity) AS total_quantity
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_quantity DESC
LIMIT 1;

-- Average order value
SELECT AVG(total_amount) AS average_order_value
FROM Orders;

-- JOINS
-- INNER JOIN: Products with category names
SELECT p.product_id, p.name, c.category_name, p.price
FROM Products p
INNER JOIN Categories c
ON p.category_id = c.category_id;

-- LEFT JOIN: All orders with customer details
SELECT o.order_id, o.order_date, o.total_amount, o.status, c.customer_id, c.name, c.email
FROM Orders o
LEFT JOIN Customers c
ON o.customer_id = c.customer_id;

-- RIGHT JOIN: Orders that haven’t been shipped
SELECT o.order_id, s.shipping_status
FROM Orders o
RIGHT JOIN Shipping s
ON o.order_id = s.order_id
WHERE s.shipping_status IS NULL;


-- FULL OUTER JOIN: 
SELECT c.customer_id, c.name, o.order_id
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, c.name, o.order_id
FROM Customers c
RIGHT JOIN Orders o
ON c.customer_id = o.customer_id;

-- Customers who never placed an order
SELECT c.customer_id, c.name
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- SUBQUERIES
-- Orders placed by customers who registered after 2022
SELECT * FROM Orders
WHERE customer_id IN (
    SELECT customer_id
    FROM Customers
    WHERE registration_date > '2022-12-31'
);

-- Customer who has spent the most
SELECT customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 1;

-- Products that have never been ordered
SELECT * FROM Products
WHERE product_id NOT IN (
    SELECT product_id FROM Order_Items
);

-- DATE & TIME FUNCTIONS
-- Count orders per month
SELECT MONTH(order_date) AS month, COUNT(*) AS total_orders
FROM Orders
GROUP BY MONTH(order_date);

-- Calculate delivery time (difference in days)
SELECT order_id, DATEDIFF(delivery_date, shipping_date) AS delivery_days
FROM Shipping
WHERE delivery_date IS NOT NULL;

-- Format order_date as DD-MM-YYYY
SELECT order_id, DATE_FORMAT(order_date, '%d-%m-%Y') AS formatted_date
FROM Orders;

--  STRING FUNCTIONS
-- Convert product names to uppercase
SELECT UPPER(name) AS product_name
FROM Products;

-- Trim whitespace from customer names
SELECT TRIM(name) AS clean_name
FROM Customers;

-- Replace missing email with "Not Provided"
SELECT name,COALESCE(email, 'Not Provided') AS email_status
FROM Customers;

-- WINDOW FUNCTIONS
-- Rank customers based on total spending
SELECT customer_id, SUM(total_amount) AS total_spent,
RANK() 
OVER (ORDER BY SUM(total_amount) DESC) AS rank_position
FROM Orders
GROUP BY customer_id;

-- Cumulative revenue per month
SELECT MONTH(order_date) AS month, SUM(total_amount) AS monthly_revenue,
SUM(SUM(total_amount)) OVER (ORDER BY MONTH(order_date)) AS cumulative_revenue
FROM Orders
GROUP BY MONTH(order_date);

-- Running total of orders
SELECT order_id, order_date, SUM(total_amount)
OVER (ORDER BY order_date) AS running_total
FROM Orders;

-- Assign Loyalty_Status to Customers
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent,
       CASE
           WHEN SUM(o.total_amount) > 50000 THEN 'Gold'
           WHEN SUM(o.total_amount) BETWEEN 20000 AND 50000 THEN 'Silver'
           ELSE 'Bronze'
       END AS Loyalty_Status
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- Categorize Products Based on Units Sold
SELECT p.product_id,p.name, COALESCE(SUM(oi.quantity),0) AS total_units_sold,
       CASE
           WHEN SUM(oi.quantity) > 500 THEN 'Best Seller'
           WHEN SUM(oi.quantity) BETWEEN 200 AND 500 THEN 'Popular'
           ELSE 'Regular'
       END AS product_category
FROM Products p
LEFT JOIN Order_Items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name;
