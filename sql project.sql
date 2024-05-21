select * from  orders$

-- First, alter the column to disallow null values
ALTER TABLE orders$
ALTER COLUMN order_id INT NOT NULL;

-- Then, add the primary key constraint
ALTER TABLE orders$
ADD PRIMARY KEY (order_id);

select * from order_details$

ALTER TABLE  order_details$
ALTER COLUMN order_details_id INT NOT NULL;

ALTER TABLE order_details$
ADD PRIMARY KEY (order_details_id);

select * from pizzas$
select * from pizza_types$
select * from orders$
select * from order_details$

ALTER TABLE orders$
ALTER COLUMN time TIME(0);

--1 .Retrieve the total number of orders placed.

select count(order_id) as total_orders from orders$

select * from pizzas$
select * from order_details$

--2.Calculate the total revenue generated from pizza sales.
SELECT ROUND(SUM(P.price*O.QUANTITY ),2)
AS TOTAL_REVENUE  
FROM pizzas$ AS P
INNER JOIN order_details$ AS O
ON P.pizza_id = O.pizza_id

--3.Identify the highest-priced pizza.

SELECT TOP 1 PT.name,P.PRICE HIGHRST_PRICE FROM pizzas$ AS P
INNER JOIN pizza_types$ AS PT
ON P.pizza_type_id = PT.pizza_type_id
ORDER BY P.price DESC 

select * from pizzas$
select * from order_details$

--4.Identify the most common pizza size ordered.
SELECT  P.size,COUNT(O.ORDER_ID)AS COMMAN_ORDER  FROM pizzas$ AS P
INNER JOIN order_details$ AS O
ON P.pizza_id = O.pizza_id
GROUP BY SIZE

--5.List the top 5 most ordered pizza types along with their quantities.
select * from pizzas$
select * from pizza_types$
select * from order_details$



SELECT TOP 5 PT.name, SUM(O.QUANTITY) AS QUANTITY 
FROM pizza_types$ AS PT
JOIN pizzas$ AS P ON PT.pizza_type_id = P.pizza_type_id
JOIN order_details$ AS O ON P.pizza_id = O.pizza_id
GROUP BY PT.name
ORDER BY SUM(O.QUANTITY) DESC;

--6.Join the necessary tables to find the total quantity of each pizza Category ordered.



SELECT PT.category, SUM(O.quantity) AS total_quantity
FROM pizza_types$ AS PT
JOIN pizzas$ AS P ON PT.pizza_type_id = P.pizza_type_id
JOIN order_details$ AS O ON P.pizza_id = O.pizza_id
GROUP BY PT.category;


select * from pizzas$
select * from pizza_types$
select * from orders$
select * from order_details$

--7.Determine the distribution of orders by hour of the day.


SELECT HOUR(time) AS hour, COUNT(order_id) AS order_count
FROM orders$
GROUP BY HOUR(time);

;----THERE IS PROBLEM IN TIME DATA SET THATS WHY I USE THIS FUNCTION 




SELECT DATEPART(HOUR, time) AS hour, COUNT(order_id) AS order_count
FROM orders$
GROUP BY DATEPART(HOUR, time)
ORDER BY COUNT(order_id) DESC;

---8 Join relevant tables to find the category-wise distribution of pizzas.

select count(name) as pizza_category,category from pizza_types$
group by category

--9 Group the orders by date and calculate the average number of pizzas ordered per day.

select date, count(order_id) as orders from orders$
group by date
order by  date 




SELECT ROUND(AVG(quantity),0) AS avg_PIZZA_ORDER_PER_DAY
FROM (
    SELECT o.date, SUM(od.quantity) AS quantity 
    FROM orders$ AS o
    JOIN order_details$ AS od ON o.order_id = od.order_id 
    GROUP BY o.date
)as order_quantity;




---10 Determine the top 3 most ordered pizza types based on revenue.

SELECT TOP 3 pizza_types$.name,SUM(order_details$.quantity*pizzas$.price) AS REVENUE
FROM pizza_types$ JOIN pizzas$
ON pizza_types$.pizza_type_id = pizzas$.pizza_type_id
JOIN order_details$
ON order_details$.pizza_id = pizzas$.pizza_id
GROUP BY pizza_types$.name
ORDER BY REVENUE DESC


---11 Calculate the percentage contribution of each pizza type to total revenue. 



SELECT 
    pizza_types$.category,
    ((SUM(pizzas$.price * order_details$.quantity) / 
    (SELECT ROUND(SUM(P$.price * O$.quantity), 2) 
    FROM pizzas$ AS P$ 
    INNER JOIN order_details$ AS O$ ON P$.pizza_id = O$.pizza_id)) * 100) AS REVENUE_PERCENTAGE
FROM 
    pizza_types$ 
JOIN 
    pizzas$ ON pizza_types$.pizza_type_id = pizzas$.pizza_type_id 
JOIN 
    order_details$ ON order_details$.pizza_id = pizzas$.pizza_id
GROUP BY 
    pizza_types$.category
ORDER BY 
    REVENUE_PERCENTAGE DESC;

