-- CREATION OF TABLES
-- Products with overstock risk
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    stock INT,
    supplier_id INT
);

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name TEXT,
    cost_per_unit DECIMAL(10,2),
    avg_shipping_days INT
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity INT
);

CREATE TABLE monthly_sales (
    month DATE PRIMARY KEY,
    electronics_sales DECIMAL(10,2),
    fitness_sales DECIMAL(10,2),
    returns DECIMAL(10,2)
);

-- DATA INSERTION 
-- Products (4 overstocked, 2 normal)
INSERT INTO products VALUES
(101, 'Wireless Mouse', 'Electronics', 120, 1),
(102, 'Yoga Mat', 'Fitness', 30, 2),
(103, 'Smartwatch', 'Electronics', 80, 1),  -- Overstocked
(104, 'Desk Lamp', 'Home', 200, 3),        -- Overstocked
(105, 'Water Bottle', 'Fitness', 15, 2),
(106, 'Keyboard', 'Electronics', 60, 1);    -- Overstocked

-- Suppliers (higher cost = worse)
INSERT INTO suppliers VALUES
(1, 'TechGlobal', 25.99, 14),  -- Most expensive
(2, 'FitSupplies', 12.50, 7),
(3, 'HomeGoods Inc', 8.99, 21);

-- Sales (last 6 months)
INSERT INTO sales VALUES
(1, 101, '2024-05-15', 2),
(2, 101, '2024-06-01', 3),
(3, 103, '2024-01-10', 1),  -- Old sale
(4, 104, '2024-06-18', 1),
(5, 106, '2024-04-05', 1);

INSERT INTO monthly_sales VALUES
('2024-01-01', 1250.50, 845.20, 312.75),
('2024-02-01', 980.30, 920.10, 280.40),
('2024-03-01', 1100.00, 780.50, 198.20),
('2024-04-01', 870.75, 1100.80, 420.60),  -- High returns
('2024-05-01', 1500.20, 950.30, 210.45),
('2024-06-01', 1350.90, 1200.40, 385.20);
