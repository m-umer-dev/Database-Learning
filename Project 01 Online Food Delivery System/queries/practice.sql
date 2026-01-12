SELECT * FROM customers;

SELECT restaurant_name, city FROM restaurants;

SELECT item_name, price FROM menu_items where is_available = 1;

SELECT order_id, order_status FROM orders WHERE order_status = 'Delivered';