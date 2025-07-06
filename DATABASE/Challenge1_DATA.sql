-- 1. USERS TABLE (with dirty data for cleaning)
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    username TEXT,
    email TEXT,
    phone TEXT,
    signup_date DATE,
    last_login DATE,
    country TEXT,
    received_reengagement_email BOOLEAN DEFAULT 0
);

INSERT INTO users VALUES
(1, 'john', 'john@mail.com', '1111111111', '2023-01-01', '2024-06-28', 'US', 1),
(2, 'emma', 'emma@mail.com', '2222222222', '2023-02-15', '2024-06-30', 'UK', 0),
(3, 'john_doe', 'john@mail.com', NULL, '2024-01-10', '2024-01-15', 'US', 0),
(4, 'johnx', 'johnx@mail.com', '1111111111', '2024-02-20', NULL, 'CA', 1),
(5, 'mike', 'mike@mail.com', '3333333333', '2024-03-05', NULL, 'AU', 0),
(6, 'alex', 'invalid-email', '4444444444', '2023-11-10', NULL, 'US', 0),
(7, 'duplicate', 'john@mail.com', '5555555555', '2024-01-05', '2024-01-20', 'IN', 0);

-- 2. PRODUCTS TABLE (for pricing/inventory analysis)
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    price REAL,
    rating REAL,
    supplier_id INTEGER,
    stock INTEGER,
    competitor_price REAL
);

INSERT INTO products VALUES
(101, 'Wireless Mouse', 'Electronics', 25.99, 4.5, 201, 50, 22.99),
(102, 'Yoga Mat', 'Fitness', 19.99, 4.2, 202, 30, 18.50),
(103, 'Smartwatch', 'Electronics', 89.99, 3.8, 201, 20, 79.99),
(104, 'Water Bottle', 'Fitness', 12.50, 4.7, 203, 100, 10.99),
(105, 'T-Shirt', 'Apparel', 15.00, 4.0, 204, 80, 14.00),
(106, 'Overstocked Item', 'Electronics', 99.99, 3.5, 205, 200, 89.99);

-- 3. ORDERS TABLE (for revenue/fraud analysis)
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    product_id INTEGER,
    order_date DATE,
    status TEXT,
    quantity INTEGER,
    price REAL,
    billing_country TEXT,
    shipping_country TEXT,
    credit_card_hash TEXT,
    layout_version TEXT
);

INSERT INTO orders VALUES
(1001, 1, 101, '2024-06-10', 'delivered', 2, 25.99, 'US', 'US', 'card_a', 'v1'),
(1002, 1, 102, '2024-06-15', 'pending', 1, 19.99, 'US', 'US', 'card_a', 'v1'),
(1003, 2, 103, '2024-06-20', 'delivered', 1, 89.99, 'UK', 'UK', 'card_b', 'v2'),
(1004, 3, 101, '2024-06-25', 'cancelled', 3, 25.99, 'US', 'US', 'card_c', 'v1'),
(1005, 4, 104, '2024-06-28', 'pending', 2, 12.50, 'CA', 'CA', 'card_d', 'v2'),
(1006, 4, 105, '2024-06-29', 'delivered', 1, 15.00, 'CA', 'US', 'card_e', 'v2'), -- Shipping mismatch
(1007, 1, 101, '2024-06-30', 'pending', 1, 25.99, 'US', 'US', 'card_a', 'v1'),
(1008, 5, 103, '2024-06-05', 'delivered', 5, 89.99, 'AU', 'AU', 'card_f', 'v1'),
(1009, 9, 101, '2024-06-12', 'delivered', 1, 25.99, 'US', 'US', 'card_a', 'v1'); -- Fraud pattern (same card as user 1)

-- 4. REFUNDS TABLE (for net revenue calculation)
CREATE TABLE refunds (
    refund_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    refund_date DATE,
    amount REAL,
    reason TEXT
);

INSERT INTO refunds VALUES
(1, 1004, '2024-06-26', 77.97, 'Defective'),
(2, 1005, '2024-06-29', 25.00, 'Cancelled');

-- 5. SUPPLIERS TABLE (for inventory optimization)
CREATE TABLE suppliers (
    supplier_id INTEGER PRIMARY KEY,
    supplier_name TEXT,
    country TEXT,
    cost_per_unit REAL,
    avg_shipping_delay_days INTEGER
);

INSERT INTO suppliers VALUES
(201, 'TechGadgets', 'China', 20.00, 5),
(202, 'FitLife', 'USA', 15.00, 2),
(203, 'HydrateCo', 'Germany', 8.00, 7),
(204, 'StyleWear', 'India', 10.00, 10),
(205, 'OverstockPro', 'China', 50.00, 14);

