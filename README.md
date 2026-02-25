
# 🛒 E-Commerce Database Management System (SQL Project)

## 📌 Project Overview

This project is a complete **E-Commerce Database Management System** built using **MySQL**.
It simulates real-world online shopping operations including product management, customer tracking, order processing, payments, and shipping management.

The project demonstrates:

* Database design
* Table relationships (Primary & Foreign Keys)
* CRUD operations
* Advanced SQL queries
* Data analysis using SQL

---

# 🗂️ Database Structure

## 📊 Tables Overview (7 Tables)

---

## 1️⃣ Categories

| Column        | Data Type   | Description                 |
| ------------- | ----------- | --------------------------- |
| category_id   | INT (PK)    | Unique ID for each category |
| category_name | VARCHAR(50) | Name of product category    |

📌 Stores product categories like Electronics, Clothing, Books, etc.

---

## 2️⃣ Products

| Column         | Data Type     | Description                 |
| -------------- | ------------- | --------------------------- |
| product_id     | INT (PK)      | Unique product ID           |
| name           | VARCHAR(100)  | Product name                |
| category_id    | INT (FK)      | References Categories table |
| price          | DECIMAL(10,2) | Product price               |
| stock_quantity | INT           | Available stock             |
| added_date     | DATE          | Date product was added      |

📌 Stores product details and links each product to a category.

---

## 3️⃣ Customers

| Column            | Data Type    | Description        |
| ----------------- | ------------ | ------------------ |
| customer_id       | INT (PK)     | Unique customer ID |
| name              | VARCHAR(100) | Customer name      |
| email             | VARCHAR(100) | Customer email     |
| phone_number      | VARCHAR(20)  | Contact number     |
| address           | VARCHAR(200) | Customer address   |
| registration_date | DATE         | Registration date  |

📌 Stores customer information.

---

## 4️⃣ Orders

| Column       | Data Type     | Description                                        |
| ------------ | ------------- | -------------------------------------------------- |
| order_id     | INT (PK)      | Unique order ID                                    |
| customer_id  | INT (FK)      | References Customers                               |
| order_date   | DATE          | Date of order                                      |
| total_amount | DECIMAL(10,2) | Total order value                                  |
| status       | VARCHAR(20)   | Order status (Delivered, Pending, Cancelled, etc.) |

📌 Stores order transactions made by customers.

---

## 5️⃣ Order_Items

| Column        | Data Type     | Description          |
| ------------- | ------------- | -------------------- |
| order_item_id | INT (PK)      | Unique order item ID |
| order_id      | INT (FK)      | References Orders    |
| product_id    | INT (FK)      | References Products  |
| quantity      | INT           | Quantity ordered     |
| subtotal      | DECIMAL(10,2) | Price × Quantity     |

📌 Stores product-wise details of each order.

---

## 6️⃣ Payments

| Column         | Data Type   | Description             |
| -------------- | ----------- | ----------------------- |
| payment_id     | INT (PK)    | Unique payment ID       |
| order_id       | INT (FK)    | References Orders       |
| payment_date   | DATE        | Payment date            |
| payment_method | VARCHAR(20) | UPI / Card / PayPal     |
| payment_status | VARCHAR(20) | Paid / Failed / Pending |

📌 Stores payment transaction details.

---

## 7️⃣ Shipping

| Column          | Data Type   | Description                         |
| --------------- | ----------- | ----------------------------------- |
| shipping_id     | INT (PK)    | Unique shipping ID                  |
| order_id        | INT (FK)    | References Orders                   |
| shipping_date   | DATE        | Date item shipped                   |
| delivery_date   | DATE        | Date item delivered                 |
| shipping_status | VARCHAR(30) | Delivered / In Transit / Dispatched |

📌 Tracks shipping and delivery information.

---

# 🔗 Database Relationships

* One Category → Many Products
* One Customer → Many Orders
* One Order → Many Order_Items
* One Order → One Payment
* One Order → One Shipping Record

---

# ⚙️ Functionalities Implemented

✔ CRUD Operations
✔ SQL Clauses (WHERE, HAVING, LIMIT)
✔ Joins (INNER, LEFT, RIGHT, FULL OUTER via UNION)
✔ Subqueries
✔ Aggregate Functions
✔ Date & Time Functions
✔ String Functions
✔ Window Functions
✔ CASE Expressions

---

# 📊 Advanced SQL Features

### 🎖 Customer Loyalty Classification

* Gold (> ₹50,000)
* Silver (₹20,000 – ₹50,000)
* Bronze (Others)

### 🏷 Product Performance Categorization

* Best Seller
* Popular
* Regular

### 📈 Revenue Analysis

* Monthly revenue
* Cumulative revenue
* Running totals
* Top spending customer

---

# 🛠 Technologies Used

* MySQL
* SQL (DDL, DML, DQL)
* Relational Database Concepts

---

# 📚 Key Learning Outcomes

* Designing normalized relational databases
* Writing advanced SQL queries
* Implementing business logic in SQL
* Using window functions for analytics
* Real-world e-commerce data modeling

---

# 👩‍💻 Author

**Ritu Poonjani**

