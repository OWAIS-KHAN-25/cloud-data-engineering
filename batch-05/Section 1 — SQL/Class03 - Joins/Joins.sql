-- Left Join 

SELECT   
	p.product_name,
	oi.order_id
FROM 
	production.products p -- left table
left JOIN SALES.order_items oi -- right table
	ON p.product_id = oi.product_id
order by order_id;

-- product_name , order_id, order_date, item_id 
-- left 

select 
	p.product_name,
	oi.order_id,
	oi.item_id,
	o.order_date
from production.products p
left join sales.order_items oi
	on oi.product_id = p.product_id
left join sales.orders o
	on o.order_id = oi.order_id
order by order_date;



select 
	*
from production.products p
left join sales.order_items oi
	on oi.product_id = p.product_id
left join sales.orders o
	on o.order_id = oi.order_id

-- right join 
select product_name, order_id from 
	sales.order_items oi -- left table
right join production.products p -- right table 
	on p.product_id = oi.product_id
order by order_id

select 
	*
from production.products p
left join sales.order_items oi
	on oi.product_id = p.product_id

-- right

select * from  sales.orders o
right join  sales.stores st
	on st.store_id = o.store_id;


select product_name, order_id from 
	sales.order_items oi -- left table
full join production.products p -- right table 
	on p.product_id = oi.product_id
order by order_id;


SELECT c.id as candid_id,
		e.id as emp_id,
		c.fullname
FROM hr.candidates c
inner JOIN hr.employees  e
	ON c.fullname = e.fullname;


SELECT c.id as candid_id,
		e.id as emp_id,
		c.fullname
FROM hr.candidates c
left JOIN hr.employees  e
	ON c.fullname = e.fullname;


SELECT c.id as candid_id,
		e.id as emp_id,
		e.fullname
FROM hr.candidates c
right JOIN hr.employees  e
	ON c.fullname = e.fullname;

SELECT c.id as candid_id,
		e.id as emp_id,
		e.fullname as emp_name,
		c.fullname as candid_name
FROM hr.candidates c
full JOIN hr.employees  e
	ON c.fullname = e.fullname;

select * from hr.candidates;
select * from hr.employees;


-- cross join 

-- Syntax

-- Select select_list 
-- from table t1
-- cross join table t2;

-- cross products, stores 
-- products 321
-- stores 3
-- 963

select *	
	from production.products
cross join sales.stores;

select *	
	from production.products
cross join sales.order_items;

select * from sales.order_items; -- 4722

-- Self Join 
-- Syntax

-- SELECT select_list
-- from table t1
-- inner/left/right join table t2

-- Staff name, manager_name
select 
	e.staff_id emp_staff_id,
	e.first_name + ' ' + e.last_name as staff_name,
	m.staff_id as manager_staff_id,
	m.first_name + ' ' + m.last_name as manager_name
from 
	sales.staffs e
inner join sales.staffs m
	on m.staff_id = e.manager_id ;

select * from sales.staffs;

-- self join on customers
-- customer_name 1, customer_name 2
-- customers from same city (AND t1.city = t2.city)


select 
	c1.city, 
	c1.first_name + ' ' + c1.last_name as customer_1,
	c2.first_name + ' ' + c2.last_name as customer_2
from sales.customers c1 
inner join sales.customers c2 
	on c1.customer_id > c2.customer_id
	AND c1.city = c2.city
where c1.city= 'Albany'
order by city;
