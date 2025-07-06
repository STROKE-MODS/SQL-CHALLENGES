PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "orders"(
"order_id" TEXT, "user_id" TEXT, "product_id" TEXT, "order_date" TEXT,
 "status" TEXT, "quantity" TEXT, "price" TEXT);
INSERT INTO orders VALUES('1001','1','101','2024-06-10','delivered','2','25.99');
INSERT INTO orders VALUES('1002','1','102','2024-06-15','pending','1','19.99');
INSERT INTO orders VALUES('1003','2','103','2024-06-20','delivered','1','89.99');
INSERT INTO orders VALUES('1004','3','101','2024-06-25','cancelled','3','25.99');
INSERT INTO orders VALUES('1005','4','104','2024-06-28','pending','2','12.50');
INSERT INTO orders VALUES('1006','4','105','2024-06-29','delivered','1','15.00');
CREATE TABLE IF NOT EXISTS "products"(
"product_id" TEXT, "product_name" TEXT, "category" TEXT, "price" TEXT);
INSERT INTO products VALUES('101','Wireless Mouse','Electronics','25.99');
INSERT INTO products VALUES('102','Yoga Mat','Fitness','19.99');
INSERT INTO products VALUES('103','Smartwatch','Electronics','89.99');
INSERT INTO products VALUES('104','Water Bottle','Fitness','12.50');
INSERT INTO products VALUES('105','T-Shirt','Apparel','15.00');
CREATE TABLE IF NOT EXISTS "refunds"(
"refund_id" TEXT, "order_id" TEXT, "refund_date" TEXT, "amount" TEXT,
 "reason" TEXT);
INSERT INTO refunds VALUES('1','1004','2024-06-26','77.97','Defective');
INSERT INTO refunds VALUES('2','1005','2024-06-29','25.00','Cancelled');
COMMIT;
