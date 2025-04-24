
-- Query 1: Top 5 Products by Quantity Sold
SELECT p.name AS product_name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 5;

-- Query 2: Total Revenue and Average Order Value
SELECT 
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS average_order_value
FROM orders;

-- Query 3: Total Orders by Customer
SELECT u.name AS customer_name, COUNT(o.id) AS total_orders
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.name;

-- Query 4: Monthly Sales
SELECT 
    SUBSTR(created_at, 1, 7) AS month, 
    SUM(total_amount) AS total_sales
FROM orders
GROUP BY month
ORDER BY month;
