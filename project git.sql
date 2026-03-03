# TOTAL REVENUE 
SELECT SUM(total_amount) as total_revenue
FROM orders
;
#Revenue by Country
SELECT country,SUM(total_amount) as  revenue 
FROM orders
JOIN customers ON customers.customer_id = orders.customer_id 
GROUP BY country
ORDER BY revenue DESC
;
#Revenue per month
SELECT 
extract(YEAR FROM order_date) as year_,
extract(MONTH FROM  order_date) as month_,
SUM(total_amount) as monthly_revenue
FROM orders
GROUP BY year_,month_
ORDER BY year_,month_
;
#Top  selling product
SELECT 
p.product_name,
p.product_id,
SUM(oi.quantity) as total_quantity_sold
FROM order_items as oi
JOIN products as p ON oi.product_id = p.product_id
GROUP BY p.product_id,p.product_name
ORDER BY product_name
LIMIT 1
;
#Top customer
SELECT 
    c.first_name,
    c.last_name,
    c.customer_id,
    SUM(oi.quantity) AS total_quantity
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_quantity DESC
LIMIT 1
;
#Average order value
SELECT
AVG(total_amount) as Average_order_value
FROM orders
;
#customers category and order_values
SELECT *
FROM customers as c
RIGHT JOIN orders as o
         ON c.customer_id = o.customer_id
;
#counting orders per person
SELECT
c.customer_id,
first_name,
last_name,
COUNT(total_amount) as countin
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id
;
#Most expensive order vs Cheapest order
SELECT 
MAX(total_amount) as most_expensive,
MIN(total_amount) as cheapest
FROM orders;

#Ranking customers
SELECT c.first_name,c.last_name,
c.customer_id,
SUM(o.total_amount) as Spend_values,
RANK() OVER(ORDER BY SUM(o.total_amount) DESC) as ranking_
FROM customers as c
JOIN orders as o
	ON c.customer_id = o.customer_id
GROUP BY 
c.customer_id,
c.first_name,
c.last_name
;
