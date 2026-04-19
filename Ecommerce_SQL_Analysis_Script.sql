CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;
SELECT * FROM customers LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM products LIMIT 10;
SELECT * FROM payments LIMIT 10;
DESCRIBE customers;
DESCRIBE orders;
DESCRIBE order_items;
DESCRIBE products;
DESCRIBE payments;
SELECT COUNT(customer_id) AS total_customers FROM customers;
SELECT COUNT(order_id) AS total_orders FROM orders;
SELECT SUM(payment_value) AS total_revenue FROM payments;
SELECT AVG(payment_value) AS avg_order_value FROM payments;
SELECT
product_id, 
COUNT(order_id) AS total_sales
FROM order_items
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 10;
SELECT
order_status,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_status;
SELECT
DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS order_month,
COUNT(order_id) AS total_ordes
FROM orders
GROUP BY order_month
ORDER BY order_month;
SELECT
o.customer_id,
SUM(p.payment_value) AS total_spent
FROM orders o
JOIN payments p
ON o.order_id = p.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 10;
SELECT
p.product_category_name,
SUM(pay.payment_value) AS revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
JOIN payments pay
ON oi.order_id = pay.order_id
GROUP BY p.product_category_name
ORDER BY revenue DESC;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM payments;
SELECT
customer_id,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;
SELECT
payment_type, 
COUNT(*) AS total_transactions
FROM payments
GROUP BY payment_type;