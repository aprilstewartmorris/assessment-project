-- Sample orders
INSERT INTO orders (id, customer_name, status, total, created_at) VALUES 
(1, 'John Smith', 'PENDING', 150.00, CURRENT_TIMESTAMP),
(2, 'Jane Doe', 'PROCESSING', 275.50, CURRENT_TIMESTAMP),
(3, 'Bob Johnson', 'SHIPPED', 89.99, CURRENT_TIMESTAMP),
(4, 'Alice Williams', 'DELIVERED', 420.00, CURRENT_TIMESTAMP),
(5, 'Charlie Brown', 'PENDING', 55.25, CURRENT_TIMESTAMP),
(6, 'David Miller', 'PROCESSING', 199.99, CURRENT_TIMESTAMP),
(7, 'Emma Davis', 'SHIPPED', 340.50, CURRENT_TIMESTAMP),
(8, 'Frank Wilson', 'PENDING', 125.75, CURRENT_TIMESTAMP);

-- Sample order items
INSERT INTO order_items (id, order_id, product_name, quantity, price) VALUES
(1, 1, 'Widget A', 2, 50.00),
(2, 1, 'Widget B', 1, 50.00),
(3, 2, 'Gadget X', 3, 75.00),
(4, 2, 'Gadget Y', 1, 50.50),
(5, 3, 'Tool Z', 1, 89.99),
(6, 4, 'Device Pro', 2, 210.00),
(7, 5, 'Accessory', 5, 11.05),
(8, 6, 'Component A', 4, 49.99),
(9, 7, 'Premium Widget', 3, 113.50),
(10, 8, 'Standard Tool', 2, 62.87);

-- Reset sequences
SELECT setval('orders_id_seq', (SELECT MAX(id) FROM orders));
SELECT setval('order_items_id_seq', (SELECT MAX(id) FROM order_items));
