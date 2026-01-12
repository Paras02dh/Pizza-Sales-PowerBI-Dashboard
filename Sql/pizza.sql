create database pizzahut;
use pizzahut;

create table orders(
order_id int not null primary key,
order_date date not null,
order_time time not null
);

create table order_details(
order_details_id int not null primary key,
order_id int not null ,
pizza_id text not null,
quantity int not null
);

-- Retrieve the total number of orders placed.
SELECT COUNT(*) AS total_order
FROM orders;
 
-- Get the number of unique customers who placed an order
SELECT COUNT(DISTINCT order_id) AS unique_customers
FROM order_details;

-- Calculate the total revenue generated from pizza sales.
SELECT
ROUND(SUM(order_details.quantity*pizzas.price),2) AS total_sales
FROM order_details
JOIN pizzas
ON pizzas.pizza_id=order_details.pizza_id;

-- Get the total number of pizzas sold
SELECT SUM(quantity) AS total_pizzas_sold
FROM order_details;

-- Identify the highest-priced pizza.
SELECT 
pizza_types.name,pizzas.price
from pizza_types 
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
order by pizzas.price desc limit 1;

-- Identify the most common pizza size ordered.
SELECT pizzas.size, COUNT(*) AS total_orders
FROM order_details
JOIN pizzas 
ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY total_orders DESC
LIMIT 1;

-- List the top 5 most ordered pizza types along with their quantities.
SELECT pizzas.pizza_type_id, SUM(order_details.quantity) AS total_quantity
FROM pizzas
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.pizza_type_id
ORDER BY total_quantity DESC
LIMIT 5;

-- Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
      pizza_types.category,
      SUM(order_details.quantity) AS total_quantity
FROM order_details
JOIN pizzas ON pizzas.pizza_id= order_details.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id=pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY total_quantity DESC;

-- Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pizza_types.pizza_type_id,
    pizza_types.name,  
    ROUND(SUM(pizzas.price * order_details.quantity), 2) AS revenue
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.pizza_type_id, pizza_types.name
ORDER BY revenue DESC
LIMIT 3;

-- Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    orders.order_date,
    SUM(order_details.quantity) AS total_pizzas_ordered
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY orders.order_date
ORDER BY orders.order_date;

-- Orders by Time of Day
SELECT 
    CASE 
        WHEN TIME(order_time) BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN TIME(order_time) BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    COUNT(*) AS total_orders
FROM orders 
GROUP BY time_of_day;
    
-- Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
      pizza_types.category,
      COUNT(order_details.order_id) AS pizza_delivered
FROM order_details
JOIN pizzas ON order_details.pizza_id=pizzas.pizza_id
JOIN pizza_types ON  pizza_types.pizza_type_id=pizzas.pizza_type_id
GROUP BY pizza_types.category
ORDER BY pizza_delivered DESC;

-- Determine the distribution of orders by hour of the day.
SELECT 
    EXTRACT(HOUR FROM order_time) AS order_hour,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_hour
ORDER BY order_hour;

-- List all available pizza sizes and how many pizzas were sold in each size
SELECT size, SUM(quantity) AS total_sold
FROM pizzas
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY size
ORDER BY total_sold DESC;

-- Most profitable pizza size
SELECT 
    pizzas.size,
    ROUND(SUM(order_details.quantity * pizzas.price), 2) AS total_revenue
FROM pizzas
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY total_revenue DESC
LIMIT 1;

-- Calculate the percentage contribution of each pizza type to total revenue.
select * from orders;
select * from order_details;
select * from pizzas;
select * from orders;


/*Advanced:
Calculate the percentage contribution of each pizza type to total revenue.
Analyze the cumulative revenue generated over time.
Determine the top 3 most ordered pizza types based on revenue for each pizza category.*/






