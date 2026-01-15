SELECT * FROM customers;

SELECT restaurant_name, city FROM restaurants;

SELECT item_name, price FROM menu_items where is_available = 1;

SELECT order_id, order_status FROM orders WHERE order_status = 'Delivered';

SELECT customer_name, order_id, order_status 
FROM orders JOIN customers 
on orders.customer_id = orders.order_id

SELECT order_id, restaurant_name, city
FROM orders JOIN restaurants
on orders.order_id = orders.restaurant_id

SELECT order_id, item_name, quantity, price_at_order
FROM orders JOIN order_items on orders.order_id = order_items.order_id
JOIN menu_items on order_items.item_id = menu_items.item_id

SELECT
    c.customer_name,
    r.restaurant_name,
    o.order_status
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN restaurants r
    ON r.restaurant_id = o.restaurant_id;

SELECT customer_name, COUNT(order_id) as total_orders
FROM customers JOIN orders
on customers.customer_id = orders.customer_id
GROUP BY customer_name

SELECT restaurant_name, COUNT(order_id) AS total_orders
FROM restaurants JOIN orders
on restaurants.restaurant_id = orders.restaurant_id
GROUP BY restaurant_name

SELECT 
    r.restaurant_name, 
    SUM(oi.quantity * oi.price_at_order) AS total_revenue
FROM restaurants r 
JOIN orders o
    ON r.restaurant_id = o.restaurant_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY restaurant_name

SELECT 
    c.customer_name,
    SUM(oi.quantity * oi.price_at_order) AS total_revenue
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY customer_name

SELECT 
    mi.item_name,
    SUM(oi.quantity) AS total_quantity_ordered
FROM menu_items mi 
JOIN order_items oi 
    ON mi.item_id = oi.item_id
GROUP BY item_name
ORDER BY total_quantity_ordered DESC