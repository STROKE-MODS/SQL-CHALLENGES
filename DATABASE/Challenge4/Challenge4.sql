PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "email_campaign"(
"campaign_id" TEXT, "user_id" TEXT, "email_type" TEXT, "sent_date" TEXT,
 "opened" TEXT);
INSERT INTO email_campaign VALUES('1','1','re-engagement','2024-06-01','Yes');
INSERT INTO email_campaign VALUES('2','4','discount','2024-05-15','No');
INSERT INTO email_campaign VALUES('3','5','newsletter','2024-06-10','Yes');
CREATE TABLE IF NOT EXISTS "purchases"(
"purchase_id" TEXT, "user_id" TEXT, "amount" TEXT, "purchase_date" TEXT);
INSERT INTO purchases VALUES('1001','1','25.99','2023-12-01');
INSERT INTO purchases VALUES('1002','2','89.99','2024-01-15');
INSERT INTO purchases VALUES('1003','3','19.99','2023-11-10');
INSERT INTO purchases VALUES('1004','4','50.00','2023-10-01');
INSERT INTO purchases VALUES('1005','5','15.00','2024-02-20');
INSERT INTO purchases VALUES('1006','6','10.00','2023-09-01');
INSERT INTO purchases VALUES('1007','7','10.00','2023-09-01');
CREATE TABLE IF NOT EXISTS "user_activity"(
"user_id" TEXT, "username" TEXT, "last_purchase" TEXT, "last_login" TEXT,
 "received_reengagement_email" TEXT, "country" TEXT);
INSERT INTO user_activity VALUES('1','john','2023-12-01','2024-06-28','Yes','US');
INSERT INTO user_activity VALUES('2','emma','2024-01-15','NULL','No','UK');
INSERT INTO user_activity VALUES('3','alex','2023-11-10','2024-02-05','No','US');
INSERT INTO user_activity VALUES('4','mike','2023-10-01','NULL','Yes','CA');
INSERT INTO user_activity VALUES('5','lisa','2024-02-20','2024-06-01','No','AU');
INSERT INTO user_activity VALUES('6','duplicate1','2023-09-01','NULL','No','IN');
INSERT INTO user_activity VALUES('7','duplicate2','2023-09-01','NULL','No','IN');
COMMIT;
