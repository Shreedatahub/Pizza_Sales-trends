
select * from pizza_sales

--TOTAL REVENUE

SELECT
SUM(total_price) as Total_Revenue 
FROM pizza_sales

--Average Order Value

SELECT 
SUM(total_price) / COUNT(distinct order_id) as Avg_ord_value
FROM pizza_sales

--TOTAL PIZZA SOLD

SELECT 
SUM(quantity) as Total_pizza_sold 
FROM pizza_sales

--TOTAL ORDERS PLACED

SELECT 
COUNT(distinct order_id)as total_orders 
FROM pizza_sales

--Average Pizzas Per Order

SELECT 
CAST(CAST(SUM(quantity) as DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) as DECIMAL(10,2)) as DECIMAL(10,2)) as Avg_Pizzas_per_order 
FROM pizza_sales

--DAILY TRENDS FOR TOTAL ORDERS-- Visualization

SELECT 
DATENAME(dw ,order_date) as order_day, 
COUNT(DISTINCT order_id) as total_orders
FROM pizza_sales
GROUP BY DATENAME(dw,order_date)

 ---MONTHLY TRENDS FOR ORDERS

SELECT DATENAME(MONTH, order_date) as Month_Name, 
COUNT(DISTINCT order_id) as Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)


--% OF SALES BY PIZZA CATEGORY

SELECT pizza_category,
SUM(total_price)as Total_Sales,SUM(total_price) *100/
(SELECT SUM(total_price) FROM pizza_sales ) as percent_total_Sales
FROM pizza_sales
--WHERE month(order_date)=1
GROUP BY pizza_category

--% OF SALES BY PIZZA SIZE

SELECT pizza_size,CAST(SUM(total_price)as DECIMAL(10,2))as Total_Sales,CAST(SUM(total_price) *100/
(SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER , order_date)=1)as DECIMAL(10,2)) as percent_total_Sales
FROM pizza_sales 
WHERE DATEPART(QUARTER , order_date)=1
GROUP BY pizza_size

-- TOP 5 BEST SELLERS BY REVENUE..

SELECT TOP 5 pizza_name, 
SUM(total_price) as total_revenue 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC

--TOP 5 BY QUANTITY

SELECT TOP 5 pizza_name, 
SUM(quantity) as total_quantity 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC

--BOTTOM 5 BY REVENUE
SELECT TOP 5 pizza_name,
SUM(total_price) as total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC

--BOTTOM 5 BY QUANTITY

SELECT TOP 5 pizza_name, 
SUM(quantity) as total_quantity 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC

--TOP 5 PIZZAS BY TOTAL ORDERS

SELECT TOP 5 pizza_name, 
COUNT(DISTINCT order_id) as total_orders 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC 


--BOTTOM 5 PIZZAS BY TOTAL ORDERS

SELECT TOP 5 pizza_name, 
COUNT(DISTINCT order_id) as total_orders 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC 


























