CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    customer_email TEXT UNIQUE NOT NULL,
    customer_phone TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE restaurants (
    restaurant_id INTEGER PRIMARY KEY,
    restaurant_name TEXT NOT NULL,
    city TEXT NOT NULL,
    is_active BOOLEAN DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE menu_items (
    item_id INTEGER PRIMARY KEY,
    restaurant_id INTEGER NOT NULL,
    item_name TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    is_available BOOLEAN DEFAULT 1,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    restaurant_id INTEGER NOT NULL,
    order_status TEXT DEFAULT 'Placed',
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_restaurant ON orders(restaurant_id);
CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    price_at_order DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);
CREATE TABLE payments (
    payment_id INTEGER PRIMARY KEY,
    order_id INTEGER NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method TEXT NOT NULL,
    payment_status TEXT DEFAULT 'Paid',
    paid_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers (customer_name, customer_email, customer_phone)
VALUES
('Ali Khan', 'ali.khan@gmail.com', '+923001234567'),
('Sara Ahmed', 'sara.ahmed@gmail.com', '+923009876543'),
('Hassan Raza', 'hassan.raza@gmail.com', '+923003456789'),
('Ayesha Siddiqui', 'ayesha.siddiqui@gmail.com', '+923004567890'),
('Omar Farooq', 'omar.farooq@gmail.com', '+923005678901'),
('Zara Malik', 'zara.malik@gmail.com', '+923006789012');

INSERT INTO restaurants (restaurant_name, city, is_active)
VALUES
('Tasty Bites', 'Karachi', 1),
('Spice Hub', 'Lahore', 1),
('Green Eats', 'Islamabad', 1);

-- Tasty Bites (restaurant_id = 1)
INSERT INTO menu_items (restaurant_id, item_name, price)
VALUES
(1, 'Burger', 350.00),
(1, 'Fries', 150.00),
(1, 'Pizza', 800.00),
(1, 'Coke', 100.00),
(1, 'Salad', 200.00);

-- Spice Hub (restaurant_id = 2)
INSERT INTO menu_items (restaurant_id, item_name, price)
VALUES
(2, 'Biryani', 500.00),
(2, 'Chicken Karahi', 700.00),
(2, 'Naan', 50.00),
(2, 'Raita', 80.00),
(2, 'Gulab Jamun', 120.00);

-- Green Eats (restaurant_id = 3)
INSERT INTO menu_items (restaurant_id, item_name, price)
VALUES
(3, 'Vegan Burger', 400.00),
(3, 'Green Salad', 250.00),
(3, 'Smoothie', 200.00),
(3, 'Veg Wrap', 350.00),
(3, 'Juice', 150.00);

INSERT INTO orders (customer_id, restaurant_id, order_status)
VALUES
(1, 1, 'Delivered'),
(2, 1, 'Delivered'),
(3, 2, 'Preparing'),
(4, 2, 'Placed'),
(5, 3, 'Delivered'),
(6, 3, 'Cancelled'),
(1, 2, 'Delivered'),
(2, 3, 'Placed');

-- Order 1
INSERT INTO order_items (order_id, item_id, quantity, price_at_order)
VALUES
(1, 1, 2, 350.00),  -- 2 Burgers
(1, 2, 1, 150.00);  -- 1 Fries

-- Order 2
INSERT INTO order_items (order_id, item_id, quantity, price_at_order)
VALUES
(2, 3, 1, 800.00),  -- 1 Pizza
(2, 4, 2, 100.00);  -- 2 Cokes

-- Order 3
INSERT INTO order_items (order_id, item_id, quantity, price_at_order)
VALUES
(3, 6, 1, 500.00),  -- 1 Biryani
(3, 7, 1, 700.00);  -- 1 Chicken Karahi

-- Order 4
INSERT INTO order_items (order_id, item_id, quantity, price_at_order)
VALUES
(4, 8, 2, 50.00),   -- 2 Naan
(4, 9, 1, 80.00);   -- 1 Raita

-- Order 5
INSERT INTO order_items (order_id, item_id, quantity, price_at_order)
VALUES
(5, 11, 1, 250.00), -- 1 Green Salad
(5, 12, 2, 200.00); -- 2 Smoothies

-- Order 6 (Cancelled)
INSERT INTO order_items (order_id, item_id, quantity, price_at_order)
VALUES
(6, 10, 1, 400.00); -- 1 Vegan Burger

-- Order 7
INSERT INTO order_items (order_id, item_id, quantity, price_at_order)
VALUES
(7, 6, 1, 500.00),  -- 1 Biryani
(7, 9, 1, 80.00);   -- 1 Raita

-- Order 8
INSERT INTO order_items (order_id, item_id, quantity, price_at_order)
VALUES
(8, 12, 1, 200.00), -- 1 Smoothie
(8, 13, 1, 350.00); -- 1 Veg Wrap

INSERT INTO payments (order_id, amount, payment_method, payment_status)
VALUES
(1, 850.00, 'Card', 'Paid'),
(2, 1000.00, 'Cash', 'Paid'),
(3, 1200.00, 'Card', 'Paid'),
(4, 180.00, 'Cash', 'Pending'),
(5, 650.00, 'Card', 'Paid'),
(6, 400.00, 'Card', 'Refunded'),
(7, 580.00, 'Cash', 'Paid'),
(8, 550.00, 'Card', 'Pending');
