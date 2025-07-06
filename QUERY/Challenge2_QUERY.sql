--Task:
--Write a SQL query that calculates:
--Gross revenue(price*quantity)
select p.product_name,
(o.price * o.quantity) as Gross_Revenue
from orders as o
    join products as p on o.product_id = p.product_id;
--Total refunds 
select sum(r.amount)
from refunds as r;
--Net revenue (gross - refunds)
--Grouped by product category, including categories with $0 refunds
select p.category,
    sum(
        case
            when o.status = 'delivered' then ((o.quantity * o.price) - coalesce(r.amount, 0))
            else 0
        end
    ) as Gross_revenue
from orders as o
    join products as p on p.product_id = o.product_id
    left join refunds as r on o.order_id = r.order_id
group by p.category;