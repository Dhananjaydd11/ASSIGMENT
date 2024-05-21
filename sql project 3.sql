use DHANANJAY

alter table orders add quantity int

select  * from Customer
select * from Orders
select * from productS

select customer_name, email from Customer

select o.order_id,p.product_name,o.quantity from  Orders o
inner join productS p
on O.customer_id = P.Product_id

select sum(quantity) as total_quantity from Orders

select customer_name from CUSTOMER
inner join Orders
on Customer.customer_id = Orders.order_id

select product_name, price from productS
where price > 10

select avg(price) as avg_price from productS

select customer_name, quantity,product_name from Customer
inner join Orders
on Customer.customer_id = Orders.customer_id
inner join productS
on Customer.customer_id = productS.product_id

select top 5 quantity from Orders
order by quantity desc

select  product_id, avg(price)as avg_price from PRODUCTS
group by Product_id


select o.order_id,o.quantity,p.product_name,c.customer_name from Orders o 
inner join productS p
on o.customer_id = p.Product_id
inner join Customer c
on c.customer_id = o.customer_id
where customer_name like 'M%'


select sum(total_amount) as toatl_revenue from Orders

select customer_name, sum(total_amount) as toatl_revenue  from Orders o
inner join customer c
on o.customer_id = c.customer_id
group by customer_name





