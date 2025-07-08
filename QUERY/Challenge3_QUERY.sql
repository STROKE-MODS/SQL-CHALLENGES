--Challenge 3: Inventory Optimization
--Scenario: Warehouse manager wants to reduce overstock.
select p.product_name,count(s.sale_id) as Sales,p.category,sum(p.stock) as stocks,max(s.sale_date)
 from products as p
  left join sales as s
 on p.product_id=s.product_id
 left join suppliers as s8
  on p.supplier_id=s8.supplier_id
 group by p.product_name
 having sum(p.stock)>50
 order by s8.cost_per_unit DESC;