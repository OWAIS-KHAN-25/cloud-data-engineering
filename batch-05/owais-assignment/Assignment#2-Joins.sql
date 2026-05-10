-- ============================================================
--  ASSIGNMENT 02 — Joins
--  Database : BikeStores
-- ============================================================

-- ============================================================
--  Question 1
--  Retrieve the product_name, list_price, and category_name
--  for every product.
--  Use production.products and production.categories.
--  Sort the results by product_name ascending.
-- ============================================================

-- Write your query below:

select product_name, list_price,category_name 
from production.products as pp
inner join production.categories as pc
on pp.category_id=pc.category_id
order by product_name;



-- ============================================================
--  Question 2
--  Show the customer full name (as full_name), order_id,
--  and order_date for all customers who have placed an order.
--  Use sales.customers and sales.orders.
--  Sort by order_date descending.
-- ============================================================

-- Write your query below:

select sc.first_name+' '+last_name as full_name,so.order_id,so.order_date 
from sales.customers as sc
inner join sales.orders as so
on sc.customer_id=so.customer_id
order by order_date DESC;

-- ============================================================
--  Question 3
--  Retrieve product_name, list_price, category_name, and
--  brand_name for every product.
--  Use production.products, production.categories,
--  and production.brands.
--  Sort by brand_name then product_name (both ascending).
-- ============================================================

-- Write your query below:

select pp.product_name,pp.list_price,pc.category_name,pb.brand_name
from production.products as pp
inner join production.categories as pc
on pp.category_id=pc.category_id
inner join production.brands as pb
on pb.brand_id=pp.brand_id
order by  brand_name,product_name;


-- ============================================================
--  Question 4
--  List all products along with their order_id and item_id.
--  Make sure products that have NEVER been ordered also appear
--  in the result (those rows will have NULL for order_id
--  and item_id).
--  Use production.products and sales.order_items.
--  Sort by order_id ascending.
-- ============================================================

-- Write your query below:

select pp.product_name,so.order_id,so.item_id
from production.products as pp
left join sales.order_items as so
on pp.product_id=so.product_id
order by order_id;


-- ============================================================
--  Question 5
--  Using your answer from Question 4 as a base, filter the
--  results to show ONLY the products that have never been
--  ordered.
--  Display only product_id and product_name.
-- ============================================================

-- Write your query below:

select pp.product_id,pp.product_name
from production.products as pp
left join sales.order_items as so
on pp.product_id=so.product_id
where so.order_id is Null

-- ============================================================
--  Question 6
--  Show all stores along with any orders placed at each store.
--  Display store_name, store_id (from stores), order_id,
--  and order_date.
--  Every store must appear in the result, even if it has
--  no orders yet.
--  Use sales.orders and sales.stores.
-- ============================================================

-- Write your query below:

select ss.store_name,ss.store_id,so.order_id,so.order_date
from sales.orders as so
left join sales.stores as ss
on so.store_id=ss.store_id





-- ============================================================
--  Question 7
--  List every staff member alongside their manager's name.
--  Display:
--    • staff full name   (as staff_name)
--    • manager full name (as manager_name)
--  Use only the sales.staffs table.
--  Staff who have no manager should NOT appear in the result.
-- ============================================================

-- Write your query below:

SELECT
    e.staff_id                          AS emp_staff_id,
    e.first_name + ' ' + e.last_name    AS staff_name,
    m.staff_id                          AS manager_staff_id,
    m.first_name + ' ' + m.last_name    AS manager_name
FROM sales.staffs e
INNER JOIN sales.staffs m
    ON m.staff_id = e.manager_id;



-- ============================================================
--  Question 8
--  Generate every possible combination of store name and
--  brand name.
--  Display store_name and brand_name.
--  Use sales.stores and production.brands.
--  How many total rows do you expect?
--  Write the expected count as a comment next to your query.
-- ============================================================

-- Write your query below:
select ss.store_name,pb.brand_name from sales.stores as ss
cross join production.brands as pb


-- ============================================================
--  Question 9
--  Retrieve the customer full name (as full_name), order_id,
--  order_date, product_name, and list_price for every order
--  that has been placed.
--  Use sales.customers, sales.orders, sales.order_items,
--  and production.products.
--  Sort by order_date ascending, then full_name ascending.
-- ============================================================

-- Write your query below:
 
 select sc.first_name+' '+last_name as full_name,so.order_id,so.order_date,pp.product_name,pp.list_price
 from sales.customers as sc
 inner join sales.orders as so
 on sc.customer_id=so.customer_id
 inner join sales.order_items as oi
 on so.order_id=oi.order_id
 inner join production.products as pp
 on oi.product_id=pp.product_id
 order by order_date,full_name ASC;