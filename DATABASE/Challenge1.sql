PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
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
INSERT INTO users VALUES(1,'john','john@mail.com','1111111111','2023-01-01','2024-06-28','US',1);
INSERT INTO users VALUES(2,'emma','emma@mail.com','2222222222','2023-02-15','2024-06-30','UK',0);
INSERT INTO users VALUES(3,'john_doe','john@mail.com',NULL,'2024-01-10','2024-01-15','US',0);
INSERT INTO users VALUES(4,'johnx','johnx@mail.com','1111111111','2024-02-20',NULL,'CA',1);
INSERT INTO users VALUES(5,'mike','mike@mail.com','3333333333','2024-03-05',NULL,'AU',0);
INSERT INTO users VALUES(6,'alex','invalid-email','4444444444','2023-11-10',NULL,'US',0);
INSERT INTO users VALUES(7,'duplicate','john@mail.com','5555555555','2024-01-05','2024-01-20','IN',0);
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
INSERT INTO products VALUES(101,'Wireless Mouse','Electronics',25.9899999999999984,4.5,201,50,22.9899999999999984);
INSERT INTO products VALUES(102,'Yoga Mat','Fitness',19.9899999999999984,4.20000000000000017,202,30,18.5);
INSERT INTO products VALUES(103,'Smartwatch','Electronics',89.9899999999999948,3.79999999999999982,201,20,79.9899999999999948);
INSERT INTO products VALUES(104,'Water Bottle','Fitness',12.5,4.70000000000000017,203,100,10.9900000000000002);
INSERT INTO products VALUES(105,'T-Shirt','Apparel',15.0,4.0,204,80,14.0);
INSERT INTO products VALUES(106,'Overstocked Item','Electronics',99.9899999999999948,3.5,205,200,89.9899999999999948);
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
INSERT INTO orders VALUES(1001,1,101,'2024-06-10','delivered',2,25.9899999999999984,'US','US','card_a','v1');
INSERT INTO orders VALUES(1002,1,102,'2024-06-15','pending',1,19.9899999999999984,'US','US','card_a','v1');
INSERT INTO orders VALUES(1003,2,103,'2024-06-20','delivered',1,89.9899999999999948,'UK','UK','card_b','v2');
INSERT INTO orders VALUES(1004,3,101,'2024-06-25','cancelled',3,25.9899999999999984,'US','US','card_c','v1');
INSERT INTO orders VALUES(1005,4,104,'2024-06-28','pending',2,12.5,'CA','CA','card_d','v2');
INSERT INTO orders VALUES(1006,4,105,'2024-06-29','delivered',1,15.0,'CA','US','card_e','v2');
INSERT INTO orders VALUES(1007,1,101,'2024-06-30','pending',1,25.9899999999999984,'US','US','card_a','v1');
INSERT INTO orders VALUES(1008,5,103,'2024-06-05','delivered',5,89.9899999999999948,'AU','AU','card_f','v1');
INSERT INTO orders VALUES(1009,9,101,'2024-06-12','delivered',1,25.9899999999999984,'US','US','card_a','v1');
CREATE TABLE refunds (
    refund_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    refund_date DATE,
    amount REAL,
    reason TEXT
);
INSERT INTO refunds VALUES(1,1004,'2024-06-26',77.9699999999999988,'Defective');
INSERT INTO refunds VALUES(2,1005,'2024-06-29',25.0,'Cancelled');
CREATE TABLE suppliers (
    supplier_id INTEGER PRIMARY KEY,
    supplier_name TEXT,
    country TEXT,
    cost_per_unit REAL,
    avg_shipping_delay_days INTEGER
);
INSERT INTO suppliers VALUES(201,'TechGadgets','China',20.0,5);
INSERT INTO suppliers VALUES(202,'FitLife','USA',15.0,2);
INSERT INTO suppliers VALUES(203,'HydrateCo','Germany',8.0,7);
INSERT INTO suppliers VALUES(204,'StyleWear','India',10.0,10);
INSERT INTO suppliers VALUES(205,'OverstockPro','China',50.0,14);
COMMIT;
