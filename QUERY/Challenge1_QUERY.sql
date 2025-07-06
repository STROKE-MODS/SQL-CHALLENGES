-- DATA QUALITY CRISIS
--Scenario: Your company’s analytics are broken because of dirty data.
select username from users
 where
 email not like '%@%%.%'
 or
 email is null
 or
 length(phone)<10
 or
 length(phone) is null;


-- 2. Revenue Leak Investigation
--Scenario: Finance reports missing revenue from refunded orders.
select p.product_name,(o.quantity*o.price) as revenue ,
coalesce(r.amount,0) as refund_Amount, 
(o.quantity*o.price) - coalesce(r.amount,0) as net_revenue
 from orders as o
 left join refunds as r
 on o.order_id=r.order_id
 join products as p
 on p.product_id=o.product_id;

--3. Supply Chain Optimization
--Scenario: Warehouse wants to reduce overstock.

--Sold <5 times in the last 6 months.
select p.product_name,o.order_date,o.quantity from products as p
 left join orders as o
 on p.product_id=o.product_id
 where o.quantity<5
 and
 o.order_Date>date('now','-6months');

--With >50 units in stock.
select product_name from products where
    stock>50;

--Ordered from the most expensive supplier.
select p.product_name from products as p
 join suppliers as s
 on s.supplier_id=p.supplier_id
 order by s.Cost_per_unit DESC;

--4. User Retention Analysis
--Scenario: Marketing needs to reduce churn.

-- Task: Find users who:
-- Made a purchase 6+ months ago.
 select u.username,p.product_name,o.order_date
 from orders as o
 left join users as u
 on u.user_id=o.user_id
 join products as p
 on p.product_id=o.product_id
 where
 o.order_date<date('now','-6 months');

-- Have not logged in for 3+ months.
select u.username from orders as o
 left join users as u
 on o.user_id=u.user_id
 where
 u.last_login<date('now','-3 months');

-- Did NOT receive a re-engagement email
select username from users
 where 
 received_reengagement_email is 0;


--5. Dynamic Pricing Model
--Scenario: Competitors are undercutting your prices.

-- Task: Generate a price adjustment report:

--If a product’s price is 10% higher than the competitor’s average → flag for discount.
--If it’s 20% lower → flag for price increase.
select p.product_name,
    (case 
    when
    p.price<(0.2*(select avg(competitor_price) from products))+(select avg(competitor_price) from products)
    then 'price should raise'
    when
    p.price>(0.1*(select avg(competitor_price) from products))+(select avg(competitor_price) from products)
    then 'price should go down'
    else    
 'price is fine'
 end) as 'FLAG2'


--6. Fraud Detection
--Scenario: Suspicious orders are slipping through.

--Task: Flag orders where:
--Billing/shipping country mismatch
select u.username,p.product_name,
(case
when 
o.billing_country!=o.shipping_country
then
'Shipping and billing country mismacthed'
else
'Shipping and billing country is same'
end) as 'FLAG'
from orders as o
left join users as u
on u.user_id=o.user_id
join products as p
on p.product_id=o.product_id;

--Order value > $1000 but from a new account (<7 days old)
 select u.username , o.order_Date,
(case
when
(o.quantity*p.price)>1000
then
'Price is greater then $1000'
when
o.order_date-u.signup_Date<'7 days'
then 'Account is new'
else
'its fine'
 end ) as 'FLAG'
from orders as o
left join users as u
on o.user_id=u.user_id
join products as p
on p.product_id=o.product_id
group by u.username;

--Same credit card used across multiple accounts.
 select o.credit_card_hash,group_concat(u.username,',')
 from orders as o
 left join users as u
  on o.user_id=u.user_id
  group by o.credit_card_hash;


--7. A/B Test Analysis
--Scenario: Did the new checkout page increase conversions?

--Task: Compare conversion rates (orders/visits) between:
--Users who saw layout_v1 vs. layout_v2.
select layout_version,sum(case when layout_version='v1' then 1 else 0 end) as v1 , sum(case when layout_version='v2' then 1 else 0 end) as v2
 from orders
 group by layout_version;

--Segment results by user location (US vs. EU).
select u.country, count(*) from users as u group by u.country;

--8.Inventory Fulfillment
--Scenario: Customers complain about delayed orders.

--Rank suppliers by average delay (worst to best).
 select supplier_name,avg_shipping_delay_days from suppliers
    order by avg_shipping_delay_days ASC;














