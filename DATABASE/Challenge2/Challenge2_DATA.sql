-- DATA ENTRY
-- FROM CSV FILE
sqlite3 Database_name.db
.mode csv
.import orders.csv orders
.import products.csv products
.import refunds.csv refunds

-- ALL THE CSV FILE ARE GIVEN BELOW
