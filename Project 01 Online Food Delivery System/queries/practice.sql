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