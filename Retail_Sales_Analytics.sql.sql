-- Retail & Sales Analytics Project 

CREATE DATABASE IF NOT EXISTS retail_sales_db;
USE retail_sales_db;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    city VARCHAR(60) NOT NULL,
    state VARCHAR(60) NOT NULL,
    signup_date DATE NOT NULL,
    customer_segment VARCHAR(20) NOT NULL
);
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(60) NOT NULL UNIQUE
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    unit_cost DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(20) NOT NULL,
    ship_date DATE NULL,
    shipping_city VARCHAR(60) NOT NULL,
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    discount_pct DECIMAL(4,2) NOT NULL,
    gross_amount DECIMAL(12,2) NOT NULL,
    discount_amount DECIMAL(12,2) NOT NULL,
    net_amount DECIMAL(12,2) NOT NULL,
    CONSTRAINT fk_items_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_items_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    payment_method VARCHAR(30) NOT NULL,
    payment_amount DECIMAL(12,2) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    CONSTRAINT fk_payments_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Insert 150 rows into customers

INSERT INTO `customers` (`customer_id`, `customer_name`, `email`, `city`, `state`, `signup_date`, `customer_segment`) VALUES
(4, 'Kiara Patel', 'customer0004@example.com', 'Kochi', 'Kerala', '2022-06-25', 'Premium'),
(5, 'Aditya Chopra', 'customer0005@example.com', 'Nagpur', 'Maharashtra', '2022-09-15', 'Regular'),
(9, 'Diya Malhotra', 'customer0009@example.com', 'Chennai', 'Tamil Nadu', '2024-11-25', 'Regular'),
(11, 'Ayaan Saxena', 'customer0011@example.com', 'Bengaluru', 'Karnataka', '2023-03-28', 'Regular'),
(12, 'Kabir Verma', 'customer0012@example.com', 'Kolkata', 'West Bengal', '2023-04-14', 'Regular'),
(15, 'Sneha Saxena', 'customer0015@example.com', 'Kolkata', 'West Bengal', '2025-03-26', 'Regular'),
(17, 'Saanvi Yadav', 'customer0017@example.com', 'Chennai', 'Tamil Nadu', '2024-05-17', 'Regular'),
(18, 'Nisha Verma', 'customer0018@example.com', 'Nagpur', 'Maharashtra', '2025-10-11', 'Premium'),
(21, 'Pari Singh', 'customer0021@example.com', 'Bengaluru', 'Karnataka', '2024-05-14', 'Regular'),
(22, 'Ayaan Patel', 'customer0022@example.com', 'Surat', 'Gujarat', '2024-06-26', 'New'),
(23, 'Riya Gupta', 'customer0023@example.com', 'Nagpur', 'Maharashtra', '2022-04-14', 'Premium'),
(24, 'Neha Sharma', 'customer0024@example.com', 'Bengaluru', 'Karnataka', '2022-07-11', 'New'),
(25, 'Ayaan Khan', 'customer0025@example.com', 'Nagpur', 'Maharashtra', '2024-04-12', 'Regular'),
(26, 'Amit Joshi', 'customer0026@example.com', 'Pune', 'Maharashtra', '2022-05-01', 'Regular'),
(28, 'Nisha Chopra', 'customer0028@example.com', 'Kolkata', 'West Bengal', '2025-09-17', 'Premium'),
(29, 'Reyansh Das', 'customer0029@example.com', 'Mumbai', 'Maharashtra', '2023-03-22', 'New'),
(30, 'Nisha Chopra', 'customer0030@example.com', 'Hyderabad', 'Telangana', '2022-05-05', 'Premium'),
(32, 'Ira Khan', 'customer0032@example.com', 'Nagpur', 'Maharashtra', '2022-04-27', 'New'),
(37, 'Ananya Rao', 'customer0037@example.com', 'Bengaluru', 'Karnataka', '2023-02-23', 'Premium'),
(38, 'Ayaan Rao', 'customer0038@example.com', 'Jaipur', 'Rajasthan', '2024-03-21', 'Regular'),
(39, 'Ishaan Malhotra', 'customer0039@example.com', 'Chennai', 'Tamil Nadu', '2023-10-10', 'New'),
(40, 'Aditya Sharma', 'customer0040@example.com', 'Kochi', 'Kerala', '2024-07-27', 'Premium'),
(44, 'Ishaan Soni', 'customer0044@example.com', 'Kolkata', 'West Bengal', '2025-09-01', 'Regular'),
(47, 'Nisha Chopra', 'customer0047@example.com', 'Indore', 'Madhya Pradesh', '2022-11-15', 'Regular'),
(50, 'Amit Verma', 'customer0050@example.com', 'Kochi', 'Kerala', '2022-07-09', 'Premium'),
(51, 'Krishna Verma', 'customer0051@example.com', 'Nagpur', 'Maharashtra', '2022-01-08', 'Regular'),
(53, 'Ishita Shah', 'customer0053@example.com', 'Bengaluru', 'Karnataka', '2025-02-22', 'Regular'),
(54, 'Priya Singh', 'customer0054@example.com', 'Indore', 'Madhya Pradesh', '2025-01-22', 'Regular'),
(55, 'Kiara Chopra', 'customer0055@example.com', 'Jaipur', 'Rajasthan', '2022-10-31', 'Regular'),
(56, 'Ishaan Yadav', 'customer0056@example.com', 'Bhopal', 'Madhya Pradesh', '2022-03-23', 'New'),
(59, 'Sneha Mehta', 'customer0059@example.com', 'Kochi', 'Kerala', '2022-11-29', 'New'),
(60, 'Sai Shah', 'customer0060@example.com', 'Lucknow', 'Uttar Pradesh', '2022-02-20', 'Regular'),
(61, 'Ananya Shah', 'customer0061@example.com', 'Kochi', 'Kerala', '2025-10-03', 'New'),
(63, 'Aadhya Verma', 'customer0063@example.com', 'Indore', 'Madhya Pradesh', '2024-08-21', 'Regular'),
(65, 'Amit Mehta', 'customer0065@example.com', 'Lucknow', 'Uttar Pradesh', '2023-04-02', 'Regular'),
(67, 'Krishna Yadav', 'customer0067@example.com', 'Lucknow', 'Uttar Pradesh', '2025-08-06', 'Regular'),
(68, 'Neha Chopra', 'customer0068@example.com', 'Chennai', 'Tamil Nadu', '2023-11-10', 'New'),
(71, 'Rahul Mishra', 'customer0071@example.com', 'Kolkata', 'West Bengal', '2024-06-12', 'Premium'),
(72, 'Vihaan Joshi', 'customer0072@example.com', 'Bengaluru', 'Karnataka', '2025-03-26', 'Regular'),
(74, 'Riya Jain', 'customer0074@example.com', 'Lucknow', 'Uttar Pradesh', '2024-01-16', 'Regular'),
(76, 'Vihaan Das', 'customer0076@example.com', 'Nagpur', 'Maharashtra', '2024-11-04', 'Regular'),
(77, 'Ananya Joshi', 'customer0077@example.com', 'Ahmedabad', 'Gujarat', '2023-08-29', 'Premium'),
(79, 'Meera Saxena', 'customer0079@example.com', 'Mumbai', 'Maharashtra', '2023-09-09', 'Regular'),
(81, 'Kiara Soni', 'customer0081@example.com', 'Lucknow', 'Uttar Pradesh', '2025-09-02', 'Regular'),
(86, 'Aarav Verma', 'customer0086@example.com', 'Mumbai', 'Maharashtra', '2023-05-17', 'New'),
(87, 'Amit Patel', 'customer0087@example.com', 'Hyderabad', 'Telangana', '2024-07-21', 'Regular'),
(88, 'Kiara Jain', 'customer0088@example.com', 'Chennai', 'Tamil Nadu', '2024-02-26', 'Regular'),
(90, 'Sai Nair', 'customer0090@example.com', 'Pune', 'Maharashtra', '2024-08-09', 'Regular'),
(92, 'Rohan Nair', 'customer0092@example.com', 'Surat', 'Gujarat', '2025-02-18', 'Premium'),
(95, 'Nisha Kapoor', 'customer0095@example.com', 'Mumbai', 'Maharashtra', '2024-07-10', 'Regular'),
(97, 'Krishna Malhotra', 'customer0097@example.com', 'Pune', 'Maharashtra', '2022-06-08', 'Premium'),
(98, 'Krishna Mishra', 'customer0098@example.com', 'Pune', 'Maharashtra', '2023-10-17', 'New'),
(103, 'Amit Saxena', 'customer0103@example.com', 'Bhopal', 'Madhya Pradesh', '2024-02-19', 'Regular'),
(104, 'Ishaan Joshi', 'customer0104@example.com', 'Jaipur', 'Rajasthan', '2024-05-08', 'Regular'),
(108, 'Arjun Soni', 'customer0108@example.com', 'Kochi', 'Kerala', '2024-12-29', 'Regular'),
(112, 'Kavya Joshi', 'customer0112@example.com', 'Jaipur', 'Rajasthan', '2023-07-24', 'New'),
(113, 'Saanvi Rao', 'customer0113@example.com', 'Nagpur', 'Maharashtra', '2022-06-17', 'Regular'),
(114, 'Riya Verma', 'customer0114@example.com', 'Kolkata', 'West Bengal', '2023-12-18', 'Regular'),
(116, 'Neha Sharma', 'customer0116@example.com', 'Pune', 'Maharashtra', '2025-06-26', 'Regular'),
(117, 'Myra Gupta', 'customer0117@example.com', 'Mumbai', 'Maharashtra', '2025-03-01', 'New'),
(119, 'Nisha Gupta', 'customer0119@example.com', 'Hyderabad', 'Telangana', '2022-12-02', 'New'),
(126, 'Amit Shah', 'customer0126@example.com', 'Bhopal', 'Madhya Pradesh', '2024-09-30', 'Regular'),
(132, 'Kavya Malhotra', 'customer0132@example.com', 'Pune', 'Maharashtra', '2025-03-13', 'Premium'),
(133, 'Ananya Sharma', 'customer0133@example.com', 'Ahmedabad', 'Gujarat', '2024-10-09', 'New'),
(134, 'Myra Jain', 'customer0134@example.com', 'Mumbai', 'Maharashtra', '2023-12-28', 'New'),
(135, 'Krishna Soni', 'customer0135@example.com', 'Jaipur', 'Rajasthan', '2023-07-20', 'Premium'),
(136, 'Reyansh Patel', 'customer0136@example.com', 'Bengaluru', 'Karnataka', '2023-05-10', 'Premium'),
(138, 'Pari Sharma', 'customer0138@example.com', 'Surat', 'Gujarat', '2022-07-10', 'Regular'),
(144, 'Sai Jain', 'customer0144@example.com', 'Kolkata', 'West Bengal', '2023-03-20', 'Premium'),
(146, 'Neha Jain', 'customer0146@example.com', 'Indore', 'Madhya Pradesh', '2023-08-30', 'Regular'),
(147, 'Ishaan Sharma', 'customer0147@example.com', 'Mumbai', 'Maharashtra', '2024-12-29', 'Regular'),
(148, 'Vivaan Chopra', 'customer0148@example.com', 'Bhopal', 'Madhya Pradesh', '2023-08-22', 'Premium'),
(151, 'Vivaan Rao', 'customer0151@example.com', 'Mumbai', 'Maharashtra', '2024-09-05', 'Regular'),
(152, 'Aadhya Kapoor', 'customer0152@example.com', 'Indore', 'Madhya Pradesh', '2022-06-01', 'Premium'),
(153, 'Vivaan Singh', 'customer0153@example.com', 'Chennai', 'Tamil Nadu', '2022-11-02', 'New'),
(154, 'Aditya Mehta', 'customer0154@example.com', 'Delhi', 'Delhi', '2022-08-31', 'Premium'),
(155, 'Meera Soni', 'customer0155@example.com', 'Ahmedabad', 'Gujarat', '2025-06-20', 'Regular'),
(156, 'Aadhya Malhotra', 'customer0156@example.com', 'Bengaluru', 'Karnataka', '2024-06-25', 'Regular'),
(158, 'Nisha Gupta', 'customer0158@example.com', 'Hyderabad', 'Telangana', '2023-03-02', 'Premium'),
(162, 'Ishita Das', 'customer0162@example.com', 'Delhi', 'Delhi', '2024-07-18', 'Regular'),
(170, 'Nisha Mishra', 'customer0170@example.com', 'Ahmedabad', 'Gujarat', '2025-05-21', 'Regular'),
(174, 'Krishna Khan', 'customer0174@example.com', 'Kochi', 'Kerala', '2025-04-13', 'Regular'),
(177, 'Myra Das', 'customer0177@example.com', 'Kolkata', 'West Bengal', '2025-09-18', 'New'),
(182, 'Meera Kapoor', 'customer0182@example.com', 'Jaipur', 'Rajasthan', '2025-07-04', 'Regular'),
(185, 'Meera Mehta', 'customer0185@example.com', 'Chennai', 'Tamil Nadu', '2022-11-21', 'Regular'),
(186, 'Riya Shah', 'customer0186@example.com', 'Bhopal', 'Madhya Pradesh', '2022-07-10', 'Regular'),
(187, 'Sneha Gupta', 'customer0187@example.com', 'Nagpur', 'Maharashtra', '2024-08-03', 'New'),
(188, 'Neha Singh', 'customer0188@example.com', 'Chennai', 'Tamil Nadu', '2024-10-17', 'New'),
(189, 'Ira Rao', 'customer0189@example.com', 'Delhi', 'Delhi', '2024-04-30', 'New'),
(190, 'Ayaan Malhotra', 'customer0190@example.com', 'Surat', 'Gujarat', '2025-02-02', 'Regular'),
(191, 'Sneha Soni', 'customer0191@example.com', 'Pune', 'Maharashtra', '2024-11-06', 'Premium'),
(192, 'Amit Patel', 'customer0192@example.com', 'Mumbai', 'Maharashtra', '2023-07-20', 'New'),
(196, 'Ananya Chopra', 'customer0196@example.com', 'Jaipur', 'Rajasthan', '2025-01-17', 'Regular'),
(197, 'Ananya Jain', 'customer0197@example.com', 'Kochi', 'Kerala', '2023-05-05', 'Premium'),
(200, 'Neha Singh', 'customer0200@example.com', 'Lucknow', 'Uttar Pradesh', '2024-10-11', 'New'),
(201, 'Ira Saxena', 'customer0201@example.com', 'Mumbai', 'Maharashtra', '2023-11-11', 'New'),
(202, 'Amit Malhotra', 'customer0202@example.com', 'Nagpur', 'Maharashtra', '2022-07-24', 'Regular'),
(203, 'Aarav Singh', 'customer0203@example.com', 'Surat', 'Gujarat', '2024-04-19', 'New'),
(204, 'Aditya Kapoor', 'customer0204@example.com', 'Mumbai', 'Maharashtra', '2023-06-27', 'Regular'),
(211, 'Ishaan Yadav', 'customer0211@example.com', 'Bhopal', 'Madhya Pradesh', '2024-02-07', 'Regular'),
(212, 'Ira Shah', 'customer0212@example.com', 'Pune', 'Maharashtra', '2025-03-05', 'Premium'),
(213, 'Sai Khan', 'customer0213@example.com', 'Mumbai', 'Maharashtra', '2022-06-11', 'Premium'),
(214, 'Meera Mehta', 'customer0214@example.com', 'Ahmedabad', 'Gujarat', '2024-10-16', 'New'),
(215, 'Ayaan Malhotra', 'customer0215@example.com', 'Mumbai', 'Maharashtra', '2025-07-30', 'Regular'),
(217, 'Riya Khan', 'customer0217@example.com', 'Chennai', 'Tamil Nadu', '2022-06-01', 'Regular'),
(221, 'Diya Saxena', 'customer0221@example.com', 'Hyderabad', 'Telangana', '2023-08-29', 'New'),
(222, 'Aarav Joshi', 'customer0222@example.com', 'Delhi', 'Delhi', '2023-07-17', 'Regular'),
(225, 'Ayaan Jain', 'customer0225@example.com', 'Jaipur', 'Rajasthan', '2025-06-25', 'Regular'),
(227, 'Kabir Verma', 'customer0227@example.com', 'Chennai', 'Tamil Nadu', '2023-09-25', 'New'),
(229, 'Ananya Shah', 'customer0229@example.com', 'Delhi', 'Delhi', '2022-12-26', 'Regular'),
(233, 'Aditya Singh', 'customer0233@example.com', 'Surat', 'Gujarat', '2023-04-08', 'New'),
(235, 'Aadhya Sharma', 'customer0235@example.com', 'Lucknow', 'Uttar Pradesh', '2023-06-26', 'Regular'),
(236, 'Diya Rao', 'customer0236@example.com', 'Surat', 'Gujarat', '2025-04-12', 'Regular'),
(237, 'Diya Gupta', 'customer0237@example.com', 'Chennai', 'Tamil Nadu', '2025-10-14', 'Regular'),
(238, 'Meera Chopra', 'customer0238@example.com', 'Bhopal', 'Madhya Pradesh', '2023-11-03', 'New'),
(243, 'Diya Chopra', 'customer0243@example.com', 'Surat', 'Gujarat', '2024-05-08', 'Premium'),
(244, 'Arjun Shah', 'customer0244@example.com', 'Kolkata', 'West Bengal', '2025-09-03', 'Regular'),
(247, 'Diya Gupta', 'customer0247@example.com', 'Nagpur', 'Maharashtra', '2024-01-23', 'Regular'),
(248, 'Diya Verma', 'customer0248@example.com', 'Chennai', 'Tamil Nadu', '2024-03-26', 'Regular'),
(249, 'Amit Malhotra', 'customer0249@example.com', 'Indore', 'Madhya Pradesh', '2022-07-07', 'Premium'),
(250, 'Kabir Soni', 'customer0250@example.com', 'Chennai', 'Tamil Nadu', '2022-02-13', 'Regular'),
(251, 'Ayaan Singh', 'customer0251@example.com', 'Jaipur', 'Rajasthan', '2025-03-02', 'Regular'),
(252, 'Kavya Chopra', 'customer0252@example.com', 'Nagpur', 'Maharashtra', '2023-03-01', 'Premium'),
(253, 'Amit Mehta', 'customer0253@example.com', 'Nagpur', 'Maharashtra', '2023-11-04', 'New'),
(256, 'Rohan Sharma', 'customer0256@example.com', 'Indore', 'Madhya Pradesh', '2022-09-27', 'Regular'),
(259, 'Vihaan Patel', 'customer0259@example.com', 'Bengaluru', 'Karnataka', '2024-09-02', 'Regular'),
(262, 'Kabir Sharma', 'customer0262@example.com', 'Surat', 'Gujarat', '2022-05-05', 'New'),
(264, 'Pari Patel', 'customer0264@example.com', 'Kochi', 'Kerala', '2022-06-15', 'Regular'),
(265, 'Aditya Singh', 'customer0265@example.com', 'Mumbai', 'Maharashtra', '2023-07-18', 'Premium'),
(266, 'Riya Mishra', 'customer0266@example.com', 'Hyderabad', 'Telangana', '2024-02-20', 'New'),
(267, 'Ishaan Malhotra', 'customer0267@example.com', 'Bengaluru', 'Karnataka', '2024-11-01', 'Premium'),
(269, 'Riya Jain', 'customer0269@example.com', 'Lucknow', 'Uttar Pradesh', '2024-05-30', 'Regular'),
(270, 'Saanvi Mishra', 'customer0270@example.com', 'Pune', 'Maharashtra', '2024-07-17', 'Regular'),
(274, 'Diya Singh', 'customer0274@example.com', 'Kolkata', 'West Bengal', '2025-02-13', 'Regular'),
(275, 'Riya Mishra', 'customer0275@example.com', 'Bengaluru', 'Karnataka', '2025-10-04', 'Regular'),
(277, 'Ishaan Yadav', 'customer0277@example.com', 'Hyderabad', 'Telangana', '2022-08-01', 'Premium'),
(285, 'Arjun Saxena', 'customer0285@example.com', 'Nagpur', 'Maharashtra', '2025-09-08', 'Regular'),
(286, 'Nisha Sharma', 'customer0286@example.com', 'Mumbai', 'Maharashtra', '2022-07-07', 'Premium'),
(287, 'Aadhya Shah', 'customer0287@example.com', 'Pune', 'Maharashtra', '2024-07-18', 'Regular'),
(288, 'Ishaan Mishra', 'customer0288@example.com', 'Jaipur', 'Rajasthan', '2025-03-08', 'Premium'),
(289, 'Vivaan Singh', 'customer0289@example.com', 'Kochi', 'Kerala', '2022-11-19', 'New'),
(291, 'Myra Soni', 'customer0291@example.com', 'Ahmedabad', 'Gujarat', '2024-06-24', 'Regular'),
(293, 'Ishaan Saxena', 'customer0293@example.com', 'Indore', 'Madhya Pradesh', '2024-09-23', 'Regular'),
(294, 'Vivaan Mehta', 'customer0294@example.com', 'Delhi', 'Delhi', '2024-03-20', 'New'),
(295, 'Aarav Jain', 'customer0295@example.com', 'Bhopal', 'Madhya Pradesh', '2023-09-10', 'New'),
(296, 'Arjun Rao', 'customer0296@example.com', 'Lucknow', 'Uttar Pradesh', '2023-08-16', 'Regular'),
(297, 'Myra Shah', 'customer0297@example.com', 'Bhopal', 'Madhya Pradesh', '2022-12-26', 'Regular'),
(298, 'Ishita Mehta', 'customer0298@example.com', 'Bengaluru', 'Karnataka', '2024-10-21', 'Premium'),
(299, 'Rahul Yadav', 'customer0299@example.com', 'Chennai', 'Tamil Nadu', '2022-05-28', 'Regular'),
(300, 'Vivaan Shah', 'customer0300@example.com', 'Kolkata', 'West Bengal', '2022-02-08', 'Regular');


-- Insert 10 rows into categories

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Electronics'),
(2, 'Home & Kitchen'),
(3, 'Clothing'),
(4, 'Beauty'),
(5, 'Sports'),
(6, 'Books'),
(7, 'Toys'),
(8, 'Furniture'),
(9, 'Groceries'),
(10, 'Accessories');


-- Insert 60 rows into products

INSERT INTO `products` (`product_id`, `product_name`, `category_id`, `unit_price`, `unit_cost`) VALUES
(1, 'Wireless Mouse', 1, 5597.39, 2725.95),
(2, 'Bluetooth Speaker', 1, 2663.99, 1445.21),
(3, 'USB-C Hub', 1, 6378.59, 4270.31),
(4, 'Keyboard', 1, 7632.05, 3849.17),
(5, 'Power Bank', 1, 3846.47, 1878.4),
(6, 'Headphones', 1, 2210.04, 1373.54),
(7, 'Water Bottle', 2, 347.71, 186.26),
(8, 'Mixer Grinder', 2, 4287.27, 2712.06),
(9, 'Cookware Set', 2, 1573.18, 1014.69),
(10, 'Storage Box', 2, 5295.6, 2551.52),
(11, 'Electric Kettle', 2, 5272.78, 3561.65),
(12, 'Bedsheet', 2, 2330.38, 1220.03),
(13, 'Cotton T-Shirt', 3, 3075.88, 1766.31),
(14, 'Jeans', 3, 568.06, 288.05),
(15, 'Casual Shirt', 3, 2757.58, 1789.79),
(16, 'Dress', 3, 2640.48, 1806.95),
(17, 'Hoodie', 3, 1854.6, 1395.54),
(18, 'Kurta', 3, 1397.13, 886.58),
(19, 'Face Wash', 4, 1509.82, 986.19),
(20, 'Moisturizer', 4, 1564.76, 1004.04),
(21, 'Sunscreen', 4, 1297.48, 639.44),
(22, 'Shampoo', 4, 486.65, 273.02),
(23, 'Lip Balm', 4, 234.73, 127.97),
(24, 'Perfume', 4, 270.8, 151.06),
(25, 'Yoga Mat', 5, 4223.03, 2458.45),
(26, 'Dumbbells', 5, 2563.63, 1380.93),
(27, 'Cricket Bat', 5, 1918.61, 1424.11),
(28, 'Running Shoes', 5, 4300.22, 2797.54),
(29, 'Skipping Rope', 5, 1319.62, 902.83),
(30, 'Gym Bag', 5, 1271.27, 745.28),
(31, 'Fiction Novel', 6, 1188.69, 783.58),
(32, 'Data Analytics Book', 6, 721.51, 484.63),
(33, 'Cookbook', 6, 1030.28, 718.39),
(34, 'Biography', 6, 367.37, 179.64),
(35, 'Exam Guide', 6, 460.69, 255.67),
(36, 'Notebook Set', 6, 347.86, 258.81),
(37, 'Building Blocks', 7, 2213.17, 1257.32),
(38, 'Puzzle Set', 7, 1700.62, 1004.69),
(39, 'Remote Car', 7, 2301.75, 1400.57),
(40, 'Board Game', 7, 794.52, 436.24),
(41, 'Soft Toy', 7, 1482.37, 820.59),
(42, 'Art Kit', 7, 1536.24, 1123.59),
(43, 'Study Table', 8, 6132.15, 3320.01),
(44, 'Office Chair', 8, 13967.74, 8697.26),
(45, 'Bookshelf', 8, 2090.91, 1031.22),
(46, 'Side Table', 8, 2336.4, 1531.94),
(47, 'Shoe Rack', 8, 11276.24, 6745.5),
(48, 'Desk Lamp', 8, 1732.21, 1016.55),
(49, 'Coffee Pack', 9, 1594.14, 1001.36),
(50, 'Green Tea', 9, 1556.33, 1122.14),
(51, 'Dry Fruits', 9, 107.34, 73.18),
(52, 'Olive Oil', 9, 1119.38, 705.6),
(53, 'Breakfast Cereal', 9, 492.91, 325.06),
(54, 'Honey Jar', 9, 258.44, 155.51),
(55, 'Backpack', 10, 2350.56, 1756.03),
(56, 'Wallet', 10, 4397.89, 2435.33),
(57, 'Sunglasses', 10, 2577.84, 1366.31),
(58, 'Watch', 10, 4576.25, 3312.04),
(59, 'Belt', 10, 1597.46, 1052.58),
(60, 'Phone Case', 10, 3103.51, 1622.5);


-- Insert 500 rows into orders

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `order_status`, `ship_date`, `shipping_city`) VALUES
(2, 59, '2024-02-12', 'Cancelled', NULL, 'Kochi'),
(3, 186, '2026-06-13', 'Delivered', '2026-06-15', 'Bhopal'),
(5, 262, '2025-12-16', 'Delivered', '2025-12-19', 'Surat'),
(6, 53, '2025-06-08', 'Delivered', '2025-06-10', 'Bengaluru'),
(9, 29, '2024-05-31', 'Delivered', '2024-06-05', 'Mumbai'),
(10, 47, '2026-02-26', 'Shipped', '2026-02-27', 'Indore'),
(11, 293, '2025-01-20', 'Delivered', '2025-01-21', 'Indore'),
(12, 53, '2025-12-04', 'Delivered', '2025-12-05', 'Bengaluru'),
(13, 225, '2024-11-21', 'Delivered', '2024-11-27', 'Jaipur'),
(15, 77, '2024-06-15', 'Delivered', '2024-06-22', 'Ahmedabad'),
(16, 44, '2026-02-10', 'Delivered', '2026-02-12', 'Kolkata'),
(17, 217, '2026-01-11', 'Cancelled', NULL, 'Chennai'),
(19, 277, '2024-03-18', 'Delivered', '2024-03-25', 'Hyderabad'),
(22, 189, '2026-06-21', 'Delivered', '2026-06-28', 'Delhi'),
(23, 103, '2024-10-10', 'Delivered', '2024-10-16', 'Bhopal'),
(24, 53, '2024-09-12', 'Delivered', '2024-09-15', 'Bengaluru'),
(26, 28, '2026-10-25', 'Delivered', '2026-10-29', 'Kolkata'),
(30, 148, '2025-09-08', 'Delivered', '2025-09-16', 'Bhopal'),
(33, 44, '2026-01-08', 'Delivered', '2026-01-09', 'Kolkata'),
(38, 23, '2025-02-12', 'Delivered', '2025-02-19', 'Nagpur'),
(39, 243, '2024-03-15', 'Delivered', '2024-03-16', 'Surat'),
(40, 170, '2024-09-11', 'Delivered', '2024-09-19', 'Ahmedabad'),
(47, 79, '2026-07-10', 'Delivered', '2026-07-13', 'Mumbai'),
(48, 188, '2025-10-05', 'Delivered', '2025-10-08', 'Chennai'),
(50, 252, '2024-09-08', 'Delivered', '2024-09-16', 'Nagpur'),
(52, 90, '2026-01-10', 'Delivered', '2026-01-13', 'Pune'),
(53, 253, '2026-01-09', 'Shipped', '2026-01-14', 'Nagpur'),
(55, 295, '2024-09-13', 'Delivered', '2024-09-19', 'Bhopal'),
(57, 266, '2025-09-14', 'Delivered', '2025-09-20', 'Hyderabad'),
(58, 146, '2024-06-10', 'Delivered', '2024-06-13', 'Indore'),
(60, 88, '2025-11-22', 'Shipped', '2025-11-23', 'Chennai'),
(61, 24, '2025-06-26', 'Delivered', '2025-06-27', 'Bengaluru'),
(63, 38, '2024-05-02', 'Delivered', '2024-05-08', 'Jaipur'),
(64, 74, '2025-10-15', 'Returned', '2025-10-18', 'Lucknow'),
(65, 264, '2024-08-05', 'Delivered', '2024-08-09', 'Kochi'),
(68, 158, '2024-02-17', 'Delivered', '2024-02-21', 'Hyderabad'),
(70, 275, '2024-08-08', 'Delivered', '2024-08-15', 'Bengaluru'),
(71, 24, '2024-04-14', 'Delivered', '2024-04-16', 'Bengaluru'),
(72, 259, '2025-07-26', 'Delivered', '2025-07-29', 'Bengaluru'),
(73, 202, '2025-11-25', 'Delivered', '2025-12-02', 'Nagpur'),
(74, 21, '2024-03-20', 'Delivered', '2024-03-28', 'Bengaluru'),
(78, 243, '2025-04-11', 'Delivered', '2025-04-18', 'Surat'),
(87, 104, '2025-07-09', 'Delivered', '2025-07-13', 'Jaipur'),
(89, 71, '2024-11-19', 'Shipped', '2024-11-23', 'Kolkata'),
(91, 294, '2024-03-17', 'Shipped', '2024-03-19', 'Delhi'),
(93, 5, '2024-08-07', 'Delivered', '2024-08-15', 'Nagpur'),
(94, 259, '2025-07-12', 'Delivered', '2025-07-20', 'Bengaluru'),
(95, 132, '2025-01-16', 'Delivered', '2025-01-20', 'Pune'),
(98, 155, '2024-01-24', 'Delivered', '2024-01-26', 'Ahmedabad'),
(99, 158, '2026-04-10', 'Shipped', '2026-04-13', 'Hyderabad'),
(103, 32, '2025-02-18', 'Delivered', '2025-02-26', 'Nagpur'),
(108, 147, '2025-01-03', 'Returned', '2025-01-10', 'Mumbai'),
(109, 196, '2026-02-12', 'Delivered', '2026-02-15', 'Jaipur'),
(112, 236, '2024-11-13', 'Delivered', '2024-11-15', 'Surat'),
(113, 215, '2024-02-02', 'Delivered', '2024-02-10', 'Mumbai'),
(116, 155, '2024-10-20', 'Delivered', '2024-10-25', 'Ahmedabad'),
(117, 286, '2024-12-24', 'Delivered', '2024-12-30', 'Mumbai'),
(118, 196, '2025-10-14', 'Delivered', '2025-10-17', 'Jaipur'),
(119, 243, '2025-04-06', 'Shipped', '2025-04-07', 'Surat'),
(120, 212, '2024-10-01', 'Delivered', '2024-10-03', 'Pune'),
(121, 190, '2025-01-25', 'Delivered', '2025-01-26', 'Surat'),
(122, 97, '2025-03-20', 'Delivered', '2025-03-21', 'Pune'),
(125, 134, '2026-10-15', 'Delivered', '2026-10-21', 'Mumbai'),
(126, 190, '2026-04-27', 'Delivered', '2026-04-28', 'Surat'),
(129, 87, '2025-12-22', 'Delivered', '2025-12-23', 'Hyderabad'),
(131, 119, '2024-11-05', 'Delivered', '2024-11-13', 'Hyderabad'),
(133, 147, '2026-10-25', 'Shipped', '2026-10-27', 'Mumbai'),
(134, 50, '2024-10-31', 'Delivered', '2024-11-06', 'Kochi'),
(137, 5, '2024-12-16', 'Delivered', '2024-12-22', 'Nagpur'),
(140, 162, '2025-02-28', 'Delivered', '2025-03-07', 'Delhi'),
(141, 154, '2025-05-07', 'Delivered', '2025-05-13', 'Delhi'),
(142, 72, '2024-06-09', 'Delivered', '2024-06-16', 'Bengaluru'),
(143, 39, '2026-03-23', 'Delivered', '2026-03-31', 'Chennai'),
(145, 152, '2025-05-19', 'Delivered', '2025-05-22', 'Indore'),
(146, 200, '2026-01-08', 'Delivered', '2026-01-14', 'Lucknow'),
(150, 267, '2026-02-18', 'Delivered', '2026-02-21', 'Bengaluru'),
(151, 86, '2025-07-19', 'Delivered', '2025-07-24', 'Mumbai'),
(154, 154, '2025-02-15', 'Delivered', '2025-02-21', 'Delhi'),
(155, 252, '2025-05-11', 'Shipped', '2025-05-14', 'Nagpur'),
(156, 289, '2025-01-03', 'Cancelled', NULL, 'Kochi'),
(157, 108, '2025-08-19', 'Shipped', '2025-08-23', 'Kochi'),
(158, 256, '2025-09-12', 'Delivered', '2025-09-19', 'Indore'),
(160, 215, '2024-03-16', 'Shipped', '2024-03-21', 'Mumbai'),
(167, 56, '2024-12-02', 'Delivered', '2024-12-05', 'Bhopal'),
(173, 153, '2024-06-22', 'Delivered', '2024-06-24', 'Chennai'),
(174, 192, '2024-10-16', 'Delivered', '2024-10-23', 'Mumbai'),
(176, 28, '2026-01-05', 'Delivered', '2026-01-12', 'Kolkata'),
(178, 86, '2024-03-04', 'Delivered', '2024-03-08', 'Mumbai'),
(179, 148, '2026-07-25', 'Delivered', '2026-07-27', 'Bhopal'),
(180, 59, '2026-01-21', 'Delivered', '2026-01-29', 'Kochi'),
(181, 112, '2024-07-28', 'Delivered', '2024-07-29', 'Jaipur'),
(185, 294, '2024-07-14', 'Delivered', '2024-07-15', 'Delhi'),
(189, 298, '2024-07-09', 'Delivered', '2024-07-15', 'Bengaluru'),
(192, 51, '2026-07-30', 'Delivered', '2026-08-07', 'Nagpur'),
(196, 40, '2025-04-08', 'Delivered', '2025-04-14', 'Kochi'),
(197, 217, '2024-09-27', 'Delivered', '2024-09-29', 'Chennai'),
(199, 74, '2024-01-18', 'Delivered', '2024-01-22', 'Lucknow'),
(203, 266, '2025-01-21', 'Delivered', '2025-01-25', 'Hyderabad'),
(206, 38, '2024-05-18', 'Cancelled', NULL, 'Jaipur'),
(209, 201, '2024-05-15', 'Cancelled', NULL, 'Mumbai'),
(210, 30, '2024-06-25', 'Delivered', '2024-06-26', 'Hyderabad'),
(212, 265, '2025-06-14', 'Shipped', '2025-06-17', 'Mumbai'),
(213, 61, '2024-03-01', 'Delivered', '2024-03-06', 'Kochi'),
(217, 215, '2025-10-21', 'Delivered', '2025-10-23', 'Mumbai'),
(218, 191, '2026-10-25', 'Delivered', '2026-10-26', 'Pune'),
(221, 189, '2026-10-07', 'Delivered', '2026-10-11', 'Delhi'),
(222, 4, '2026-04-19', 'Delivered', '2026-04-20', 'Kochi'),
(225, 212, '2026-02-01', 'Delivered', '2026-02-04', 'Pune'),
(226, 202, '2024-05-07', 'Delivered', '2024-05-12', 'Nagpur'),
(228, 300, '2024-11-14', 'Delivered', '2024-11-16', 'Kolkata'),
(230, 156, '2024-03-23', 'Delivered', '2024-03-27', 'Bengaluru'),
(231, 203, '2024-04-10', 'Returned', '2024-04-11', 'Surat'),
(234, 133, '2024-06-02', 'Cancelled', NULL, 'Ahmedabad'),
(236, 203, '2024-03-01', 'Delivered', '2024-03-04', 'Surat'),
(237, 144, '2024-10-31', 'Delivered', '2024-11-05', 'Kolkata'),
(239, 270, '2024-02-09', 'Delivered', '2024-02-17', 'Pune'),
(241, 144, '2026-08-24', 'Returned', '2026-08-27', 'Kolkata'),
(245, 97, '2026-10-05', 'Delivered', '2026-10-06', 'Pune'),
(250, 250, '2025-10-11', 'Delivered', '2025-10-17', 'Chennai'),
(251, 90, '2025-09-20', 'Delivered', '2025-09-21', 'Pune'),
(252, 294, '2024-03-07', 'Shipped', '2024-03-12', 'Delhi'),
(255, 132, '2024-08-09', 'Delivered', '2024-08-16', 'Pune'),
(256, 212, '2026-02-14', 'Shipped', '2026-02-19', 'Pune'),
(257, 116, '2026-07-13', 'Delivered', '2026-07-19', 'Pune'),
(258, 54, '2025-12-01', 'Delivered', '2025-12-03', 'Indore'),
(260, 28, '2025-11-09', 'Delivered', '2025-11-14', 'Kolkata'),
(262, 28, '2024-01-08', 'Delivered', '2024-01-16', 'Kolkata'),
(263, 50, '2025-02-27', 'Delivered', '2025-03-01', 'Kochi'),
(264, 204, '2026-09-28', 'Delivered', '2026-10-05', 'Mumbai'),
(266, 116, '2025-07-04', 'Delivered', '2025-07-06', 'Pune'),
(268, 215, '2026-08-30', 'Delivered', '2026-09-06', 'Mumbai'),
(269, 18, '2024-10-28', 'Delivered', '2024-10-31', 'Nagpur'),
(274, 289, '2024-07-25', 'Shipped', '2024-07-29', 'Kochi'),
(275, 197, '2026-09-21', 'Delivered', '2026-09-28', 'Kochi'),
(277, 191, '2025-11-22', 'Delivered', '2025-11-30', 'Pune'),
(280, 192, '2024-04-25', 'Delivered', '2024-05-02', 'Mumbai'),
(281, 269, '2024-02-29', 'Delivered', '2024-03-01', 'Lucknow'),
(282, 17, '2024-04-13', 'Delivered', '2024-04-21', 'Chennai'),
(283, 204, '2024-09-10', 'Delivered', '2024-09-18', 'Mumbai'),
(284, 243, '2025-12-17', 'Delivered', '2025-12-19', 'Surat'),
(285, 15, '2024-04-11', 'Returned', '2024-04-15', 'Kolkata'),
(286, 116, '2025-02-27', 'Delivered', '2025-02-28', 'Pune'),
(287, 68, '2024-12-20', 'Delivered', '2024-12-25', 'Chennai'),
(291, 134, '2025-09-03', 'Delivered', '2025-09-04', 'Mumbai'),
(293, 215, '2026-03-06', 'Returned', '2026-03-10', 'Mumbai'),
(294, 114, '2026-09-01', 'Delivered', '2026-09-04', 'Kolkata'),
(300, 74, '2025-01-04', 'Delivered', '2025-01-07', 'Lucknow'),
(301, 30, '2026-07-14', 'Delivered', '2026-07-17', 'Hyderabad'),
(307, 97, '2026-04-06', 'Returned', '2026-04-10', 'Pune'),
(308, 12, '2026-10-30', 'Delivered', '2026-10-31', 'Kolkata');

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `order_status`, `ship_date`, `shipping_city`) VALUES
(310, 60, '2026-06-28', 'Delivered', '2026-07-01', 'Lucknow'),
(315, 253, '2024-07-03', 'Delivered', '2024-07-08', 'Nagpur'),
(316, 119, '2025-08-29', 'Shipped', '2025-08-30', 'Hyderabad'),
(321, 54, '2026-09-15', 'Delivered', '2026-09-22', 'Indore'),
(322, 15, '2024-09-24', 'Shipped', '2024-09-28', 'Kolkata'),
(328, 229, '2024-08-31', 'Delivered', '2024-09-07', 'Delhi'),
(330, 288, '2026-07-23', 'Delivered', '2026-07-27', 'Jaipur'),
(332, 114, '2025-11-30', 'Shipped', '2025-12-05', 'Kolkata'),
(333, 192, '2024-08-05', 'Delivered', '2024-08-12', 'Mumbai'),
(335, 174, '2026-04-28', 'Delivered', '2026-04-30', 'Kochi'),
(336, 235, '2026-10-29', 'Delivered', '2026-10-30', 'Lucknow'),
(337, 222, '2026-09-16', 'Cancelled', NULL, 'Delhi'),
(338, 297, '2024-09-19', 'Delivered', '2024-09-25', 'Bhopal'),
(339, 197, '2025-05-23', 'Returned', '2025-05-31', 'Kochi'),
(340, 71, '2025-09-04', 'Delivered', '2025-09-08', 'Kolkata'),
(341, 108, '2025-08-18', 'Delivered', '2025-08-21', 'Kochi'),
(343, 274, '2026-05-15', 'Delivered', '2026-05-18', 'Kolkata'),
(345, 32, '2025-08-27', 'Delivered', '2025-09-04', 'Nagpur'),
(347, 25, '2026-02-20', 'Returned', '2026-02-26', 'Nagpur'),
(348, 28, '2025-05-29', 'Shipped', '2025-06-02', 'Kolkata'),
(350, 39, '2024-12-21', 'Delivered', '2024-12-26', 'Chennai'),
(351, 136, '2024-11-25', 'Delivered', '2024-11-28', 'Bengaluru'),
(352, 79, '2025-10-22', 'Delivered', '2025-10-27', 'Mumbai'),
(353, 294, '2026-01-03', 'Delivered', '2026-01-06', 'Delhi'),
(356, 5, '2025-12-09', 'Delivered', '2025-12-13', 'Nagpur'),
(361, 37, '2024-11-10', 'Delivered', '2024-11-12', 'Bengaluru'),
(367, 152, '2024-10-22', 'Returned', '2024-10-28', 'Indore'),
(369, 108, '2025-12-05', 'Shipped', '2025-12-07', 'Kochi'),
(370, 95, '2025-06-01', 'Shipped', '2025-06-02', 'Mumbai'),
(373, 249, '2025-11-03', 'Delivered', '2025-11-09', 'Indore'),
(379, 77, '2026-03-14', 'Delivered', '2026-03-19', 'Ahmedabad'),
(381, 72, '2024-11-22', 'Delivered', '2024-11-25', 'Bengaluru'),
(382, 248, '2024-03-23', 'Delivered', '2024-03-29', 'Chennai'),
(383, 22, '2025-02-27', 'Delivered', '2025-03-07', 'Surat'),
(388, 77, '2024-11-18', 'Delivered', '2024-11-22', 'Ahmedabad'),
(389, 170, '2024-08-20', 'Delivered', '2024-08-23', 'Ahmedabad'),
(390, 211, '2025-05-14', 'Delivered', '2025-05-15', 'Bhopal'),
(391, 76, '2024-12-06', 'Cancelled', NULL, 'Nagpur'),
(392, 289, '2024-02-08', 'Shipped', '2024-02-09', 'Kochi'),
(394, 299, '2025-01-07', 'Delivered', '2025-01-13', 'Chennai'),
(396, 50, '2026-09-01', 'Shipped', '2026-09-06', 'Kochi'),
(397, 61, '2026-09-14', 'Delivered', '2026-09-15', 'Kochi'),
(398, 221, '2026-05-11', 'Delivered', '2026-05-15', 'Hyderabad'),
(399, 196, '2024-07-19', 'Delivered', '2024-07-21', 'Jaipur'),
(401, 61, '2024-01-15', 'Shipped', '2024-01-19', 'Kochi'),
(402, 55, '2026-05-22', 'Shipped', '2026-05-26', 'Jaipur'),
(404, 190, '2026-09-17', 'Delivered', '2026-09-24', 'Surat'),
(405, 71, '2024-08-31', 'Delivered', '2024-09-03', 'Kolkata'),
(407, 200, '2024-01-11', 'Delivered', '2024-01-18', 'Lucknow'),
(409, 267, '2024-04-27', 'Delivered', '2024-05-05', 'Bengaluru'),
(410, 104, '2025-08-08', 'Delivered', '2025-08-12', 'Jaipur'),
(411, 87, '2024-03-14', 'Returned', '2024-03-16', 'Hyderabad'),
(415, 151, '2024-08-27', 'Shipped', '2024-09-01', 'Mumbai'),
(416, 227, '2026-09-17', 'Returned', '2026-09-25', 'Chennai'),
(417, 236, '2024-02-26', 'Delivered', '2024-03-01', 'Surat'),
(423, 253, '2024-01-14', 'Delivered', '2024-01-22', 'Nagpur'),
(424, 162, '2025-07-16', 'Cancelled', NULL, 'Delhi'),
(425, 204, '2024-09-19', 'Delivered', '2024-09-20', 'Mumbai'),
(433, 154, '2024-04-07', 'Delivered', '2024-04-12', 'Delhi'),
(435, 11, '2024-09-05', 'Delivered', '2024-09-08', 'Bengaluru'),
(436, 182, '2026-09-25', 'Delivered', '2026-09-30', 'Jaipur'),
(439, 203, '2026-06-30', 'Delivered', '2026-07-08', 'Surat'),
(441, 86, '2024-07-29', 'Delivered', '2024-07-30', 'Mumbai'),
(446, 274, '2025-12-12', 'Delivered', '2025-12-17', 'Kolkata'),
(447, 212, '2024-11-14', 'Shipped', '2024-11-16', 'Pune'),
(448, 147, '2024-01-18', 'Delivered', '2024-01-23', 'Mumbai'),
(451, 135, '2026-05-14', 'Shipped', '2026-05-19', 'Jaipur'),
(454, 26, '2024-02-15', 'Delivered', '2024-02-23', 'Pune'),
(456, 191, '2024-03-05', 'Cancelled', NULL, 'Pune'),
(459, 236, '2024-07-11', 'Delivered', '2024-07-16', 'Surat'),
(461, 153, '2026-01-08', 'Delivered', '2026-01-10', 'Chennai'),
(463, 22, '2026-08-31', 'Delivered', '2026-09-04', 'Surat'),
(464, 256, '2025-11-24', 'Delivered', '2025-11-25', 'Indore'),
(465, 79, '2024-08-07', 'Returned', '2024-08-13', 'Mumbai'),
(470, 187, '2025-05-04', 'Returned', '2025-05-11', 'Nagpur'),
(471, 269, '2026-10-15', 'Delivered', '2026-10-22', 'Lucknow'),
(473, 17, '2024-08-07', 'Delivered', '2024-08-14', 'Chennai'),
(474, 251, '2025-06-08', 'Delivered', '2025-06-09', 'Jaipur'),
(476, 30, '2025-06-28', 'Shipped', '2025-06-29', 'Hyderabad'),
(477, 266, '2024-07-26', 'Delivered', '2024-07-30', 'Hyderabad'),
(478, 92, '2026-04-30', 'Delivered', '2026-05-08', 'Surat'),
(483, 18, '2024-02-03', 'Delivered', '2024-02-08', 'Nagpur'),
(485, 262, '2024-11-12', 'Delivered', '2024-11-17', 'Surat'),
(487, 40, '2025-10-26', 'Shipped', '2025-10-31', 'Kochi'),
(488, 154, '2026-02-20', 'Delivered', '2026-02-26', 'Delhi'),
(489, 214, '2024-09-03', 'Delivered', '2024-09-04', 'Ahmedabad'),
(491, 114, '2024-04-13', 'Returned', '2024-04-15', 'Kolkata'),
(492, 222, '2026-03-18', 'Delivered', '2026-03-19', 'Delhi'),
(494, 287, '2026-09-26', 'Delivered', '2026-09-30', 'Pune'),
(495, 37, '2026-05-30', 'Delivered', '2026-06-06', 'Bengaluru'),
(498, 103, '2026-02-04', 'Delivered', '2026-02-05', 'Bhopal'),
(499, 76, '2025-08-12', 'Delivered', '2025-08-20', 'Nagpur'),
(500, 12, '2025-03-04', 'Delivered', '2025-03-09', 'Kolkata'),
(502, 88, '2025-08-04', 'Delivered', '2025-08-12', 'Chennai'),
(503, 5, '2026-03-06', 'Cancelled', NULL, 'Nagpur'),
(504, 56, '2025-08-22', 'Delivered', '2025-08-29', 'Bhopal'),
(505, 51, '2025-10-08', 'Delivered', '2025-10-12', 'Nagpur'),
(507, 81, '2025-12-11', 'Delivered', '2025-12-16', 'Lucknow'),
(511, 68, '2024-10-10', 'Delivered', '2024-10-13', 'Chennai'),
(512, 269, '2024-10-03', 'Delivered', '2024-10-06', 'Lucknow'),
(514, 212, '2025-09-13', 'Shipped', '2025-09-16', 'Pune'),
(515, 97, '2024-09-26', 'Delivered', '2024-10-01', 'Pune'),
(516, 291, '2025-04-17', 'Delivered', '2025-04-19', 'Ahmedabad'),
(519, 212, '2025-02-19', 'Cancelled', NULL, 'Pune'),
(520, 251, '2025-10-27', 'Delivered', '2025-10-28', 'Jaipur'),
(522, 56, '2026-07-24', 'Returned', '2026-07-31', 'Bhopal'),
(523, 21, '2026-03-04', 'Delivered', '2026-03-09', 'Bengaluru'),
(525, 28, '2024-10-18', 'Delivered', '2024-10-20', 'Kolkata'),
(526, 300, '2024-10-04', 'Delivered', '2024-10-12', 'Kolkata'),
(529, 262, '2024-11-23', 'Delivered', '2024-11-29', 'Surat'),
(530, 77, '2024-10-23', 'Delivered', '2024-10-28', 'Ahmedabad'),
(531, 229, '2025-01-05', 'Delivered', '2025-01-10', 'Delhi'),
(533, 244, '2026-04-19', 'Delivered', '2026-04-24', 'Kolkata'),
(535, 17, '2025-09-03', 'Delivered', '2025-09-06', 'Chennai'),
(536, 146, '2024-12-29', 'Delivered', '2024-12-30', 'Indore'),
(537, 154, '2026-01-24', 'Delivered', '2026-01-26', 'Delhi'),
(539, 108, '2024-04-29', 'Delivered', '2024-05-01', 'Kochi'),
(540, 148, '2025-10-10', 'Delivered', '2025-10-13', 'Bhopal'),
(541, 289, '2026-10-16', 'Delivered', '2026-10-21', 'Kochi'),
(545, 59, '2025-11-13', 'Delivered', '2025-11-14', 'Kochi'),
(548, 212, '2024-04-24', 'Delivered', '2024-04-30', 'Pune'),
(549, 275, '2025-03-02', 'Cancelled', NULL, 'Bengaluru'),
(551, 200, '2024-08-27', 'Delivered', '2024-09-02', 'Lucknow'),
(555, 269, '2025-11-01', 'Shipped', '2025-11-06', 'Lucknow'),
(557, 23, '2024-06-27', 'Delivered', '2024-07-02', 'Nagpur'),
(558, 296, '2025-10-01', 'Delivered', '2025-10-06', 'Lucknow'),
(561, 146, '2025-05-16', 'Shipped', '2025-05-21', 'Indore'),
(562, 26, '2024-02-29', 'Delivered', '2024-03-01', 'Pune'),
(565, 291, '2024-07-09', 'Delivered', '2024-07-17', 'Ahmedabad'),
(568, 244, '2025-12-20', 'Delivered', '2025-12-26', 'Kolkata'),
(571, 197, '2025-11-28', 'Delivered', '2025-12-05', 'Kochi'),
(573, 238, '2024-07-18', 'Cancelled', NULL, 'Bhopal'),
(574, 56, '2026-02-15', 'Delivered', '2026-02-19', 'Bhopal'),
(575, 298, '2024-01-01', 'Delivered', '2024-01-06', 'Bengaluru'),
(582, 9, '2026-09-23', 'Delivered', '2026-09-26', 'Chennai'),
(585, 4, '2026-10-17', 'Delivered', '2026-10-24', 'Kochi'),
(586, 296, '2024-03-09', 'Delivered', '2024-03-11', 'Lucknow'),
(587, 247, '2024-06-12', 'Returned', '2024-06-17', 'Nagpur'),
(588, 265, '2024-06-30', 'Delivered', '2024-07-02', 'Mumbai'),
(589, 277, '2025-10-01', 'Delivered', '2025-10-02', 'Hyderabad'),
(590, 233, '2026-08-18', 'Delivered', '2026-08-23', 'Surat'),
(591, 86, '2025-09-14', 'Delivered', '2025-09-22', 'Mumbai'),
(592, 87, '2024-04-15', 'Delivered', '2024-04-16', 'Hyderabad'),
(593, 249, '2024-09-16', 'Delivered', '2024-09-19', 'Indore'),
(595, 229, '2024-12-25', 'Delivered', '2024-12-26', 'Delhi'),
(596, 44, '2024-11-11', 'Delivered', '2024-11-18', 'Kolkata'),
(599, 200, '2025-06-21', 'Delivered', '2025-06-29', 'Lucknow'),
(600, 162, '2024-03-25', 'Delivered', '2024-04-01', 'Delhi'),
(604, 229, '2025-03-25', 'Delivered', '2025-03-27', 'Delhi'),
(605, 112, '2024-09-06', 'Shipped', '2024-09-08', 'Jaipur');

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `order_status`, `ship_date`, `shipping_city`) VALUES
(609, 136, '2026-06-21', 'Delivered', '2026-06-28', 'Bengaluru'),
(610, 252, '2024-10-21', 'Delivered', '2024-10-23', 'Nagpur'),
(611, 133, '2024-03-12', 'Delivered', '2024-03-20', 'Ahmedabad'),
(613, 295, '2026-10-01', 'Delivered', '2026-10-03', 'Bhopal'),
(616, 236, '2025-08-16', 'Delivered', '2025-08-23', 'Surat'),
(617, 98, '2026-03-09', 'Delivered', '2026-03-11', 'Pune'),
(618, 225, '2025-01-23', 'Delivered', '2025-01-27', 'Jaipur'),
(622, 24, '2024-09-24', 'Cancelled', NULL, 'Bengaluru'),
(624, 113, '2025-02-19', 'Returned', '2025-02-26', 'Nagpur'),
(628, 9, '2026-09-24', 'Cancelled', NULL, 'Chennai'),
(629, 146, '2026-09-01', 'Delivered', '2026-09-09', 'Indore'),
(631, 155, '2026-05-07', 'Delivered', '2026-05-09', 'Ahmedabad'),
(635, 54, '2024-04-17', 'Shipped', '2024-04-21', 'Indore'),
(636, 60, '2025-04-26', 'Delivered', '2025-04-30', 'Lucknow'),
(640, 104, '2024-09-17', 'Delivered', '2024-09-19', 'Jaipur'),
(641, 235, '2024-12-16', 'Delivered', '2024-12-19', 'Lucknow'),
(642, 88, '2025-04-15', 'Delivered', '2025-04-19', 'Chennai'),
(649, 190, '2026-08-08', 'Delivered', '2026-08-15', 'Surat'),
(653, 90, '2024-05-17', 'Delivered', '2024-05-23', 'Pune'),
(654, 277, '2026-09-06', 'Shipped', '2026-09-08', 'Hyderabad'),
(655, 116, '2025-12-23', 'Delivered', '2025-12-24', 'Pune'),
(656, 191, '2026-07-15', 'Delivered', '2026-07-20', 'Pune'),
(657, 189, '2024-05-14', 'Delivered', '2024-05-21', 'Delhi'),
(658, 148, '2024-08-11', 'Delivered', '2024-08-14', 'Bhopal'),
(661, 267, '2025-11-18', 'Delivered', '2025-11-24', 'Bengaluru'),
(663, 134, '2026-09-18', 'Shipped', '2026-09-20', 'Mumbai'),
(665, 79, '2025-05-02', 'Delivered', '2025-05-10', 'Mumbai'),
(667, 191, '2024-11-28', 'Delivered', '2024-12-06', 'Pune'),
(669, 152, '2025-08-16', 'Returned', '2025-08-19', 'Indore'),
(670, 227, '2024-08-18', 'Delivered', '2024-08-20', 'Chennai'),
(672, 270, '2025-07-23', 'Shipped', '2025-07-24', 'Pune'),
(673, 202, '2026-10-01', 'Cancelled', NULL, 'Nagpur'),
(675, 177, '2025-09-22', 'Delivered', '2025-09-30', 'Kolkata'),
(676, 213, '2026-06-25', 'Returned', '2026-07-02', 'Mumbai'),
(677, 213, '2024-06-25', 'Returned', '2024-07-01', 'Mumbai'),
(679, 291, '2024-10-07', 'Delivered', '2024-10-15', 'Ahmedabad'),
(681, 135, '2026-08-25', 'Delivered', '2026-08-28', 'Jaipur'),
(682, 126, '2024-09-01', 'Returned', '2024-09-07', 'Bhopal'),
(683, 247, '2026-06-12', 'Delivered', '2026-06-14', 'Nagpur'),
(687, 86, '2025-10-22', 'Delivered', '2025-10-27', 'Mumbai'),
(688, 186, '2025-12-21', 'Delivered', '2025-12-27', 'Bhopal'),
(692, 156, '2024-08-30', 'Delivered', '2024-09-03', 'Bengaluru'),
(693, 65, '2024-09-23', 'Delivered', '2024-09-25', 'Lucknow'),
(695, 61, '2025-06-02', 'Delivered', '2025-06-04', 'Kochi'),
(698, 297, '2024-01-29', 'Returned', '2024-02-01', 'Bhopal'),
(700, 95, '2024-08-07', 'Delivered', '2024-08-11', 'Mumbai'),
(701, 117, '2024-08-19', 'Delivered', '2024-08-22', 'Mumbai'),
(702, 185, '2025-08-13', 'Delivered', '2025-08-15', 'Chennai'),
(703, 146, '2025-09-30', 'Delivered', '2025-10-07', 'Indore'),
(706, 74, '2026-03-31', 'Delivered', '2026-04-03', 'Lucknow'),
(707, 187, '2025-11-24', 'Delivered', '2025-11-28', 'Nagpur'),
(708, 256, '2025-07-13', 'Cancelled', NULL, 'Indore'),
(710, 63, '2026-09-29', 'Delivered', '2026-10-01', 'Indore'),
(712, 156, '2024-07-16', 'Delivered', '2024-07-24', 'Bengaluru'),
(713, 104, '2026-10-16', 'Delivered', '2026-10-17', 'Jaipur'),
(715, 17, '2025-09-12', 'Delivered', '2025-09-17', 'Chennai'),
(716, 200, '2024-08-12', 'Delivered', '2024-08-20', 'Lucknow'),
(717, 288, '2024-11-16', 'Delivered', '2024-11-23', 'Jaipur'),
(719, 299, '2025-11-29', 'Returned', '2025-12-06', 'Chennai'),
(720, 29, '2025-05-15', 'Delivered', '2025-05-17', 'Mumbai'),
(723, 293, '2025-10-22', 'Delivered', '2025-10-26', 'Indore'),
(725, 39, '2025-03-14', 'Returned', '2025-03-21', 'Chennai'),
(727, 108, '2024-06-06', 'Shipped', '2024-06-10', 'Kochi'),
(728, 277, '2025-02-13', 'Delivered', '2025-02-16', 'Hyderabad'),
(734, 238, '2026-06-12', 'Delivered', '2026-06-17', 'Bhopal'),
(735, 15, '2025-07-22', 'Shipped', '2025-07-26', 'Kolkata'),
(736, 29, '2024-06-20', 'Delivered', '2024-06-27', 'Mumbai'),
(737, 47, '2024-10-14', 'Delivered', '2024-10-16', 'Indore'),
(738, 298, '2025-05-30', 'Delivered', '2025-06-05', 'Bengaluru'),
(739, 300, '2026-03-09', 'Cancelled', NULL, 'Kolkata'),
(740, 74, '2024-12-24', 'Delivered', '2024-12-25', 'Lucknow'),
(741, 274, '2024-08-19', 'Delivered', '2024-08-24', 'Kolkata'),
(742, 186, '2026-01-23', 'Returned', '2026-01-24', 'Bhopal'),
(743, 28, '2025-05-05', 'Delivered', '2025-05-11', 'Kolkata'),
(744, 63, '2025-04-29', 'Cancelled', NULL, 'Indore'),
(747, 212, '2025-11-12', 'Shipped', '2025-11-14', 'Pune'),
(748, 134, '2024-05-15', 'Shipped', '2024-05-18', 'Mumbai'),
(749, 15, '2024-04-16', 'Delivered', '2024-04-19', 'Kolkata'),
(751, 211, '2025-10-16', 'Delivered', '2025-10-19', 'Bhopal'),
(761, 217, '2025-06-08', 'Delivered', '2025-06-12', 'Chennai'),
(763, 190, '2024-03-25', 'Delivered', '2024-03-31', 'Surat'),
(764, 68, '2025-10-11', 'Delivered', '2025-10-17', 'Chennai'),
(766, 136, '2025-10-03', 'Delivered', '2025-10-11', 'Bengaluru'),
(768, 134, '2026-08-14', 'Cancelled', NULL, 'Mumbai'),
(769, 227, '2026-09-20', 'Delivered', '2026-09-23', 'Chennai'),
(771, 300, '2024-01-09', 'Delivered', '2024-01-11', 'Kolkata'),
(774, 138, '2024-01-12', 'Delivered', '2024-01-20', 'Surat'),
(776, 37, '2026-02-20', 'Delivered', '2026-02-27', 'Bengaluru'),
(777, 11, '2025-03-02', 'Delivered', '2025-03-05', 'Bengaluru'),
(778, 153, '2026-06-04', 'Cancelled', NULL, 'Chennai'),
(779, 68, '2024-07-15', 'Delivered', '2024-07-22', 'Chennai'),
(780, 138, '2026-05-16', 'Delivered', '2026-05-19', 'Surat'),
(782, 270, '2024-06-20', 'Cancelled', NULL, 'Pune'),
(783, 154, '2024-09-18', 'Delivered', '2024-09-25', 'Delhi'),
(785, 238, '2025-06-02', 'Delivered', '2025-06-03', 'Bhopal'),
(787, 233, '2026-07-10', 'Returned', '2026-07-13', 'Surat'),
(788, 95, '2025-06-15', 'Delivered', '2025-06-16', 'Mumbai'),
(790, 185, '2026-03-19', 'Delivered', '2026-03-23', 'Chennai'),
(791, 9, '2025-01-20', 'Delivered', '2025-01-24', 'Chennai'),
(794, 300, '2025-02-16', 'Delivered', '2025-02-22', 'Kolkata'),
(795, 53, '2026-06-03', 'Delivered', '2026-06-08', 'Bengaluru'),
(796, 250, '2026-09-22', 'Cancelled', NULL, 'Chennai'),
(797, 119, '2024-05-04', 'Delivered', '2024-05-06', 'Hyderabad'),
(798, 214, '2026-08-27', 'Delivered', '2026-09-04', 'Ahmedabad'),
(801, 151, '2026-03-10', 'Delivered', '2026-03-16', 'Mumbai'),
(803, 103, '2026-10-04', 'Returned', '2026-10-09', 'Bhopal'),
(804, 108, '2024-04-06', 'Delivered', '2024-04-09', 'Kochi'),
(806, 133, '2025-12-28', 'Delivered', '2025-12-31', 'Ahmedabad'),
(808, 55, '2024-07-27', 'Delivered', '2024-07-29', 'Jaipur'),
(812, 126, '2026-05-13', 'Delivered', '2026-05-20', 'Bhopal'),
(813, 265, '2026-01-10', 'Delivered', '2026-01-12', 'Mumbai'),
(814, 174, '2026-04-02', 'Delivered', '2026-04-03', 'Kochi'),
(816, 215, '2025-09-15', 'Delivered', '2025-09-20', 'Mumbai'),
(818, 177, '2026-04-08', 'Delivered', '2026-04-14', 'Kolkata'),
(822, 25, '2024-09-12', 'Delivered', '2024-09-18', 'Nagpur'),
(824, 72, '2026-02-12', 'Delivered', '2026-02-16', 'Bengaluru'),
(825, 233, '2024-10-27', 'Delivered', '2024-10-28', 'Surat'),
(826, 67, '2025-03-15', 'Delivered', '2025-03-22', 'Lucknow'),
(827, 300, '2026-05-17', 'Cancelled', NULL, 'Kolkata'),
(828, 214, '2024-11-29', 'Delivered', '2024-12-02', 'Ahmedabad'),
(830, 190, '2024-08-31', 'Delivered', '2024-09-05', 'Surat'),
(832, 74, '2026-05-13', 'Shipped', '2026-05-15', 'Lucknow'),
(833, 251, '2024-09-07', 'Delivered', '2024-09-15', 'Jaipur'),
(835, 259, '2026-08-01', 'Delivered', '2026-08-07', 'Bengaluru'),
(841, 274, '2025-10-18', 'Shipped', '2025-10-19', 'Kolkata'),
(843, 51, '2024-12-10', 'Delivered', '2024-12-13', 'Nagpur'),
(847, 32, '2026-08-09', 'Delivered', '2026-08-13', 'Nagpur'),
(848, 138, '2024-07-26', 'Shipped', '2024-07-29', 'Surat'),
(851, 22, '2026-08-09', 'Delivered', '2026-08-12', 'Surat'),
(854, 203, '2024-09-08', 'Returned', '2024-09-15', 'Surat'),
(858, 285, '2026-09-28', 'Shipped', '2026-09-29', 'Nagpur'),
(865, 117, '2025-07-15', 'Returned', '2025-07-20', 'Mumbai'),
(866, 287, '2026-07-18', 'Delivered', '2026-07-19', 'Pune'),
(867, 222, '2026-04-13', 'Delivered', '2026-04-19', 'Delhi'),
(868, 23, '2025-04-04', 'Delivered', '2025-04-10', 'Nagpur'),
(872, 56, '2025-05-03', 'Shipped', '2025-05-08', 'Bhopal'),
(873, 38, '2026-06-17', 'Delivered', '2026-06-19', 'Jaipur'),
(874, 18, '2025-10-03', 'Shipped', '2025-10-04', 'Nagpur'),
(875, 29, '2026-06-03', 'Delivered', '2026-06-08', 'Mumbai'),
(877, 197, '2026-05-26', 'Delivered', '2026-05-27', 'Kochi'),
(878, 265, '2025-01-29', 'Delivered', '2025-02-02', 'Mumbai'),
(879, 65, '2025-06-08', 'Delivered', '2025-06-11', 'Lucknow'),
(880, 71, '2024-03-31', 'Delivered', '2024-04-06', 'Kolkata'),
(881, 299, '2024-10-25', 'Delivered', '2024-10-31', 'Chennai'),
(882, 266, '2024-10-23', 'Shipped', '2024-10-24', 'Hyderabad'),
(883, 177, '2025-02-14', 'Delivered', '2025-02-18', 'Kolkata'),
(884, 244, '2026-08-15', 'Delivered', '2026-08-21', 'Kolkata'),
(889, 300, '2026-01-07', 'Delivered', '2026-01-10', 'Kolkata'),
(890, 135, '2024-12-22', 'Delivered', '2024-12-23', 'Jaipur'),
(891, 135, '2024-07-26', 'Delivered', '2024-07-28', 'Jaipur');

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `order_status`, `ship_date`, `shipping_city`) VALUES
(892, 108, '2026-07-23', 'Delivered', '2026-07-30', 'Kochi'),
(894, 192, '2026-05-29', 'Delivered', '2026-06-02', 'Mumbai'),
(896, 300, '2026-09-28', 'Delivered', '2026-09-30', 'Kolkata'),
(898, 248, '2026-10-10', 'Delivered', '2026-10-11', 'Chennai'),
(899, 113, '2025-02-19', 'Delivered', '2025-02-26', 'Nagpur'),
(900, 293, '2026-02-05', 'Delivered', '2026-02-10', 'Indore'),
(901, 266, '2025-04-16', 'Delivered', '2025-04-23', 'Hyderabad'),
(903, 227, '2025-06-27', 'Delivered', '2025-06-29', 'Chennai'),
(906, 71, '2025-06-18', 'Shipped', '2025-06-22', 'Kolkata'),
(907, 297, '2024-01-25', 'Delivered', '2024-01-28', 'Bhopal'),
(909, 237, '2024-06-24', 'Delivered', '2024-07-01', 'Chennai'),
(910, 225, '2024-03-02', 'Delivered', '2024-03-03', 'Jaipur'),
(911, 182, '2025-04-06', 'Delivered', '2025-04-11', 'Jaipur'),
(913, 291, '2026-03-11', 'Delivered', '2026-03-18', 'Ahmedabad'),
(915, 54, '2024-12-29', 'Delivered', '2025-01-01', 'Indore'),
(917, 30, '2024-01-23', 'Delivered', '2024-01-26', 'Hyderabad'),
(919, 67, '2025-02-25', 'Delivered', '2025-02-28', 'Lucknow'),
(922, 237, '2024-03-21', 'Shipped', '2024-03-25', 'Chennai'),
(924, 197, '2025-01-10', 'Delivered', '2025-01-11', 'Kochi'),
(925, 81, '2025-08-20', 'Delivered', '2025-08-24', 'Lucknow'),
(936, 86, '2024-12-08', 'Shipped', '2024-12-11', 'Mumbai'),
(937, 98, '2025-02-28', 'Delivered', '2025-03-04', 'Pune'),
(939, 235, '2024-05-15', 'Delivered', '2024-05-16', 'Lucknow'),
(940, 112, '2025-09-09', 'Returned', '2025-09-12', 'Jaipur'),
(942, 90, '2025-10-13', 'Delivered', '2025-10-14', 'Pune'),
(943, 300, '2026-02-22', 'Delivered', '2026-02-23', 'Kolkata'),
(944, 11, '2024-09-11', 'Delivered', '2024-09-13', 'Bengaluru'),
(945, 71, '2026-10-18', 'Delivered', '2026-10-19', 'Kolkata'),
(947, 213, '2025-08-13', 'Delivered', '2025-08-19', 'Mumbai'),
(953, 247, '2026-01-06', 'Delivered', '2026-01-13', 'Nagpur'),
(958, 192, '2026-09-29', 'Delivered', '2026-09-30', 'Mumbai'),
(960, 251, '2026-01-24', 'Cancelled', NULL, 'Jaipur'),
(965, 158, '2026-04-22', 'Shipped', '2026-04-23', 'Hyderabad'),
(967, 158, '2024-12-10', 'Delivered', '2024-12-17', 'Hyderabad'),
(968, 214, '2025-08-13', 'Delivered', '2025-08-16', 'Ahmedabad'),
(969, 250, '2026-10-26', 'Shipped', '2026-10-28', 'Chennai'),
(973, 4, '2024-03-26', 'Delivered', '2024-03-31', 'Kochi'),
(977, 144, '2025-05-24', 'Delivered', '2025-06-01', 'Kolkata'),
(978, 212, '2025-01-19', 'Cancelled', NULL, 'Pune'),
(979, 9, '2026-01-07', 'Delivered', '2026-01-15', 'Chennai'),
(980, 249, '2024-06-15', 'Cancelled', NULL, 'Indore'),
(983, 229, '2026-09-14', 'Delivered', '2026-09-16', 'Delhi'),
(985, 113, '2025-06-11', 'Delivered', '2025-06-14', 'Nagpur'),
(989, 60, '2026-01-23', 'Delivered', '2026-01-24', 'Lucknow'),
(991, 65, '2025-03-30', 'Shipped', '2025-04-02', 'Lucknow'),
(992, 152, '2025-03-24', 'Delivered', '2025-03-27', 'Indore'),
(993, 18, '2025-10-17', 'Delivered', '2025-10-25', 'Nagpur'),
(995, 108, '2025-04-05', 'Shipped', '2025-04-07', 'Kochi'),
(996, 201, '2024-11-22', 'Delivered', '2024-11-30', 'Mumbai'),
(997, 201, '2024-05-27', 'Delivered', '2024-05-31', 'Mumbai');


-- Insert 500 rows into order_items

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount_pct`, `gross_amount`, `discount_amount`, `net_amount`) VALUES
(2, 2, 26, 4, 2563.63, 0.0, 10254.52, 0.0, 10254.52),
(3, 3, 6, 3, 2210.04, 0.0, 6630.12, 0.0, 6630.12),
(5, 5, 13, 1, 3075.88, 0.2, 3075.88, 615.18, 2460.7),
(6, 6, 10, 1, 5295.6, 0.1, 5295.6, 529.56, 4766.04),
(9, 9, 23, 1, 234.73, 0.05, 234.73, 11.74, 222.99),
(10, 10, 40, 1, 794.52, 0.1, 794.52, 79.45, 715.07),
(11, 11, 42, 1, 1536.24, 0.05, 1536.24, 76.81, 1459.43),
(12, 12, 52, 5, 1119.38, 0.0, 5596.9, 0.0, 5596.9),
(13, 13, 29, 1, 1319.62, 0.15, 1319.62, 197.94, 1121.68),
(15, 15, 22, 2, 486.65, 0.0, 973.3, 0.0, 973.3),
(16, 16, 20, 2, 1564.76, 0.0, 3129.52, 0.0, 3129.52),
(17, 17, 33, 1, 1030.28, 0.0, 1030.28, 0.0, 1030.28),
(19, 19, 54, 2, 258.44, 0.15, 516.88, 77.53, 439.35),
(22, 22, 44, 1, 13967.74, 0.0, 13967.74, 0.0, 13967.74),
(23, 23, 52, 3, 1119.38, 0.0, 3358.14, 0.0, 3358.14),
(24, 24, 46, 1, 2336.4, 0.1, 2336.4, 233.64, 2102.76),
(26, 26, 26, 1, 2563.63, 0.05, 2563.63, 128.18, 2435.45),
(30, 30, 16, 1, 2640.48, 0.0, 2640.48, 0.0, 2640.48),
(33, 33, 34, 1, 367.37, 0.05, 367.37, 18.37, 349.0),
(38, 38, 51, 3, 107.34, 0.0, 322.02, 0.0, 322.02),
(39, 39, 17, 2, 1854.6, 0.0, 3709.2, 0.0, 3709.2),
(40, 40, 18, 3, 1397.13, 0.05, 4191.39, 209.57, 3981.82),
(47, 47, 44, 4, 13967.74, 0.05, 55870.96, 2793.55, 53077.41),
(48, 48, 26, 2, 2563.63, 0.0, 5127.26, 0.0, 5127.26),
(50, 50, 13, 1, 3075.88, 0.0, 3075.88, 0.0, 3075.88),
(52, 52, 51, 2, 107.34, 0.0, 214.68, 0.0, 214.68),
(53, 53, 2, 2, 2663.99, 0.05, 5327.98, 266.4, 5061.58),
(55, 55, 5, 4, 3846.47, 0.1, 15385.88, 1538.59, 13847.29),
(57, 57, 10, 1, 5295.6, 0.0, 5295.6, 0.0, 5295.6),
(58, 58, 55, 1, 2350.56, 0.1, 2350.56, 235.06, 2115.5),
(60, 60, 43, 3, 6132.15, 0.1, 18396.45, 1839.65, 16556.8),
(61, 61, 42, 2, 1536.24, 0.1, 3072.48, 307.25, 2765.23),
(63, 63, 45, 1, 2090.91, 0.05, 2090.91, 104.55, 1986.36),
(64, 64, 21, 2, 1297.48, 0.15, 2594.96, 389.24, 2205.72),
(65, 65, 36, 1, 347.86, 0.05, 347.86, 17.39, 330.47),
(68, 68, 32, 1, 721.51, 0.05, 721.51, 36.08, 685.43),
(70, 70, 1, 1, 5597.39, 0.15, 5597.39, 839.61, 4757.78),
(71, 71, 26, 2, 2563.63, 0.0, 5127.26, 0.0, 5127.26),
(72, 72, 29, 3, 1319.62, 0.1, 3958.86, 395.89, 3562.97),
(73, 73, 24, 2, 270.8, 0.05, 541.6, 27.08, 514.52),
(74, 74, 3, 1, 6378.59, 0.0, 6378.59, 0.0, 6378.59),
(78, 78, 17, 2, 1854.6, 0.1, 3709.2, 370.92, 3338.28),
(87, 87, 53, 4, 492.91, 0.1, 1971.64, 197.16, 1774.48),
(89, 89, 1, 1, 5597.39, 0.15, 5597.39, 839.61, 4757.78),
(91, 91, 15, 4, 2757.58, 0.0, 11030.32, 0.0, 11030.32),
(93, 93, 20, 4, 1564.76, 0.0, 6259.04, 0.0, 6259.04),
(94, 94, 30, 1, 1271.27, 0.0, 1271.27, 0.0, 1271.27),
(95, 95, 46, 1, 2336.4, 0.0, 2336.4, 0.0, 2336.4),
(98, 98, 38, 1, 1700.62, 0.05, 1700.62, 85.03, 1615.59),
(99, 99, 11, 2, 5272.78, 0.15, 10545.56, 1581.83, 8963.73),
(103, 103, 54, 2, 258.44, 0.0, 516.88, 0.0, 516.88),
(108, 108, 27, 2, 1918.61, 0.1, 3837.22, 383.72, 3453.5),
(109, 109, 29, 1, 1319.62, 0.1, 1319.62, 131.96, 1187.66),
(112, 112, 23, 1, 234.73, 0.15, 234.73, 35.21, 199.52),
(113, 113, 40, 1, 794.52, 0.0, 794.52, 0.0, 794.52),
(116, 116, 57, 5, 2577.84, 0.05, 12889.2, 644.46, 12244.74),
(117, 117, 38, 2, 1700.62, 0.05, 3401.24, 170.06, 3231.18),
(118, 118, 51, 2, 107.34, 0.05, 214.68, 10.73, 203.95),
(119, 119, 16, 1, 2640.48, 0.1, 2640.48, 264.05, 2376.43),
(120, 120, 27, 1, 1918.61, 0.0, 1918.61, 0.0, 1918.61),
(121, 121, 6, 1, 2210.04, 0.05, 2210.04, 110.5, 2099.54),
(122, 122, 52, 1, 1119.38, 0.15, 1119.38, 167.91, 951.47),
(125, 125, 24, 1, 270.8, 0.15, 270.8, 40.62, 230.18),
(126, 126, 21, 1, 1297.48, 0.15, 1297.48, 194.62, 1102.86),
(129, 129, 47, 1, 11276.24, 0.1, 11276.24, 1127.62, 10148.62),
(131, 131, 5, 1, 3846.47, 0.05, 3846.47, 192.32, 3654.15),
(133, 133, 2, 3, 2663.99, 0.1, 7991.97, 799.2, 7192.77),
(134, 134, 34, 1, 367.37, 0.1, 367.37, 36.74, 330.63),
(137, 137, 45, 1, 2090.91, 0.15, 2090.91, 313.64, 1777.27),
(140, 140, 2, 2, 2663.99, 0.1, 5327.98, 532.8, 4795.18),
(141, 141, 11, 2, 5272.78, 0.15, 10545.56, 1581.83, 8963.73),
(142, 142, 51, 2, 107.34, 0.2, 214.68, 42.94, 171.74),
(143, 143, 22, 4, 486.65, 0.0, 1946.6, 0.0, 1946.6),
(145, 145, 52, 2, 1119.38, 0.0, 2238.76, 0.0, 2238.76),
(146, 146, 21, 1, 1297.48, 0.0, 1297.48, 0.0, 1297.48),
(150, 150, 11, 1, 5272.78, 0.0, 5272.78, 0.0, 5272.78),
(151, 151, 28, 1, 4300.22, 0.05, 4300.22, 215.01, 4085.21),
(154, 154, 21, 1, 1297.48, 0.0, 1297.48, 0.0, 1297.48),
(155, 155, 37, 1, 2213.17, 0.0, 2213.17, 0.0, 2213.17),
(156, 156, 13, 2, 3075.88, 0.1, 6151.76, 615.18, 5536.58),
(157, 157, 29, 3, 1319.62, 0.0, 3958.86, 0.0, 3958.86),
(158, 158, 9, 1, 1573.18, 0.1, 1573.18, 157.32, 1415.86),
(160, 160, 35, 3, 460.69, 0.05, 1382.07, 69.1, 1312.97),
(167, 167, 44, 4, 13967.74, 0.1, 55870.96, 5587.1, 50283.86),
(173, 173, 59, 2, 1597.46, 0.0, 3194.92, 0.0, 3194.92),
(174, 174, 45, 2, 2090.91, 0.05, 4181.82, 209.09, 3972.73),
(176, 176, 56, 4, 4397.89, 0.05, 17591.56, 879.58, 16711.98),
(178, 178, 6, 3, 2210.04, 0.0, 6630.12, 0.0, 6630.12),
(179, 179, 11, 2, 5272.78, 0.1, 10545.56, 1054.56, 9491.0),
(180, 180, 18, 2, 1397.13, 0.1, 2794.26, 279.43, 2514.83),
(181, 181, 28, 2, 4300.22, 0.1, 8600.44, 860.04, 7740.4),
(185, 185, 18, 1, 1397.13, 0.1, 1397.13, 139.71, 1257.42),
(189, 189, 1, 2, 5597.39, 0.05, 11194.78, 559.74, 10635.04),
(192, 192, 41, 1, 1482.37, 0.15, 1482.37, 222.36, 1260.01),
(196, 196, 9, 2, 1573.18, 0.05, 3146.36, 157.32, 2989.04),
(197, 197, 45, 1, 2090.91, 0.0, 2090.91, 0.0, 2090.91),
(199, 199, 5, 2, 3846.47, 0.0, 7692.94, 0.0, 7692.94),
(203, 203, 39, 2, 2301.75, 0.0, 4603.5, 0.0, 4603.5),
(206, 206, 2, 1, 2663.99, 0.0, 2663.99, 0.0, 2663.99),
(209, 209, 38, 1, 1700.62, 0.05, 1700.62, 85.03, 1615.59),
(210, 210, 16, 4, 2640.48, 0.0, 10561.92, 0.0, 10561.92),
(212, 212, 51, 1, 107.34, 0.0, 107.34, 0.0, 107.34),
(213, 213, 50, 1, 1556.33, 0.05, 1556.33, 77.82, 1478.51),
(217, 217, 15, 1, 2757.58, 0.15, 2757.58, 413.64, 2343.94),
(218, 218, 8, 2, 4287.27, 0.0, 8574.54, 0.0, 8574.54),
(221, 221, 38, 5, 1700.62, 0.1, 8503.1, 850.31, 7652.79),
(222, 222, 60, 1, 3103.51, 0.05, 3103.51, 155.18, 2948.33),
(225, 225, 45, 1, 2090.91, 0.1, 2090.91, 209.09, 1881.82),
(226, 226, 5, 1, 3846.47, 0.2, 3846.47, 769.29, 3077.18),
(228, 228, 7, 1, 347.71, 0.05, 347.71, 17.39, 330.32),
(230, 230, 53, 1, 492.91, 0.15, 492.91, 73.94, 418.97),
(231, 231, 33, 2, 1030.28, 0.0, 2060.56, 0.0, 2060.56),
(234, 234, 59, 1, 1597.46, 0.0, 1597.46, 0.0, 1597.46),
(236, 236, 32, 1, 721.51, 0.05, 721.51, 36.08, 685.43),
(237, 237, 29, 1, 1319.62, 0.1, 1319.62, 131.96, 1187.66),
(239, 239, 16, 5, 2640.48, 0.1, 13202.4, 1320.24, 11882.16),
(241, 241, 4, 2, 7632.05, 0.1, 15264.1, 1526.41, 13737.69),
(245, 245, 54, 2, 258.44, 0.0, 516.88, 0.0, 516.88),
(250, 250, 42, 1, 1536.24, 0.2, 1536.24, 307.25, 1228.99),
(251, 251, 25, 2, 4223.03, 0.0, 8446.06, 0.0, 8446.06),
(252, 252, 26, 1, 2563.63, 0.0, 2563.63, 0.0, 2563.63),
(255, 255, 51, 2, 107.34, 0.0, 214.68, 0.0, 214.68),
(256, 256, 32, 1, 721.51, 0.05, 721.51, 36.08, 685.43),
(257, 257, 11, 1, 5272.78, 0.15, 5272.78, 790.92, 4481.86),
(258, 258, 5, 1, 3846.47, 0.05, 3846.47, 192.32, 3654.15),
(260, 260, 7, 1, 347.71, 0.0, 347.71, 0.0, 347.71),
(262, 262, 24, 1, 270.8, 0.0, 270.8, 0.0, 270.8),
(263, 263, 2, 1, 2663.99, 0.0, 2663.99, 0.0, 2663.99),
(264, 264, 31, 3, 1188.69, 0.0, 3566.07, 0.0, 3566.07),
(266, 266, 54, 2, 258.44, 0.0, 516.88, 0.0, 516.88),
(268, 268, 35, 2, 460.69, 0.0, 921.38, 0.0, 921.38),
(269, 269, 33, 1, 1030.28, 0.1, 1030.28, 103.03, 927.25),
(274, 274, 50, 3, 1556.33, 0.15, 4668.99, 700.35, 3968.64),
(275, 275, 42, 2, 1536.24, 0.05, 3072.48, 153.62, 2918.86),
(277, 277, 2, 3, 2663.99, 0.0, 7991.97, 0.0, 7991.97),
(280, 280, 53, 2, 492.91, 0.0, 985.82, 0.0, 985.82),
(281, 281, 57, 1, 2577.84, 0.15, 2577.84, 386.68, 2191.16),
(282, 282, 30, 4, 1271.27, 0.1, 5085.08, 508.51, 4576.57),
(283, 283, 41, 2, 1482.37, 0.0, 2964.74, 0.0, 2964.74),
(284, 284, 38, 1, 1700.62, 0.15, 1700.62, 255.09, 1445.53),
(285, 285, 25, 1, 4223.03, 0.1, 4223.03, 422.3, 3800.73),
(286, 286, 44, 1, 13967.74, 0.05, 13967.74, 698.39, 13269.35),
(287, 287, 42, 2, 1536.24, 0.0, 3072.48, 0.0, 3072.48),
(291, 291, 42, 1, 1536.24, 0.05, 1536.24, 76.81, 1459.43),
(293, 293, 26, 2, 2563.63, 0.1, 5127.26, 512.73, 4614.53),
(294, 294, 44, 3, 13967.74, 0.1, 41903.22, 4190.32, 37712.9),
(300, 300, 21, 3, 1297.48, 0.05, 3892.44, 194.62, 3697.82),
(301, 301, 1, 1, 5597.39, 0.1, 5597.39, 559.74, 5037.65),
(307, 307, 11, 1, 5272.78, 0.0, 5272.78, 0.0, 5272.78),
(308, 308, 38, 1, 1700.62, 0.05, 1700.62, 85.03, 1615.59);

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount_pct`, `gross_amount`, `discount_amount`, `net_amount`) VALUES
(310, 310, 27, 1, 1918.61, 0.05, 1918.61, 95.93, 1822.68),
(315, 315, 10, 3, 5295.6, 0.0, 15886.8, 0.0, 15886.8),
(316, 316, 30, 1, 1271.27, 0.0, 1271.27, 0.0, 1271.27),
(321, 321, 27, 3, 1918.61, 0.1, 5755.83, 575.58, 5180.25),
(322, 322, 56, 2, 4397.89, 0.05, 8795.78, 439.79, 8355.99),
(328, 328, 21, 5, 1297.48, 0.1, 6487.4, 648.74, 5838.66),
(330, 330, 14, 4, 568.06, 0.05, 2272.24, 113.61, 2158.63),
(332, 332, 1, 1, 5597.39, 0.1, 5597.39, 559.74, 5037.65),
(333, 333, 45, 1, 2090.91, 0.0, 2090.91, 0.0, 2090.91),
(335, 335, 7, 1, 347.71, 0.1, 347.71, 34.77, 312.94),
(336, 336, 43, 1, 6132.15, 0.05, 6132.15, 306.61, 5825.54),
(337, 337, 54, 4, 258.44, 0.1, 1033.76, 103.38, 930.38),
(338, 338, 12, 1, 2330.38, 0.1, 2330.38, 233.04, 2097.34),
(339, 339, 27, 1, 1918.61, 0.2, 1918.61, 383.72, 1534.89),
(340, 340, 27, 3, 1918.61, 0.05, 5755.83, 287.79, 5468.04),
(341, 341, 40, 2, 794.52, 0.15, 1589.04, 238.36, 1350.68),
(343, 343, 19, 3, 1509.82, 0.05, 4529.46, 226.47, 4302.99),
(345, 345, 45, 1, 2090.91, 0.05, 2090.91, 104.55, 1986.36),
(347, 347, 60, 1, 3103.51, 0.2, 3103.51, 620.7, 2482.81),
(348, 348, 1, 1, 5597.39, 0.15, 5597.39, 839.61, 4757.78),
(350, 350, 12, 2, 2330.38, 0.0, 4660.76, 0.0, 4660.76),
(351, 351, 9, 2, 1573.18, 0.0, 3146.36, 0.0, 3146.36),
(352, 352, 60, 2, 3103.51, 0.1, 6207.02, 620.7, 5586.32),
(353, 353, 36, 1, 347.86, 0.1, 347.86, 34.79, 313.07),
(356, 356, 8, 1, 4287.27, 0.15, 4287.27, 643.09, 3644.18),
(361, 361, 48, 1, 1732.21, 0.1, 1732.21, 173.22, 1558.99),
(367, 367, 41, 1, 1482.37, 0.15, 1482.37, 222.36, 1260.01),
(369, 369, 48, 1, 1732.21, 0.15, 1732.21, 259.83, 1472.38),
(370, 370, 15, 1, 2757.58, 0.0, 2757.58, 0.0, 2757.58),
(373, 373, 29, 2, 1319.62, 0.0, 2639.24, 0.0, 2639.24),
(379, 379, 24, 1, 270.8, 0.1, 270.8, 27.08, 243.72),
(381, 381, 29, 1, 1319.62, 0.15, 1319.62, 197.94, 1121.68),
(382, 382, 23, 1, 234.73, 0.05, 234.73, 11.74, 222.99),
(383, 383, 43, 2, 6132.15, 0.1, 12264.3, 1226.43, 11037.87),
(388, 388, 12, 1, 2330.38, 0.1, 2330.38, 233.04, 2097.34),
(389, 389, 47, 2, 11276.24, 0.05, 22552.48, 1127.62, 21424.86),
(390, 390, 2, 1, 2663.99, 0.1, 2663.99, 266.4, 2397.59),
(391, 391, 4, 1, 7632.05, 0.0, 7632.05, 0.0, 7632.05),
(392, 392, 41, 3, 1482.37, 0.1, 4447.11, 444.71, 4002.4),
(394, 394, 53, 2, 492.91, 0.05, 985.82, 49.29, 936.53),
(396, 396, 12, 3, 2330.38, 0.1, 6991.14, 699.11, 6292.03),
(397, 397, 6, 2, 2210.04, 0.15, 4420.08, 663.01, 3757.07),
(398, 398, 34, 1, 367.37, 0.0, 367.37, 0.0, 367.37),
(399, 399, 23, 1, 234.73, 0.0, 234.73, 0.0, 234.73),
(401, 401, 34, 1, 367.37, 0.0, 367.37, 0.0, 367.37),
(402, 402, 10, 2, 5295.6, 0.0, 10591.2, 0.0, 10591.2),
(404, 404, 36, 1, 347.86, 0.0, 347.86, 0.0, 347.86),
(405, 405, 55, 2, 2350.56, 0.05, 4701.12, 235.06, 4466.06),
(407, 407, 41, 3, 1482.37, 0.15, 4447.11, 667.07, 3780.04),
(409, 409, 19, 4, 1509.82, 0.15, 6039.28, 905.89, 5133.39),
(410, 410, 55, 1, 2350.56, 0.1, 2350.56, 235.06, 2115.5),
(411, 411, 44, 1, 13967.74, 0.1, 13967.74, 1396.77, 12570.97),
(415, 415, 22, 3, 486.65, 0.2, 1459.95, 291.99, 1167.96),
(416, 416, 25, 2, 4223.03, 0.1, 8446.06, 844.61, 7601.45),
(417, 417, 58, 2, 4576.25, 0.0, 9152.5, 0.0, 9152.5),
(423, 423, 40, 2, 794.52, 0.05, 1589.04, 79.45, 1509.59),
(424, 424, 32, 2, 721.51, 0.2, 1443.02, 288.6, 1154.42),
(425, 425, 15, 1, 2757.58, 0.1, 2757.58, 275.76, 2481.82),
(433, 433, 17, 1, 1854.6, 0.1, 1854.6, 185.46, 1669.14),
(435, 435, 27, 1, 1918.61, 0.1, 1918.61, 191.86, 1726.75),
(436, 436, 21, 3, 1297.48, 0.05, 3892.44, 194.62, 3697.82),
(439, 439, 18, 3, 1397.13, 0.15, 4191.39, 628.71, 3562.68),
(441, 441, 26, 1, 2563.63, 0.15, 2563.63, 384.54, 2179.09),
(446, 446, 20, 2, 1564.76, 0.0, 3129.52, 0.0, 3129.52),
(447, 447, 17, 1, 1854.6, 0.0, 1854.6, 0.0, 1854.6),
(448, 448, 31, 2, 1188.69, 0.05, 2377.38, 118.87, 2258.51),
(451, 451, 6, 2, 2210.04, 0.05, 4420.08, 221.0, 4199.08),
(454, 454, 35, 1, 460.69, 0.0, 460.69, 0.0, 460.69),
(456, 456, 30, 1, 1271.27, 0.15, 1271.27, 190.69, 1080.58),
(459, 459, 48, 2, 1732.21, 0.2, 3464.42, 692.88, 2771.54),
(461, 461, 13, 3, 3075.88, 0.15, 9227.64, 1384.15, 7843.49),
(463, 463, 38, 2, 1700.62, 0.0, 3401.24, 0.0, 3401.24),
(464, 464, 6, 4, 2210.04, 0.2, 8840.16, 1768.03, 7072.13),
(465, 465, 45, 1, 2090.91, 0.0, 2090.91, 0.0, 2090.91),
(470, 470, 50, 1, 1556.33, 0.0, 1556.33, 0.0, 1556.33),
(471, 471, 44, 2, 13967.74, 0.0, 27935.48, 0.0, 27935.48),
(473, 473, 13, 2, 3075.88, 0.0, 6151.76, 0.0, 6151.76),
(474, 474, 34, 1, 367.37, 0.0, 367.37, 0.0, 367.37),
(476, 476, 53, 2, 492.91, 0.1, 985.82, 98.58, 887.24),
(477, 477, 7, 2, 347.71, 0.05, 695.42, 34.77, 660.65),
(478, 478, 36, 2, 347.86, 0.1, 695.72, 69.57, 626.15),
(483, 483, 19, 2, 1509.82, 0.2, 3019.64, 603.93, 2415.71),
(485, 485, 36, 1, 347.86, 0.05, 347.86, 17.39, 330.47),
(487, 487, 47, 3, 11276.24, 0.0, 33828.72, 0.0, 33828.72),
(488, 488, 3, 1, 6378.59, 0.0, 6378.59, 0.0, 6378.59),
(489, 489, 60, 3, 3103.51, 0.0, 9310.53, 0.0, 9310.53),
(491, 491, 10, 2, 5295.6, 0.2, 10591.2, 2118.24, 8472.96),
(492, 492, 19, 1, 1509.82, 0.0, 1509.82, 0.0, 1509.82),
(494, 494, 13, 1, 3075.88, 0.1, 3075.88, 307.59, 2768.29),
(495, 495, 18, 1, 1397.13, 0.15, 1397.13, 209.57, 1187.56),
(498, 498, 44, 1, 13967.74, 0.1, 13967.74, 1396.77, 12570.97),
(499, 499, 56, 1, 4397.89, 0.1, 4397.89, 439.79, 3958.1),
(500, 500, 22, 2, 486.65, 0.0, 973.3, 0.0, 973.3),
(502, 502, 4, 1, 7632.05, 0.1, 7632.05, 763.21, 6868.84),
(503, 503, 5, 2, 3846.47, 0.1, 7692.94, 769.29, 6923.65),
(504, 504, 2, 3, 2663.99, 0.1, 7991.97, 799.2, 7192.77),
(505, 505, 58, 2, 4576.25, 0.1, 9152.5, 915.25, 8237.25),
(507, 507, 2, 2, 2663.99, 0.05, 5327.98, 266.4, 5061.58),
(511, 511, 14, 2, 568.06, 0.1, 1136.12, 113.61, 1022.51),
(512, 512, 59, 1, 1597.46, 0.15, 1597.46, 239.62, 1357.84),
(514, 514, 27, 1, 1918.61, 0.15, 1918.61, 287.79, 1630.82),
(515, 515, 7, 1, 347.71, 0.1, 347.71, 34.77, 312.94),
(516, 516, 40, 2, 794.52, 0.0, 1589.04, 0.0, 1589.04),
(519, 519, 15, 2, 2757.58, 0.0, 5515.16, 0.0, 5515.16),
(520, 520, 45, 3, 2090.91, 0.15, 6272.73, 940.91, 5331.82),
(522, 522, 29, 3, 1319.62, 0.0, 3958.86, 0.0, 3958.86),
(523, 523, 36, 2, 347.86, 0.1, 695.72, 69.57, 626.15),
(525, 525, 45, 1, 2090.91, 0.1, 2090.91, 209.09, 1881.82),
(526, 526, 58, 1, 4576.25, 0.0, 4576.25, 0.0, 4576.25),
(529, 529, 40, 1, 794.52, 0.05, 794.52, 39.73, 754.79),
(530, 530, 11, 1, 5272.78, 0.1, 5272.78, 527.28, 4745.5),
(531, 531, 19, 1, 1509.82, 0.0, 1509.82, 0.0, 1509.82),
(533, 533, 30, 1, 1271.27, 0.1, 1271.27, 127.13, 1144.14),
(535, 535, 43, 1, 6132.15, 0.0, 6132.15, 0.0, 6132.15),
(536, 536, 40, 4, 794.52, 0.1, 3178.08, 317.81, 2860.27),
(537, 537, 21, 3, 1297.48, 0.15, 3892.44, 583.87, 3308.57),
(539, 539, 40, 1, 794.52, 0.1, 794.52, 79.45, 715.07),
(540, 540, 28, 1, 4300.22, 0.1, 4300.22, 430.02, 3870.2),
(541, 541, 32, 2, 721.51, 0.0, 1443.02, 0.0, 1443.02),
(545, 545, 44, 1, 13967.74, 0.1, 13967.74, 1396.77, 12570.97),
(548, 548, 60, 3, 3103.51, 0.0, 9310.53, 0.0, 9310.53),
(549, 549, 2, 2, 2663.99, 0.0, 5327.98, 0.0, 5327.98),
(551, 551, 12, 3, 2330.38, 0.1, 6991.14, 699.11, 6292.03),
(555, 555, 20, 1, 1564.76, 0.15, 1564.76, 234.71, 1330.05),
(557, 557, 44, 1, 13967.74, 0.15, 13967.74, 2095.16, 11872.58),
(558, 558, 49, 2, 1594.14, 0.0, 3188.28, 0.0, 3188.28),
(561, 561, 37, 1, 2213.17, 0.0, 2213.17, 0.0, 2213.17),
(562, 562, 9, 1, 1573.18, 0.1, 1573.18, 157.32, 1415.86),
(565, 565, 9, 3, 1573.18, 0.15, 4719.54, 707.93, 4011.61),
(568, 568, 8, 1, 4287.27, 0.15, 4287.27, 643.09, 3644.18),
(571, 571, 5, 1, 3846.47, 0.1, 3846.47, 384.65, 3461.82),
(573, 573, 21, 3, 1297.48, 0.0, 3892.44, 0.0, 3892.44),
(574, 574, 44, 1, 13967.74, 0.1, 13967.74, 1396.77, 12570.97),
(575, 575, 58, 2, 4576.25, 0.1, 9152.5, 915.25, 8237.25),
(582, 582, 10, 2, 5295.6, 0.2, 10591.2, 2118.24, 8472.96),
(585, 585, 37, 3, 2213.17, 0.0, 6639.51, 0.0, 6639.51),
(586, 586, 24, 4, 270.8, 0.1, 1083.2, 108.32, 974.88),
(587, 587, 45, 1, 2090.91, 0.1, 2090.91, 209.09, 1881.82),
(588, 588, 6, 1, 2210.04, 0.1, 2210.04, 221.0, 1989.04),
(589, 589, 52, 2, 1119.38, 0.15, 2238.76, 335.81, 1902.95),
(590, 590, 33, 2, 1030.28, 0.0, 2060.56, 0.0, 2060.56),
(591, 591, 3, 2, 6378.59, 0.1, 12757.18, 1275.72, 11481.46),
(592, 592, 37, 2, 2213.17, 0.0, 4426.34, 0.0, 4426.34),
(593, 593, 6, 2, 2210.04, 0.15, 4420.08, 663.01, 3757.07),
(595, 595, 24, 1, 270.8, 0.1, 270.8, 27.08, 243.72),
(596, 596, 10, 3, 5295.6, 0.1, 15886.8, 1588.68, 14298.12),
(599, 599, 31, 1, 1188.69, 0.15, 1188.69, 178.3, 1010.39),
(600, 600, 34, 1, 367.37, 0.05, 367.37, 18.37, 349.0),
(604, 604, 23, 2, 234.73, 0.0, 469.46, 0.0, 469.46),
(605, 605, 39, 2, 2301.75, 0.0, 4603.5, 0.0, 4603.5);

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount_pct`, `gross_amount`, `discount_amount`, `net_amount`) VALUES
(609, 609, 12, 1, 2330.38, 0.2, 2330.38, 466.08, 1864.3),
(610, 610, 7, 2, 347.71, 0.05, 695.42, 34.77, 660.65),
(611, 611, 7, 1, 347.71, 0.1, 347.71, 34.77, 312.94),
(613, 613, 1, 1, 5597.39, 0.05, 5597.39, 279.87, 5317.52),
(616, 616, 49, 2, 1594.14, 0.0, 3188.28, 0.0, 3188.28),
(617, 617, 20, 3, 1564.76, 0.1, 4694.28, 469.43, 4224.85),
(618, 618, 48, 1, 1732.21, 0.0, 1732.21, 0.0, 1732.21),
(622, 622, 16, 1, 2640.48, 0.1, 2640.48, 264.05, 2376.43),
(624, 624, 5, 1, 3846.47, 0.15, 3846.47, 576.97, 3269.5),
(628, 628, 57, 1, 2577.84, 0.0, 2577.84, 0.0, 2577.84),
(629, 629, 27, 2, 1918.61, 0.0, 3837.22, 0.0, 3837.22),
(631, 631, 23, 1, 234.73, 0.0, 234.73, 0.0, 234.73),
(635, 635, 48, 4, 1732.21, 0.0, 6928.84, 0.0, 6928.84),
(636, 636, 5, 2, 3846.47, 0.1, 7692.94, 769.29, 6923.65),
(640, 640, 22, 1, 486.65, 0.1, 486.65, 48.66, 437.99),
(641, 641, 27, 2, 1918.61, 0.0, 3837.22, 0.0, 3837.22),
(642, 642, 37, 1, 2213.17, 0.15, 2213.17, 331.98, 1881.19),
(649, 649, 41, 2, 1482.37, 0.0, 2964.74, 0.0, 2964.74),
(653, 653, 42, 2, 1536.24, 0.1, 3072.48, 307.25, 2765.23),
(654, 654, 8, 2, 4287.27, 0.1, 8574.54, 857.45, 7717.09),
(655, 655, 21, 3, 1297.48, 0.05, 3892.44, 194.62, 3697.82),
(656, 656, 23, 2, 234.73, 0.05, 469.46, 23.47, 445.99),
(657, 657, 52, 1, 1119.38, 0.15, 1119.38, 167.91, 951.47),
(658, 658, 5, 1, 3846.47, 0.0, 3846.47, 0.0, 3846.47),
(661, 661, 42, 1, 1536.24, 0.0, 1536.24, 0.0, 1536.24),
(663, 663, 15, 1, 2757.58, 0.0, 2757.58, 0.0, 2757.58),
(665, 665, 11, 1, 5272.78, 0.2, 5272.78, 1054.56, 4218.22),
(667, 667, 29, 2, 1319.62, 0.0, 2639.24, 0.0, 2639.24),
(669, 669, 31, 4, 1188.69, 0.1, 4754.76, 475.48, 4279.28),
(670, 670, 22, 2, 486.65, 0.15, 973.3, 145.99, 827.31),
(672, 672, 15, 1, 2757.58, 0.0, 2757.58, 0.0, 2757.58),
(673, 673, 13, 1, 3075.88, 0.1, 3075.88, 307.59, 2768.29),
(675, 675, 23, 4, 234.73, 0.15, 938.92, 140.84, 798.08),
(676, 676, 52, 1, 1119.38, 0.15, 1119.38, 167.91, 951.47),
(677, 677, 9, 1, 1573.18, 0.0, 1573.18, 0.0, 1573.18),
(679, 679, 49, 1, 1594.14, 0.15, 1594.14, 239.12, 1355.02),
(681, 681, 20, 1, 1564.76, 0.1, 1564.76, 156.48, 1408.28),
(682, 682, 2, 2, 2663.99, 0.05, 5327.98, 266.4, 5061.58),
(683, 683, 37, 3, 2213.17, 0.1, 6639.51, 663.95, 5975.56),
(687, 687, 35, 3, 460.69, 0.15, 1382.07, 207.31, 1174.76),
(688, 688, 7, 3, 347.71, 0.0, 1043.13, 0.0, 1043.13),
(692, 692, 2, 1, 2663.99, 0.15, 2663.99, 399.6, 2264.39),
(693, 693, 14, 5, 568.06, 0.05, 2840.3, 142.02, 2698.28),
(695, 695, 59, 1, 1597.46, 0.0, 1597.46, 0.0, 1597.46),
(698, 698, 49, 2, 1594.14, 0.1, 3188.28, 318.83, 2869.45),
(700, 700, 29, 1, 1319.62, 0.05, 1319.62, 65.98, 1253.64),
(701, 701, 27, 2, 1918.61, 0.0, 3837.22, 0.0, 3837.22),
(702, 702, 46, 2, 2336.4, 0.0, 4672.8, 0.0, 4672.8),
(703, 703, 30, 2, 1271.27, 0.15, 2542.54, 381.38, 2161.16),
(706, 706, 26, 2, 2563.63, 0.2, 5127.26, 1025.45, 4101.81),
(707, 707, 13, 1, 3075.88, 0.15, 3075.88, 461.38, 2614.5),
(708, 708, 18, 2, 1397.13, 0.15, 2794.26, 419.14, 2375.12),
(710, 710, 17, 2, 1854.6, 0.1, 3709.2, 370.92, 3338.28),
(712, 712, 40, 2, 794.52, 0.1, 1589.04, 158.9, 1430.14),
(713, 713, 19, 2, 1509.82, 0.0, 3019.64, 0.0, 3019.64),
(715, 715, 12, 3, 2330.38, 0.0, 6991.14, 0.0, 6991.14),
(716, 716, 32, 2, 721.51, 0.05, 1443.02, 72.15, 1370.87),
(717, 717, 55, 2, 2350.56, 0.05, 4701.12, 235.06, 4466.06),
(719, 719, 2, 1, 2663.99, 0.05, 2663.99, 133.2, 2530.79),
(720, 720, 43, 1, 6132.15, 0.1, 6132.15, 613.22, 5518.93),
(723, 723, 25, 2, 4223.03, 0.15, 8446.06, 1266.91, 7179.15),
(725, 725, 54, 1, 258.44, 0.0, 258.44, 0.0, 258.44),
(727, 727, 23, 2, 234.73, 0.0, 469.46, 0.0, 469.46),
(728, 728, 21, 1, 1297.48, 0.0, 1297.48, 0.0, 1297.48),
(734, 734, 32, 1, 721.51, 0.15, 721.51, 108.23, 613.28),
(735, 735, 17, 2, 1854.6, 0.0, 3709.2, 0.0, 3709.2),
(736, 736, 56, 1, 4397.89, 0.0, 4397.89, 0.0, 4397.89),
(737, 737, 26, 1, 2563.63, 0.1, 2563.63, 256.36, 2307.27),
(738, 738, 50, 2, 1556.33, 0.0, 3112.66, 0.0, 3112.66),
(739, 739, 48, 3, 1732.21, 0.1, 5196.63, 519.66, 4676.97),
(740, 740, 7, 1, 347.71, 0.0, 347.71, 0.0, 347.71),
(741, 741, 24, 1, 270.8, 0.05, 270.8, 13.54, 257.26),
(742, 742, 31, 3, 1188.69, 0.0, 3566.07, 0.0, 3566.07),
(743, 743, 45, 1, 2090.91, 0.05, 2090.91, 104.55, 1986.36),
(744, 744, 35, 3, 460.69, 0.05, 1382.07, 69.1, 1312.97),
(747, 747, 60, 2, 3103.51, 0.15, 6207.02, 931.05, 5275.97),
(748, 748, 33, 1, 1030.28, 0.1, 1030.28, 103.03, 927.25),
(749, 749, 49, 2, 1594.14, 0.0, 3188.28, 0.0, 3188.28),
(751, 751, 51, 1, 107.34, 0.15, 107.34, 16.1, 91.24),
(761, 761, 48, 1, 1732.21, 0.1, 1732.21, 173.22, 1558.99),
(763, 763, 9, 2, 1573.18, 0.0, 3146.36, 0.0, 3146.36),
(764, 764, 6, 2, 2210.04, 0.05, 4420.08, 221.0, 4199.08),
(766, 766, 34, 1, 367.37, 0.0, 367.37, 0.0, 367.37),
(768, 768, 11, 1, 5272.78, 0.2, 5272.78, 1054.56, 4218.22),
(769, 769, 23, 1, 234.73, 0.0, 234.73, 0.0, 234.73),
(771, 771, 14, 2, 568.06, 0.1, 1136.12, 113.61, 1022.51),
(774, 774, 39, 1, 2301.75, 0.0, 2301.75, 0.0, 2301.75),
(776, 776, 36, 1, 347.86, 0.0, 347.86, 0.0, 347.86),
(777, 777, 55, 1, 2350.56, 0.1, 2350.56, 235.06, 2115.5),
(778, 778, 32, 2, 721.51, 0.15, 1443.02, 216.45, 1226.57),
(779, 779, 23, 3, 234.73, 0.05, 704.19, 35.21, 668.98),
(780, 780, 37, 1, 2213.17, 0.05, 2213.17, 110.66, 2102.51),
(782, 782, 41, 1, 1482.37, 0.05, 1482.37, 74.12, 1408.25),
(783, 783, 10, 2, 5295.6, 0.0, 10591.2, 0.0, 10591.2),
(785, 785, 43, 1, 6132.15, 0.1, 6132.15, 613.22, 5518.93),
(787, 787, 49, 2, 1594.14, 0.0, 3188.28, 0.0, 3188.28),
(788, 788, 6, 3, 2210.04, 0.0, 6630.12, 0.0, 6630.12),
(790, 790, 45, 3, 2090.91, 0.0, 6272.73, 0.0, 6272.73),
(791, 791, 45, 3, 2090.91, 0.0, 6272.73, 0.0, 6272.73),
(794, 794, 16, 1, 2640.48, 0.15, 2640.48, 396.07, 2244.41),
(795, 795, 41, 4, 1482.37, 0.15, 5929.48, 889.42, 5040.06),
(796, 796, 26, 2, 2563.63, 0.1, 5127.26, 512.73, 4614.53),
(797, 797, 46, 2, 2336.4, 0.05, 4672.8, 233.64, 4439.16),
(798, 798, 57, 1, 2577.84, 0.1, 2577.84, 257.78, 2320.06),
(801, 801, 47, 4, 11276.24, 0.15, 45104.96, 6765.74, 38339.22),
(803, 803, 11, 1, 5272.78, 0.05, 5272.78, 263.64, 5009.14),
(804, 804, 36, 5, 347.86, 0.05, 1739.3, 86.97, 1652.33),
(806, 806, 22, 2, 486.65, 0.1, 973.3, 97.33, 875.97),
(808, 808, 51, 3, 107.34, 0.0, 322.02, 0.0, 322.02),
(812, 812, 10, 3, 5295.6, 0.0, 15886.8, 0.0, 15886.8),
(813, 813, 51, 4, 107.34, 0.05, 429.36, 21.47, 407.89),
(814, 814, 21, 5, 1297.48, 0.0, 6487.4, 0.0, 6487.4),
(816, 816, 26, 2, 2563.63, 0.0, 5127.26, 0.0, 5127.26),
(818, 818, 57, 3, 2577.84, 0.15, 7733.52, 1160.03, 6573.49),
(822, 822, 49, 1, 1594.14, 0.1, 1594.14, 159.41, 1434.73),
(824, 824, 46, 2, 2336.4, 0.0, 4672.8, 0.0, 4672.8),
(825, 825, 7, 2, 347.71, 0.15, 695.42, 104.31, 591.11),
(826, 826, 31, 1, 1188.69, 0.05, 1188.69, 59.43, 1129.26),
(827, 827, 32, 5, 721.51, 0.1, 3607.55, 360.76, 3246.79),
(828, 828, 53, 1, 492.91, 0.0, 492.91, 0.0, 492.91),
(830, 830, 59, 2, 1597.46, 0.05, 3194.92, 159.75, 3035.17),
(832, 832, 10, 1, 5295.6, 0.15, 5295.6, 794.34, 4501.26),
(833, 833, 1, 2, 5597.39, 0.0, 11194.78, 0.0, 11194.78),
(835, 835, 41, 2, 1482.37, 0.1, 2964.74, 296.47, 2668.27),
(841, 841, 39, 1, 2301.75, 0.0, 2301.75, 0.0, 2301.75),
(843, 843, 35, 1, 460.69, 0.0, 460.69, 0.0, 460.69),
(847, 847, 21, 2, 1297.48, 0.0, 2594.96, 0.0, 2594.96),
(848, 848, 36, 1, 347.86, 0.1, 347.86, 34.79, 313.07),
(851, 851, 1, 4, 5597.39, 0.1, 22389.56, 2238.96, 20150.6),
(854, 854, 45, 3, 2090.91, 0.1, 6272.73, 627.27, 5645.46),
(858, 858, 58, 2, 4576.25, 0.05, 9152.5, 457.62, 8694.88),
(865, 865, 57, 1, 2577.84, 0.1, 2577.84, 257.78, 2320.06),
(866, 866, 57, 1, 2577.84, 0.05, 2577.84, 128.89, 2448.95),
(867, 867, 55, 1, 2350.56, 0.1, 2350.56, 235.06, 2115.5),
(868, 868, 57, 1, 2577.84, 0.15, 2577.84, 386.68, 2191.16),
(872, 872, 31, 4, 1188.69, 0.15, 4754.76, 713.21, 4041.55),
(873, 873, 50, 2, 1556.33, 0.1, 3112.66, 311.27, 2801.39),
(874, 874, 25, 3, 4223.03, 0.1, 12669.09, 1266.91, 11402.18),
(875, 875, 20, 1, 1564.76, 0.1, 1564.76, 156.48, 1408.28),
(877, 877, 30, 3, 1271.27, 0.1, 3813.81, 381.38, 3432.43),
(878, 878, 22, 1, 486.65, 0.0, 486.65, 0.0, 486.65),
(879, 879, 41, 1, 1482.37, 0.05, 1482.37, 74.12, 1408.25),
(880, 880, 52, 1, 1119.38, 0.0, 1119.38, 0.0, 1119.38),
(881, 881, 57, 1, 2577.84, 0.0, 2577.84, 0.0, 2577.84),
(882, 882, 38, 1, 1700.62, 0.05, 1700.62, 85.03, 1615.59),
(883, 883, 13, 2, 3075.88, 0.0, 6151.76, 0.0, 6151.76),
(884, 884, 45, 2, 2090.91, 0.0, 4181.82, 0.0, 4181.82),
(889, 889, 59, 1, 1597.46, 0.0, 1597.46, 0.0, 1597.46),
(890, 890, 47, 1, 11276.24, 0.1, 11276.24, 1127.62, 10148.62),
(891, 891, 59, 1, 1597.46, 0.1, 1597.46, 159.75, 1437.71);

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount_pct`, `gross_amount`, `discount_amount`, `net_amount`) VALUES
(892, 892, 20, 1, 1564.76, 0.15, 1564.76, 234.71, 1330.05),
(894, 894, 21, 4, 1297.48, 0.0, 5189.92, 0.0, 5189.92),
(896, 896, 57, 1, 2577.84, 0.0, 2577.84, 0.0, 2577.84),
(898, 898, 46, 1, 2336.4, 0.1, 2336.4, 233.64, 2102.76),
(899, 899, 58, 1, 4576.25, 0.0, 4576.25, 0.0, 4576.25),
(900, 900, 11, 1, 5272.78, 0.0, 5272.78, 0.0, 5272.78),
(901, 901, 23, 2, 234.73, 0.05, 469.46, 23.47, 445.99),
(903, 903, 15, 2, 2757.58, 0.05, 5515.16, 275.76, 5239.4),
(906, 906, 55, 1, 2350.56, 0.0, 2350.56, 0.0, 2350.56),
(907, 907, 49, 1, 1594.14, 0.05, 1594.14, 79.71, 1514.43),
(909, 909, 22, 1, 486.65, 0.0, 486.65, 0.0, 486.65),
(910, 910, 29, 1, 1319.62, 0.1, 1319.62, 131.96, 1187.66),
(911, 911, 22, 1, 486.65, 0.1, 486.65, 48.66, 437.99),
(913, 913, 41, 5, 1482.37, 0.0, 7411.85, 0.0, 7411.85),
(915, 915, 44, 1, 13967.74, 0.1, 13967.74, 1396.77, 12570.97),
(917, 917, 24, 1, 270.8, 0.15, 270.8, 40.62, 230.18),
(919, 919, 56, 1, 4397.89, 0.15, 4397.89, 659.68, 3738.21),
(922, 922, 37, 2, 2213.17, 0.0, 4426.34, 0.0, 4426.34),
(924, 924, 59, 2, 1597.46, 0.0, 3194.92, 0.0, 3194.92),
(925, 925, 18, 2, 1397.13, 0.0, 2794.26, 0.0, 2794.26),
(936, 936, 47, 1, 11276.24, 0.05, 11276.24, 563.81, 10712.43),
(937, 937, 40, 4, 794.52, 0.05, 3178.08, 158.9, 3019.18),
(939, 939, 15, 2, 2757.58, 0.0, 5515.16, 0.0, 5515.16),
(940, 940, 27, 2, 1918.61, 0.05, 3837.22, 191.86, 3645.36),
(942, 942, 41, 4, 1482.37, 0.1, 5929.48, 592.95, 5336.53),
(943, 943, 29, 2, 1319.62, 0.1, 2639.24, 263.92, 2375.32),
(944, 944, 40, 1, 794.52, 0.1, 794.52, 79.45, 715.07),
(945, 945, 24, 1, 270.8, 0.0, 270.8, 0.0, 270.8),
(947, 947, 42, 2, 1536.24, 0.0, 3072.48, 0.0, 3072.48),
(953, 953, 6, 1, 2210.04, 0.0, 2210.04, 0.0, 2210.04),
(958, 958, 25, 1, 4223.03, 0.2, 4223.03, 844.61, 3378.42),
(960, 960, 41, 2, 1482.37, 0.1, 2964.74, 296.47, 2668.27),
(965, 965, 47, 2, 11276.24, 0.15, 22552.48, 3382.87, 19169.61),
(967, 967, 1, 3, 5597.39, 0.0, 16792.17, 0.0, 16792.17),
(968, 968, 42, 2, 1536.24, 0.0, 3072.48, 0.0, 3072.48),
(969, 969, 12, 4, 2330.38, 0.05, 9321.52, 466.08, 8855.44),
(973, 973, 43, 1, 6132.15, 0.05, 6132.15, 306.61, 5825.54),
(977, 977, 45, 1, 2090.91, 0.1, 2090.91, 209.09, 1881.82),
(978, 978, 43, 1, 6132.15, 0.1, 6132.15, 613.22, 5518.93),
(979, 979, 41, 3, 1482.37, 0.2, 4447.11, 889.42, 3557.69),
(980, 980, 26, 1, 2563.63, 0.15, 2563.63, 384.54, 2179.09),
(983, 983, 8, 2, 4287.27, 0.0, 8574.54, 0.0, 8574.54),
(985, 985, 47, 2, 11276.24, 0.2, 22552.48, 4510.5, 18041.98),
(989, 989, 37, 1, 2213.17, 0.0, 2213.17, 0.0, 2213.17),
(991, 991, 34, 1, 367.37, 0.0, 367.37, 0.0, 367.37),
(992, 992, 54, 2, 258.44, 0.05, 516.88, 25.84, 491.04),
(993, 993, 39, 1, 2301.75, 0.2, 2301.75, 460.35, 1841.4),
(995, 995, 55, 2, 2350.56, 0.0, 4701.12, 0.0, 4701.12),
(996, 996, 20, 5, 1564.76, 0.05, 7823.8, 391.19, 7432.61),
(997, 997, 26, 2, 2563.63, 0.0, 5127.26, 0.0, 5127.26);


-- Insert 500 rows into payments

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_method`, `payment_amount`, `payment_status`) VALUES
(2, 2, 'Net Banking', 0.0, 'Cancelled'),
(3, 3, 'Net Banking', 6630.12, 'Paid'),
(5, 5, 'Credit Card', 2460.7, 'Paid'),
(6, 6, 'Credit Card', 4766.04, 'Paid'),
(9, 9, 'UPI', 222.99, 'Paid'),
(10, 10, 'Net Banking', 715.07, 'Paid'),
(11, 11, 'Net Banking', 1459.43, 'Paid'),
(12, 12, 'Credit Card', 5596.9, 'Paid'),
(13, 13, 'Wallet', 1121.68, 'Paid'),
(15, 15, 'Credit Card', 973.3, 'Paid'),
(16, 16, 'Wallet', 3129.52, 'Paid'),
(17, 17, 'Debit Card', 0.0, 'Cancelled'),
(19, 19, 'Credit Card', 439.35, 'Paid'),
(22, 22, 'Credit Card', 13967.74, 'Paid'),
(23, 23, 'Cash on Delivery', 3358.14, 'Paid'),
(24, 24, 'Net Banking', 2102.76, 'Paid'),
(26, 26, 'UPI', 2435.45, 'Paid'),
(30, 30, 'UPI', 2640.48, 'Paid'),
(33, 33, 'Net Banking', 349.0, 'Paid'),
(38, 38, 'Cash on Delivery', 322.02, 'Paid'),
(39, 39, 'Wallet', 3709.2, 'Paid'),
(40, 40, 'Net Banking', 3981.82, 'Paid'),
(47, 47, 'Cash on Delivery', 53077.41, 'Paid'),
(48, 48, 'Net Banking', 5127.26, 'Paid'),
(50, 50, 'UPI', 3075.88, 'Paid'),
(52, 52, 'Credit Card', 214.68, 'Paid'),
(53, 53, 'Credit Card', 5061.58, 'Paid'),
(55, 55, 'Credit Card', 13847.29, 'Paid'),
(57, 57, 'Cash on Delivery', 5295.6, 'Paid'),
(58, 58, 'Wallet', 2115.5, 'Paid'),
(60, 60, 'UPI', 16556.8, 'Paid'),
(61, 61, 'Net Banking', 2765.23, 'Paid'),
(63, 63, 'Cash on Delivery', 1986.36, 'Paid'),
(64, 64, 'Debit Card', 2205.72, 'Paid'),
(65, 65, 'Credit Card', 330.47, 'Paid'),
(68, 68, 'Credit Card', 685.43, 'Paid'),
(70, 70, 'Debit Card', 4757.78, 'Paid'),
(71, 71, 'Net Banking', 5127.26, 'Paid'),
(72, 72, 'UPI', 3562.97, 'Paid'),
(73, 73, 'Cash on Delivery', 514.52, 'Paid'),
(74, 74, 'Credit Card', 6378.59, 'Paid'),
(78, 78, 'Credit Card', 3338.28, 'Paid'),
(87, 87, 'Credit Card', 1774.48, 'Paid'),
(89, 89, 'Wallet', 4757.78, 'Paid'),
(91, 91, 'UPI', 11030.32, 'Paid'),
(93, 93, 'Credit Card', 6259.04, 'Paid'),
(94, 94, 'Wallet', 1271.27, 'Paid'),
(95, 95, 'Credit Card', 2336.4, 'Paid'),
(98, 98, 'Net Banking', 1615.59, 'Paid'),
(99, 99, 'Wallet', 8963.73, 'Paid'),
(103, 103, 'UPI', 516.88, 'Paid'),
(108, 108, 'Debit Card', 3453.5, 'Paid'),
(109, 109, 'Wallet', 1187.66, 'Paid'),
(112, 112, 'UPI', 199.52, 'Paid'),
(113, 113, 'Cash on Delivery', 794.52, 'Paid'),
(116, 116, 'UPI', 12244.74, 'Paid'),
(117, 117, 'Wallet', 3231.18, 'Paid'),
(118, 118, 'Cash on Delivery', 203.95, 'Paid'),
(119, 119, 'Cash on Delivery', 2376.43, 'Paid'),
(120, 120, 'Net Banking', 1918.61, 'Paid'),
(121, 121, 'UPI', 2099.54, 'Paid'),
(122, 122, 'Credit Card', 951.47, 'Paid'),
(125, 125, 'Credit Card', 230.18, 'Paid'),
(126, 126, 'Debit Card', 1102.86, 'Paid'),
(129, 129, 'Cash on Delivery', 10148.62, 'Paid'),
(131, 131, 'Wallet', 3654.15, 'Paid'),
(133, 133, 'UPI', 7192.77, 'Paid'),
(134, 134, 'Debit Card', 330.63, 'Paid'),
(137, 137, 'Cash on Delivery', 1777.27, 'Paid'),
(140, 140, 'UPI', 4795.18, 'Paid'),
(141, 141, 'Net Banking', 8963.73, 'Paid'),
(142, 142, 'Credit Card', 171.74, 'Paid'),
(143, 143, 'Net Banking', 1946.6, 'Paid'),
(145, 145, 'Wallet', 2238.76, 'Paid'),
(146, 146, 'Debit Card', 1297.48, 'Paid'),
(150, 150, 'UPI', 5272.78, 'Paid'),
(151, 151, 'Credit Card', 4085.21, 'Paid'),
(154, 154, 'Debit Card', 1297.48, 'Paid'),
(155, 155, 'UPI', 2213.17, 'Paid'),
(156, 156, 'Net Banking', 0.0, 'Cancelled'),
(157, 157, 'Wallet', 3958.86, 'Paid'),
(158, 158, 'UPI', 1415.86, 'Paid'),
(160, 160, 'Cash on Delivery', 1312.97, 'Paid'),
(167, 167, 'Debit Card', 50283.86, 'Paid'),
(173, 173, 'Credit Card', 3194.92, 'Paid'),
(174, 174, 'Net Banking', 3972.73, 'Paid'),
(176, 176, 'Cash on Delivery', 16711.98, 'Paid'),
(178, 178, 'Cash on Delivery', 6630.12, 'Paid'),
(179, 179, 'Cash on Delivery', 9491.0, 'Paid'),
(180, 180, 'Cash on Delivery', 2514.83, 'Paid'),
(181, 181, 'Net Banking', 7740.4, 'Paid'),
(185, 185, 'Debit Card', 1257.42, 'Paid'),
(189, 189, 'UPI', 10635.04, 'Paid'),
(192, 192, 'UPI', 1260.01, 'Paid'),
(196, 196, 'UPI', 2989.04, 'Paid'),
(197, 197, 'UPI', 2090.91, 'Paid'),
(199, 199, 'Wallet', 7692.94, 'Paid'),
(203, 203, 'Net Banking', 4603.5, 'Paid'),
(206, 206, 'Net Banking', 0.0, 'Cancelled'),
(209, 209, 'Credit Card', 0.0, 'Cancelled'),
(210, 210, 'Debit Card', 10561.92, 'Paid'),
(212, 212, 'Wallet', 107.34, 'Paid'),
(213, 213, 'Wallet', 1478.51, 'Paid'),
(217, 217, 'Cash on Delivery', 2343.94, 'Paid'),
(218, 218, 'Net Banking', 8574.54, 'Paid'),
(221, 221, 'Credit Card', 7652.79, 'Paid'),
(222, 222, 'Debit Card', 2948.33, 'Paid'),
(225, 225, 'Wallet', 1881.82, 'Paid'),
(226, 226, 'Debit Card', 3077.18, 'Paid'),
(228, 228, 'Cash on Delivery', 330.32, 'Paid'),
(230, 230, 'Debit Card', 418.97, 'Paid'),
(231, 231, 'Net Banking', 2060.56, 'Paid'),
(234, 234, 'Net Banking', 0.0, 'Cancelled'),
(236, 236, 'Debit Card', 685.43, 'Paid'),
(237, 237, 'Net Banking', 1187.66, 'Paid'),
(239, 239, 'Debit Card', 11882.16, 'Paid'),
(241, 241, 'UPI', 13737.69, 'Paid'),
(245, 245, 'Credit Card', 516.88, 'Paid'),
(250, 250, 'Credit Card', 1228.99, 'Paid'),
(251, 251, 'Wallet', 8446.06, 'Paid'),
(252, 252, 'Credit Card', 2563.63, 'Paid'),
(255, 255, 'Credit Card', 214.68, 'Paid'),
(256, 256, 'Wallet', 685.43, 'Paid'),
(257, 257, 'Debit Card', 4481.86, 'Paid'),
(258, 258, 'Debit Card', 3654.15, 'Paid'),
(260, 260, 'Wallet', 347.71, 'Paid'),
(262, 262, 'Credit Card', 270.8, 'Paid'),
(263, 263, 'Debit Card', 2663.99, 'Paid'),
(264, 264, 'Credit Card', 3566.07, 'Paid'),
(266, 266, 'UPI', 516.88, 'Paid'),
(268, 268, 'Wallet', 921.38, 'Paid'),
(269, 269, 'Credit Card', 927.25, 'Paid'),
(274, 274, 'Debit Card', 3968.64, 'Paid'),
(275, 275, 'Credit Card', 2918.86, 'Paid'),
(277, 277, 'Wallet', 7991.97, 'Paid'),
(280, 280, 'Credit Card', 985.82, 'Paid'),
(281, 281, 'Credit Card', 2191.16, 'Paid'),
(282, 282, 'Cash on Delivery', 4576.57, 'Paid'),
(283, 283, 'Credit Card', 2964.74, 'Paid'),
(284, 284, 'Debit Card', 1445.53, 'Paid'),
(285, 285, 'Wallet', 3800.73, 'Paid'),
(286, 286, 'Net Banking', 13269.35, 'Paid'),
(287, 287, 'Wallet', 3072.48, 'Paid'),
(291, 291, 'Cash on Delivery', 1459.43, 'Paid'),
(293, 293, 'Debit Card', 4614.53, 'Paid'),
(294, 294, 'Wallet', 37712.9, 'Paid'),
(300, 300, 'Debit Card', 3697.82, 'Paid'),
(301, 301, 'Net Banking', 5037.65, 'Paid'),
(307, 307, 'Wallet', 5272.78, 'Paid'),
(308, 308, 'Net Banking', 1615.59, 'Paid');

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_method`, `payment_amount`, `payment_status`) VALUES
(310, 310, 'Credit Card', 1822.68, 'Paid'),
(315, 315, 'Wallet', 15886.8, 'Paid'),
(316, 316, 'Debit Card', 1271.27, 'Paid'),
(321, 321, 'Debit Card', 5180.25, 'Paid'),
(322, 322, 'UPI', 8355.99, 'Paid'),
(328, 328, 'Net Banking', 5838.66, 'Paid'),
(330, 330, 'Net Banking', 2158.63, 'Paid'),
(332, 332, 'Cash on Delivery', 5037.65, 'Paid'),
(333, 333, 'UPI', 2090.91, 'Paid'),
(335, 335, 'Net Banking', 312.94, 'Paid'),
(336, 336, 'Cash on Delivery', 5825.54, 'Paid'),
(337, 337, 'Wallet', 0.0, 'Cancelled'),
(338, 338, 'Cash on Delivery', 2097.34, 'Paid'),
(339, 339, 'Credit Card', 1534.89, 'Paid'),
(340, 340, 'Credit Card', 5468.04, 'Paid'),
(341, 341, 'Cash on Delivery', 1350.68, 'Paid'),
(343, 343, 'UPI', 4302.99, 'Paid'),
(345, 345, 'UPI', 1986.36, 'Paid'),
(347, 347, 'Cash on Delivery', 2482.81, 'Paid'),
(348, 348, 'Credit Card', 4757.78, 'Paid'),
(350, 350, 'Cash on Delivery', 4660.76, 'Paid'),
(351, 351, 'UPI', 3146.36, 'Paid'),
(352, 352, 'Net Banking', 5586.32, 'Paid'),
(353, 353, 'Cash on Delivery', 313.07, 'Paid'),
(356, 356, 'UPI', 3644.18, 'Paid'),
(361, 361, 'UPI', 1558.99, 'Paid'),
(367, 367, 'UPI', 1260.01, 'Paid'),
(369, 369, 'Credit Card', 1472.38, 'Paid'),
(370, 370, 'Cash on Delivery', 2757.58, 'Paid'),
(373, 373, 'Debit Card', 2639.24, 'Paid'),
(379, 379, 'Credit Card', 243.72, 'Paid'),
(381, 381, 'Wallet', 1121.68, 'Paid'),
(382, 382, 'Credit Card', 222.99, 'Paid'),
(383, 383, 'UPI', 11037.87, 'Paid'),
(388, 388, 'Net Banking', 2097.34, 'Paid'),
(389, 389, 'Wallet', 21424.86, 'Paid'),
(390, 390, 'Cash on Delivery', 2397.59, 'Paid'),
(391, 391, 'Cash on Delivery', 0.0, 'Cancelled'),
(392, 392, 'Credit Card', 4002.4, 'Paid'),
(394, 394, 'Net Banking', 936.53, 'Paid'),
(396, 396, 'Cash on Delivery', 6292.03, 'Paid'),
(397, 397, 'Wallet', 3757.07, 'Paid'),
(398, 398, 'Net Banking', 367.37, 'Paid'),
(399, 399, 'Debit Card', 234.73, 'Paid'),
(401, 401, 'Debit Card', 367.37, 'Paid'),
(402, 402, 'Cash on Delivery', 10591.2, 'Paid'),
(404, 404, 'Wallet', 347.86, 'Paid'),
(405, 405, 'UPI', 4466.06, 'Paid'),
(407, 407, 'UPI', 3780.04, 'Paid'),
(409, 409, 'UPI', 5133.39, 'Paid'),
(410, 410, 'Cash on Delivery', 2115.5, 'Paid'),
(411, 411, 'Debit Card', 12570.97, 'Paid'),
(415, 415, 'Debit Card', 1167.96, 'Paid'),
(416, 416, 'Wallet', 7601.45, 'Paid'),
(417, 417, 'Wallet', 9152.5, 'Paid'),
(423, 423, 'Debit Card', 1509.59, 'Paid'),
(424, 424, 'Debit Card', 0.0, 'Cancelled'),
(425, 425, 'Cash on Delivery', 2481.82, 'Paid'),
(433, 433, 'Net Banking', 1669.14, 'Paid'),
(435, 435, 'Debit Card', 1726.75, 'Paid'),
(436, 436, 'Net Banking', 3697.82, 'Paid'),
(439, 439, 'Net Banking', 3562.68, 'Paid'),
(441, 441, 'UPI', 2179.09, 'Paid'),
(446, 446, 'Debit Card', 3129.52, 'Paid'),
(447, 447, 'Debit Card', 1854.6, 'Paid'),
(448, 448, 'UPI', 2258.51, 'Paid'),
(451, 451, 'Wallet', 4199.08, 'Paid'),
(454, 454, 'Wallet', 460.69, 'Paid'),
(456, 456, 'UPI', 0.0, 'Cancelled'),
(459, 459, 'Debit Card', 2771.54, 'Paid'),
(461, 461, 'Credit Card', 7843.49, 'Paid'),
(463, 463, 'Credit Card', 3401.24, 'Paid'),
(464, 464, 'Debit Card', 7072.13, 'Paid'),
(465, 465, 'Net Banking', 2090.91, 'Paid'),
(470, 470, 'Credit Card', 1556.33, 'Paid'),
(471, 471, 'Wallet', 27935.48, 'Paid'),
(473, 473, 'Wallet', 6151.76, 'Paid'),
(474, 474, 'Credit Card', 367.37, 'Paid'),
(476, 476, 'Credit Card', 887.24, 'Paid'),
(477, 477, 'Cash on Delivery', 660.65, 'Paid'),
(478, 478, 'Wallet', 626.15, 'Paid'),
(483, 483, 'Credit Card', 2415.71, 'Paid'),
(485, 485, 'Debit Card', 330.47, 'Paid'),
(487, 487, 'UPI', 33828.72, 'Paid'),
(488, 488, 'Net Banking', 6378.59, 'Paid'),
(489, 489, 'Wallet', 9310.53, 'Paid'),
(491, 491, 'Credit Card', 8472.96, 'Paid'),
(492, 492, 'Cash on Delivery', 1509.82, 'Paid'),
(494, 494, 'Credit Card', 2768.29, 'Paid'),
(495, 495, 'Net Banking', 1187.56, 'Paid'),
(498, 498, 'Credit Card', 12570.97, 'Paid'),
(499, 499, 'Net Banking', 3958.1, 'Paid'),
(500, 500, 'Cash on Delivery', 973.3, 'Paid'),
(502, 502, 'Wallet', 6868.84, 'Paid'),
(503, 503, 'Debit Card', 0.0, 'Cancelled'),
(504, 504, 'Cash on Delivery', 7192.77, 'Paid'),
(505, 505, 'Cash on Delivery', 8237.25, 'Paid'),
(507, 507, 'UPI', 5061.58, 'Paid'),
(511, 511, 'Debit Card', 1022.51, 'Paid'),
(512, 512, 'Debit Card', 1357.84, 'Paid'),
(514, 514, 'Credit Card', 1630.82, 'Paid'),
(515, 515, 'Cash on Delivery', 312.94, 'Paid'),
(516, 516, 'Wallet', 1589.04, 'Paid'),
(519, 519, 'Net Banking', 0.0, 'Cancelled'),
(520, 520, 'Cash on Delivery', 5331.82, 'Paid'),
(522, 522, 'Wallet', 3958.86, 'Paid'),
(523, 523, 'Net Banking', 626.15, 'Paid'),
(525, 525, 'Credit Card', 1881.82, 'Paid'),
(526, 526, 'Cash on Delivery', 4576.25, 'Paid'),
(529, 529, 'Cash on Delivery', 754.79, 'Paid'),
(530, 530, 'Wallet', 4745.5, 'Paid'),
(531, 531, 'UPI', 1509.82, 'Paid'),
(533, 533, 'Cash on Delivery', 1144.14, 'Paid'),
(535, 535, 'Credit Card', 6132.15, 'Paid'),
(536, 536, 'UPI', 2860.27, 'Paid'),
(537, 537, 'Debit Card', 3308.57, 'Paid'),
(539, 539, 'Net Banking', 715.07, 'Paid'),
(540, 540, 'Cash on Delivery', 3870.2, 'Paid'),
(541, 541, 'Credit Card', 1443.02, 'Paid'),
(545, 545, 'Credit Card', 12570.97, 'Paid'),
(548, 548, 'Cash on Delivery', 9310.53, 'Paid'),
(549, 549, 'Debit Card', 0.0, 'Cancelled'),
(551, 551, 'Wallet', 6292.03, 'Paid'),
(555, 555, 'Wallet', 1330.05, 'Paid'),
(557, 557, 'UPI', 11872.58, 'Paid'),
(558, 558, 'Debit Card', 3188.28, 'Paid'),
(561, 561, 'Net Banking', 2213.17, 'Paid'),
(562, 562, 'UPI', 1415.86, 'Paid'),
(565, 565, 'Debit Card', 4011.61, 'Paid'),
(568, 568, 'Cash on Delivery', 3644.18, 'Paid'),
(571, 571, 'Cash on Delivery', 3461.82, 'Paid'),
(573, 573, 'UPI', 0.0, 'Cancelled'),
(574, 574, 'Credit Card', 12570.97, 'Paid'),
(575, 575, 'Net Banking', 8237.25, 'Paid'),
(582, 582, 'Wallet', 8472.96, 'Paid'),
(585, 585, 'Cash on Delivery', 6639.51, 'Paid'),
(586, 586, 'Cash on Delivery', 974.88, 'Paid'),
(587, 587, 'Net Banking', 1881.82, 'Paid'),
(588, 588, 'Wallet', 1989.04, 'Paid'),
(589, 589, 'Net Banking', 1902.95, 'Paid'),
(590, 590, 'Debit Card', 2060.56, 'Paid'),
(591, 591, 'Cash on Delivery', 11481.46, 'Paid'),
(592, 592, 'Debit Card', 4426.34, 'Paid'),
(593, 593, 'Cash on Delivery', 3757.07, 'Paid'),
(595, 595, 'Debit Card', 243.72, 'Paid'),
(596, 596, 'Credit Card', 14298.12, 'Paid'),
(599, 599, 'Net Banking', 1010.39, 'Paid'),
(600, 600, 'Cash on Delivery', 349.0, 'Paid'),
(604, 604, 'UPI', 469.46, 'Paid'),
(605, 605, 'Net Banking', 4603.5, 'Paid');

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_method`, `payment_amount`, `payment_status`) VALUES
(609, 609, 'Credit Card', 1864.3, 'Paid'),
(610, 610, 'Net Banking', 660.65, 'Paid'),
(611, 611, 'UPI', 312.94, 'Paid'),
(613, 613, 'Cash on Delivery', 5317.52, 'Paid'),
(616, 616, 'Wallet', 3188.28, 'Paid'),
(617, 617, 'Wallet', 4224.85, 'Paid'),
(618, 618, 'Net Banking', 1732.21, 'Paid'),
(622, 622, 'UPI', 0.0, 'Cancelled'),
(624, 624, 'Debit Card', 3269.5, 'Paid'),
(628, 628, 'Wallet', 0.0, 'Cancelled'),
(629, 629, 'Net Banking', 3837.22, 'Paid'),
(631, 631, 'Cash on Delivery', 234.73, 'Paid'),
(635, 635, 'Cash on Delivery', 6928.84, 'Paid'),
(636, 636, 'Wallet', 6923.65, 'Paid'),
(640, 640, 'Net Banking', 437.99, 'Paid'),
(641, 641, 'Wallet', 3837.22, 'Paid'),
(642, 642, 'Cash on Delivery', 1881.19, 'Paid'),
(649, 649, 'Wallet', 2964.74, 'Paid'),
(653, 653, 'Credit Card', 2765.23, 'Paid'),
(654, 654, 'Wallet', 7717.09, 'Paid'),
(655, 655, 'UPI', 3697.82, 'Paid'),
(656, 656, 'Net Banking', 445.99, 'Paid'),
(657, 657, 'Credit Card', 951.47, 'Paid'),
(658, 658, 'Credit Card', 3846.47, 'Paid'),
(661, 661, 'Net Banking', 1536.24, 'Paid'),
(663, 663, 'Debit Card', 2757.58, 'Paid'),
(665, 665, 'Debit Card', 4218.22, 'Paid'),
(667, 667, 'Credit Card', 2639.24, 'Paid'),
(669, 669, 'Cash on Delivery', 4279.28, 'Paid'),
(670, 670, 'Debit Card', 827.31, 'Paid'),
(672, 672, 'Cash on Delivery', 2757.58, 'Paid'),
(673, 673, 'Wallet', 0.0, 'Cancelled'),
(675, 675, 'Wallet', 798.08, 'Paid'),
(676, 676, 'Wallet', 951.47, 'Paid'),
(677, 677, 'UPI', 1573.18, 'Paid'),
(679, 679, 'UPI', 1355.02, 'Paid'),
(681, 681, 'Net Banking', 1408.28, 'Paid'),
(682, 682, 'Cash on Delivery', 5061.58, 'Paid'),
(683, 683, 'Debit Card', 5975.56, 'Paid'),
(687, 687, 'Debit Card', 1174.76, 'Paid'),
(688, 688, 'Net Banking', 1043.13, 'Paid'),
(692, 692, 'Debit Card', 2264.39, 'Paid'),
(693, 693, 'UPI', 2698.28, 'Paid'),
(695, 695, 'UPI', 1597.46, 'Paid'),
(698, 698, 'Cash on Delivery', 2869.45, 'Paid'),
(700, 700, 'Cash on Delivery', 1253.64, 'Paid'),
(701, 701, 'Net Banking', 3837.22, 'Paid'),
(702, 702, 'Net Banking', 4672.8, 'Paid'),
(703, 703, 'Debit Card', 2161.16, 'Paid'),
(706, 706, 'UPI', 4101.81, 'Paid'),
(707, 707, 'Net Banking', 2614.5, 'Paid'),
(708, 708, 'Debit Card', 0.0, 'Cancelled'),
(710, 710, 'Wallet', 3338.28, 'Paid'),
(712, 712, 'Net Banking', 1430.14, 'Paid'),
(713, 713, 'UPI', 3019.64, 'Paid'),
(715, 715, 'Wallet', 6991.14, 'Paid'),
(716, 716, 'Net Banking', 1370.87, 'Paid'),
(717, 717, 'Cash on Delivery', 4466.06, 'Paid'),
(719, 719, 'Debit Card', 2530.79, 'Paid'),
(720, 720, 'Debit Card', 5518.93, 'Paid'),
(723, 723, 'Debit Card', 7179.15, 'Paid'),
(725, 725, 'Credit Card', 258.44, 'Paid'),
(727, 727, 'Wallet', 469.46, 'Paid'),
(728, 728, 'UPI', 1297.48, 'Paid'),
(734, 734, 'Credit Card', 613.28, 'Paid'),
(735, 735, 'UPI', 3709.2, 'Paid'),
(736, 736, 'Debit Card', 4397.89, 'Paid'),
(737, 737, 'Cash on Delivery', 2307.27, 'Paid'),
(738, 738, 'Debit Card', 3112.66, 'Paid'),
(739, 739, 'Credit Card', 0.0, 'Cancelled'),
(740, 740, 'Net Banking', 347.71, 'Paid'),
(741, 741, 'Credit Card', 257.26, 'Paid'),
(742, 742, 'Wallet', 3566.07, 'Paid'),
(743, 743, 'Wallet', 1986.36, 'Paid'),
(744, 744, 'Net Banking', 0.0, 'Cancelled'),
(747, 747, 'Wallet', 5275.97, 'Paid'),
(748, 748, 'Net Banking', 927.25, 'Paid'),
(749, 749, 'UPI', 3188.28, 'Paid'),
(751, 751, 'Wallet', 91.24, 'Paid'),
(761, 761, 'Net Banking', 1558.99, 'Paid'),
(763, 763, 'Net Banking', 3146.36, 'Paid'),
(764, 764, 'UPI', 4199.08, 'Paid'),
(766, 766, 'Credit Card', 367.37, 'Paid'),
(768, 768, 'UPI', 0.0, 'Cancelled'),
(769, 769, 'UPI', 234.73, 'Paid'),
(771, 771, 'Credit Card', 1022.51, 'Paid'),
(774, 774, 'Debit Card', 2301.75, 'Paid'),
(776, 776, 'UPI', 347.86, 'Paid'),
(777, 777, 'UPI', 2115.5, 'Paid'),
(778, 778, 'Cash on Delivery', 0.0, 'Cancelled'),
(779, 779, 'Net Banking', 668.98, 'Paid'),
(780, 780, 'Net Banking', 2102.51, 'Paid'),
(782, 782, 'Net Banking', 0.0, 'Cancelled'),
(783, 783, 'Debit Card', 10591.2, 'Paid'),
(785, 785, 'UPI', 5518.93, 'Paid'),
(787, 787, 'Credit Card', 3188.28, 'Paid'),
(788, 788, 'Net Banking', 6630.12, 'Paid'),
(790, 790, 'UPI', 6272.73, 'Paid'),
(791, 791, 'Net Banking', 6272.73, 'Paid'),
(794, 794, 'UPI', 2244.41, 'Paid'),
(795, 795, 'UPI', 5040.06, 'Paid'),
(796, 796, 'Net Banking', 0.0, 'Cancelled'),
(797, 797, 'Debit Card', 4439.16, 'Paid'),
(798, 798, 'Wallet', 2320.06, 'Paid'),
(801, 801, 'Net Banking', 38339.22, 'Paid'),
(803, 803, 'Credit Card', 5009.14, 'Paid'),
(804, 804, 'Credit Card', 1652.33, 'Paid'),
(806, 806, 'Wallet', 875.97, 'Paid'),
(808, 808, 'Credit Card', 322.02, 'Paid'),
(812, 812, 'Net Banking', 15886.8, 'Paid'),
(813, 813, 'UPI', 407.89, 'Paid'),
(814, 814, 'Wallet', 6487.4, 'Paid'),
(816, 816, 'Cash on Delivery', 5127.26, 'Paid'),
(818, 818, 'Net Banking', 6573.49, 'Paid'),
(822, 822, 'Credit Card', 1434.73, 'Paid'),
(824, 824, 'Debit Card', 4672.8, 'Paid'),
(825, 825, 'Net Banking', 591.11, 'Paid'),
(826, 826, 'Debit Card', 1129.26, 'Paid'),
(827, 827, 'Wallet', 0.0, 'Cancelled'),
(828, 828, 'Wallet', 492.91, 'Paid'),
(830, 830, 'UPI', 3035.17, 'Paid'),
(832, 832, 'Credit Card', 4501.26, 'Paid'),
(833, 833, 'Cash on Delivery', 11194.78, 'Paid'),
(835, 835, 'UPI', 2668.27, 'Paid'),
(841, 841, 'Debit Card', 2301.75, 'Paid'),
(843, 843, 'Debit Card', 460.69, 'Paid'),
(847, 847, 'UPI', 2594.96, 'Paid'),
(848, 848, 'Cash on Delivery', 313.07, 'Paid'),
(851, 851, 'UPI', 20150.6, 'Paid'),
(854, 854, 'Credit Card', 5645.46, 'Paid'),
(858, 858, 'Cash on Delivery', 8694.88, 'Paid'),
(865, 865, 'Wallet', 2320.06, 'Paid'),
(866, 866, 'Debit Card', 2448.95, 'Paid'),
(867, 867, 'Cash on Delivery', 2115.5, 'Paid'),
(868, 868, 'UPI', 2191.16, 'Paid'),
(872, 872, 'Credit Card', 4041.55, 'Paid'),
(873, 873, 'UPI', 2801.39, 'Paid'),
(874, 874, 'Net Banking', 11402.18, 'Paid'),
(875, 875, 'Net Banking', 1408.28, 'Paid'),
(877, 877, 'Net Banking', 3432.43, 'Paid'),
(878, 878, 'Cash on Delivery', 486.65, 'Paid'),
(879, 879, 'Credit Card', 1408.25, 'Paid'),
(880, 880, 'Debit Card', 1119.38, 'Paid'),
(881, 881, 'UPI', 2577.84, 'Paid'),
(882, 882, 'Net Banking', 1615.59, 'Paid'),
(883, 883, 'Wallet', 6151.76, 'Paid'),
(884, 884, 'Cash on Delivery', 4181.82, 'Paid'),
(889, 889, 'Credit Card', 1597.46, 'Paid'),
(890, 890, 'Credit Card', 10148.62, 'Paid'),
(891, 891, 'Debit Card', 1437.71, 'Paid');

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_method`, `payment_amount`, `payment_status`) VALUES
(892, 892, 'Wallet', 1330.05, 'Paid'),
(894, 894, 'Cash on Delivery', 5189.92, 'Paid'),
(896, 896, 'Credit Card', 2577.84, 'Paid'),
(898, 898, 'Credit Card', 2102.76, 'Paid'),
(899, 899, 'Net Banking', 4576.25, 'Paid'),
(900, 900, 'Net Banking', 5272.78, 'Paid'),
(901, 901, 'Net Banking', 445.99, 'Paid'),
(903, 903, 'Debit Card', 5239.4, 'Paid'),
(906, 906, 'Net Banking', 2350.56, 'Paid'),
(907, 907, 'Net Banking', 1514.43, 'Paid'),
(909, 909, 'Credit Card', 486.65, 'Paid'),
(910, 910, 'Net Banking', 1187.66, 'Paid'),
(911, 911, 'Debit Card', 437.99, 'Paid'),
(913, 913, 'Credit Card', 7411.85, 'Paid'),
(915, 915, 'Credit Card', 12570.97, 'Paid'),
(917, 917, 'UPI', 230.18, 'Paid'),
(919, 919, 'Cash on Delivery', 3738.21, 'Paid'),
(922, 922, 'Debit Card', 4426.34, 'Paid'),
(924, 924, 'Credit Card', 3194.92, 'Paid'),
(925, 925, 'Net Banking', 2794.26, 'Paid'),
(936, 936, 'Cash on Delivery', 10712.43, 'Paid'),
(937, 937, 'Credit Card', 3019.18, 'Paid'),
(939, 939, 'UPI', 5515.16, 'Paid'),
(940, 940, 'Debit Card', 3645.36, 'Paid'),
(942, 942, 'Cash on Delivery', 5336.53, 'Paid'),
(943, 943, 'Credit Card', 2375.32, 'Paid'),
(944, 944, 'UPI', 715.07, 'Paid'),
(945, 945, 'Credit Card', 270.8, 'Paid'),
(947, 947, 'Credit Card', 3072.48, 'Paid'),
(953, 953, 'Credit Card', 2210.04, 'Paid'),
(958, 958, 'UPI', 3378.42, 'Paid'),
(960, 960, 'Wallet', 0.0, 'Cancelled'),
(965, 965, 'Wallet', 19169.61, 'Paid'),
(967, 967, 'Cash on Delivery', 16792.17, 'Paid'),
(968, 968, 'Credit Card', 3072.48, 'Paid'),
(969, 969, 'Credit Card', 8855.44, 'Paid'),
(973, 973, 'Net Banking', 5825.54, 'Paid'),
(977, 977, 'Cash on Delivery', 1881.82, 'Paid'),
(978, 978, 'Debit Card', 0.0, 'Cancelled'),
(979, 979, 'Credit Card', 3557.69, 'Paid'),
(980, 980, 'Net Banking', 0.0, 'Cancelled'),
(983, 983, 'UPI', 8574.54, 'Paid'),
(985, 985, 'Cash on Delivery', 18041.98, 'Paid'),
(989, 989, 'Debit Card', 2213.17, 'Paid'),
(991, 991, 'Credit Card', 367.37, 'Paid'),
(992, 992, 'Wallet', 491.04, 'Paid'),
(993, 993, 'Wallet', 1841.4, 'Paid'),
(995, 995, 'Net Banking', 4701.12, 'Paid'),
(996, 996, 'Debit Card', 7432.61, 'Paid'),
(997, 997, 'Wallet', 5127.26, 'Paid');


-- Verify imported row counts
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL SELECT 'categories', COUNT(*) FROM categories
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL SELECT 'payments', COUNT(*) FROM payments;


SHOW DATABASES;
USE retail_sales_db;
show tables;

DESCRIBE customers;
SELECT * FROM customers LIMIT 10;

-- step2 data profilling 
-- total count
SELECT COUNT(*) AS total_customers
FROM customers;

 -- Unique customers check 
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM customers;

  --  Duplicate customer IDs check
SELECT 
    customer_id,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;


    --  NULL values check
SELECT
    COUNT(*) AS total_rows,
    SUM(customer_name IS NULL) AS missing_names,
    SUM(email IS NULL) AS missing_emails,
    SUM(city IS NULL) AS missing_cities,
    SUM(state IS NULL) AS missing_states,
    SUM(signup_date IS NULL) AS missing_signup_dates
FROM customers;


-- Question 1: Display the first 10 records from each of the six tables.

SELECT 
    *
FROM
    customers
LIMIT 10;

SELECT *
FROM categories
LIMIT 10;

SELECT *
FROM products
LIMIT 10;

SELECT *
FROM orders
LIMIT 10;

SELECT *
FROM order_items
LIMIT 10;

SELECT *
FROM payments
LIMIT 10;

    --  Q2. Find the total number of records in all six tables.
SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_categories
FROM categories;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_order_items
FROM order_items;

SELECT COUNT(*) AS total_payments
FROM payments;


 -- Q3. Check for duplicate primary keys in all tables.

SELECT 'customers' AS table_name,
       COUNT(*) AS duplicate_ids
FROM (
    SELECT customer_id
    FROM customers
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) AS c

UNION ALL

SELECT 'categories', COUNT(*)
FROM (
    SELECT category_id
    FROM categories
    GROUP BY category_id
    HAVING COUNT(*) > 1
) AS c

UNION ALL

SELECT 'products', COUNT(*)
FROM (
    SELECT product_id
    FROM products
    GROUP BY product_id
    HAVING COUNT(*) > 1
) AS p

UNION ALL

SELECT 'orders', COUNT(*)
FROM (
    SELECT order_id
    FROM orders
    GROUP BY order_id
    HAVING COUNT(*) > 1
) AS o

UNION ALL

SELECT 'order_items', COUNT(*)
FROM (
    SELECT order_item_id
    FROM order_items
    GROUP BY order_item_id
    HAVING COUNT(*) > 1
) AS oi

UNION ALL

SELECT 'payments', COUNT(*)
FROM (
    SELECT payment_id
    FROM payments
    GROUP BY payment_id
    HAVING COUNT(*) > 1
) AS p;


--  Q4. Check NULL values across all six tables.
SELECT 'customers' AS table_name,
       SUM(customer_id IS NULL) AS missing_customer_id,
       SUM(customer_name IS NULL) AS missing_customer_name,
       SUM(email IS NULL) AS missing_email
FROM customers

UNION ALL

SELECT 'categories',
       SUM(category_id IS NULL),
       SUM(category_name IS NULL),
       NULL
FROM categories

UNION ALL

SELECT 'products',
       SUM(product_id IS NULL),
       SUM(product_name IS NULL),
       SUM(category_id IS NULL)
FROM products

UNION ALL

SELECT 'orders',
       SUM(order_id IS NULL),
       SUM(customer_id IS NULL),
       SUM(ship_date IS NULL)
FROM orders

UNION ALL

SELECT 'order_items',
       SUM(order_item_id IS NULL),
       SUM(order_id IS NULL),
       SUM(product_id IS NULL)
FROM order_items

UNION ALL

SELECT 'payments',
       SUM(payment_id IS NULL),
       SUM(order_id IS NULL),
       SUM(payment_method IS NULL)
FROM payments;



   -- Q6. How to check invalid foreign keys?
-- 1. Orders → Customers
SELECT 'orders' AS table_name,
       'customer_id' AS foreign_key,
       COUNT(*) AS invalid_records
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE o.customer_id IS NOT NULL
AND c.customer_id IS NULL

UNION ALL

-- 2. Products → Categories
SELECT 'products', 'category_id', COUNT(*)
FROM products p
LEFT JOIN categories c
ON p.category_id = c.category_id
WHERE p.category_id IS NOT NULL
AND c.category_id IS NULL

UNION ALL

-- 3. Order Items → Orders
SELECT 'order_items', 'order_id', COUNT(*)
FROM order_items oi
LEFT JOIN orders o
ON oi.order_id = o.order_id
WHERE oi.order_id IS NOT NULL
AND o.order_id IS NULL

UNION ALL

-- 4. Order Items → Products
SELECT 'order_items', 'product_id', COUNT(*)
FROM order_items oi
LEFT JOIN products p
ON oi.product_id = p.product_id
WHERE oi.product_id IS NOT NULL
AND p.product_id IS NULL

UNION ALL

-- 5. Payments → Orders
SELECT 'payments', 'order_id', COUNT(*)
FROM payments py
LEFT JOIN orders o
ON py.order_id = o.order_id
WHERE py.order_id IS NOT NULL
AND o.order_id IS NULL;



  -- Q8. Number of customers in each state
SELECT state, COUNT(*) AS total_customers
FROM customers
GROUP BY state;


 -- Q9. Count customers in each customer segment 
SELECT customer_segment, COUNT(*) AS total_customers
FROM customers
GROUP BY customer_segment;


--    Q10. Find customers who signed up during 2024
SELECT *
FROM customers
WHERE YEAR(signup_date) = 2024;


-- Q11. Identify the top 5 cities with the highest number of customers
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC
LIMIT 5;

 --  Q12. Find the total number of customers who signed up in each year.
    SELECT
    YEAR(signup_date) AS signup_year,
    COUNT(*) AS total_customers
FROM customers
GROUP BY YEAR(signup_date)
ORDER BY signup_year;

  -- Q13. Write an SQL query to calculate the total number of products available in each product category.
SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
ORDER BY total_products DESC;


    -- Q14. Write an SQL query to retrieve the top 10 most expensive products based on their unit selling price.
SELECT
    p.product_id,
    p.product_name,
    p.unit_price,
    c.category_name
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
ORDER BY p.unit_price DESC
LIMIT 10;

--   Q15  an SQL query to find products that have never appeared in the order_items table.
SELECT
    p.product_id,
    p.product_name,
    p.unit_price
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;


-- Q16. Write an SQL query to find the top 10 products with the highest total quantity sold.
  SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 10;



--    Q17. Write an SQL query to calculate the total net revenue generated by each product category.
SELECT
    c.category_name,
    SUM(oi.net_amount) AS total_revenue
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC;


--     Q18. Write an SQL query to calculate the total profit generated by each product.

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.net_amount) AS total_revenue,
    SUM(oi.quantity * p.unit_cost) AS total_cost,
    SUM(oi.net_amount) - SUM(oi.quantity * p.unit_cost) AS total_profit
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_profit DESC;

  -- Q19. Write an SQL query to calculate the following metrics across all order items:
-- 1. Total Gross Sales
-- 2. Total Discount Amount
-- 3. Total Net Sales

SELECT
    SUM(gross_amount) AS total_gross_sales,
    SUM(discount_amount) AS total_discount,
    SUM(net_amount) AS total_net_sales
FROM order_items;

--  Q20. Write an SQL query to calculate the total net revenue for each month.
    SELECT
    YEAR(o.order_date) AS sales_year,
    MONTH(o.order_date) AS sales_month,
    SUM(oi.net_amount) AS monthly_revenue
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date)
ORDER BY
    sales_year,
    sales_month;
    
     -- Q21.  Write an SQL query to calculate the Average Order Value (AOV).
     WITH order_totals AS (
    SELECT
        order_id,
        SUM(net_amount) AS order_revenue
    FROM order_items
    GROUP BY order_id
)
SELECT
    COUNT(order_id) AS total_orders,
    SUM(order_revenue) AS total_revenue,
    AVG(order_revenue) AS average_order_value
FROM order_totals;


  --  Q22. Write an SQL query to calculate the total number of orders and total net revenue generated on each order date.
   SELECT
    o.order_date,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.net_amount) AS daily_revenue
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_date
ORDER BY o.order_date;



--     Q23. Write an SQL query to retrieve the top 10 orders with the highest total net sales amount.
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    SUM(oi.net_amount) AS order_total
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    o.order_id,
    o.customer_id,
    o.order_date
ORDER BY order_total DESC
LIMIT 10;


   --  Q24. Write an SQL query to identify the top 10 products with the highest average discount percentage.
SELECT
    p.product_id,
    p.product_name,
    AVG(oi.discount_pct) AS average_discount,
    SUM(oi.discount_amount) AS total_discount_amount
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY average_discount DESC
LIMIT 10;


    --   Q25.  Write an SQL query to calculate the total number of payments and total payment amount for each payment method.

SELECT
    payment_method,
    COUNT(payment_id) AS total_payments,
    SUM(payment_amount) AS total_payment_amount
FROM payments
GROUP BY payment_method
ORDER BY total_payment_amount DESC;


   --  Q26.  Write an SQL query to calculate the total number of payments and percentage contribution of each payment status.
  SELECT
    payment_status,
    COUNT(payment_id) AS total_payments,
    ROUND(
        COUNT(payment_id) * 100.0 /
        (SELECT COUNT(*) FROM payments),
        2
    ) AS payment_percentage
FROM payments
GROUP BY payment_status
ORDER BY payment_percentage DESC;


--     Q27.  Write an SQL query to identify orders where the recorded payment amount does not match the total net sales amount.
      SELECT
    p.order_id,
    p.payment_amount,
    SUM(oi.net_amount) AS order_net_amount,
    p.payment_amount - SUM(oi.net_amount) AS difference_amount
FROM payments p
INNER JOIN order_items oi
    ON p.order_id = oi.order_id
GROUP BY
    p.order_id,
    p.payment_amount
HAVING p.payment_amount <> SUM(oi.net_amount);


 --  Q28.  Write an SQL query to:
-- 1. Display each order_status.
-- 2. Calculate the total number of orders under each status.
-- 3. Calculate the percentage of total orders for each status.
-- 4. Sort the results by the highest number of orders first.

SELECT
    order_status,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM orders),
        2
    ) AS order_percentage
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;


--  Q29. Write SQL queries to analyse shipping performance by displaying the order ID, order date, and ship date,
--  calculating the shipping duration in days for each order, 
-- finding the average shipping duration across all shipped orders,
--  and identifying orders where the ship date is still NULL.

SELECT
    order_id,
    order_date,
    ship_date,
    DATEDIFF(ship_date, order_date) AS shipping_days,
    AVG(DATEDIFF(ship_date, order_date)) OVER() AS average_shipping_days,
    CASE
        WHEN ship_date IS NULL THEN 'Not Shipped'
        ELSE 'Shipped'
    END AS shipping_status
FROM orders;

    -- Q30. Write an SQL query to calculate the total spending of each customer, 
-- rank customers from highest to lowest spending using a window function,
--  and display the top 5 customers along with their customer ID, customer name, total spending, and spending rank.
WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.net_amount) AS total_spending
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    INNER JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY
        c.customer_id,
        c.customer_name
)
SELECT
    customer_id,
    customer_name,
    total_spending,
    DENSE_RANK() OVER (
        ORDER BY total_spending DESC
    ) AS spending_rank
FROM customer_spending
ORDER BY spending_rank
LIMIT 5;

 --  Q31.Write an SQL query to identify customers who have placed more than one order. 
-- Display their customer ID, customer name, total number of orders,
--  and total spending. Sort the results by total number of orders in descending order.
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.net_amount) AS total_spending
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY total_orders DESC;

-- Q32. Write an SQL query to calculate the lifetime spending of each customer and classify customers into three categories based on their total spending:
-- - High Value: Spending greater than ₹10,000
-- - Medium Value: Spending between ₹5,000 and ₹10,000
-- - Low Value: Spending below ₹5,000

SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.net_amount) AS total_spending,
    CASE
        WHEN SUM(oi.net_amount) > 10000 THEN 'High Value'
        WHEN SUM(oi.net_amount) >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_category
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spending DESC;


    -- Q33. Write an SQL query to calculate product-wise total revenue, total cost, total profit, and profit margin percentage. Display product ID, product name,
--  total quantity sold, total revenue, total cost, total profit, 
--  and profit margin percentage. Sort the results by profit margin percentage in descending order.
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.net_amount) AS total_revenue,
    SUM(oi.quantity * p.unit_cost) AS total_cost,

    SUM(oi.net_amount) -
    SUM(oi.quantity * p.unit_cost) AS total_profit,

    ROUND(
        (
            (SUM(oi.net_amount) -
             SUM(oi.quantity * p.unit_cost))
            / SUM(oi.net_amount)
        ) * 100,
        2
    ) AS profit_margin_percentage

FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id

GROUP BY
    p.product_id,
    p.product_name

ORDER BY profit_margin_percentage DESC;

  --   Q34. Write an SQL query to calculate the total number of orders, first order date, most recent order date, 
-- and average number of days between orders for each customer who has placed at least two orders. 
-- Display customer ID, customer name, total orders, first order date, latest order date, and average days between orders. 
--  Sort the results by total orders in descending order.

WITH customer_orders AS (
    SELECT
        c.customer_id,
        c.customer_name,
        o.order_id,
        o.order_date,

        LAG(o.order_date) OVER (
            PARTITION BY c.customer_id
            ORDER BY o.order_date
        ) AS previous_order_date

    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
),

order_gaps AS (
    SELECT
        customer_id,
        customer_name,
        order_id,
        order_date,
        previous_order_date,

        DATEDIFF(
            order_date,
            previous_order_date
        ) AS days_between_orders

    FROM customer_orders
)

SELECT
    customer_id,
    customer_name,
    COUNT(order_id) AS total_orders,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS latest_order_date,
    ROUND(AVG(days_between_orders), 2) AS average_days_between_orders

FROM order_gaps

GROUP BY
    customer_id,
    customer_name

HAVING COUNT(order_id) >= 2

ORDER BY total_orders DESC;


  -- Q36 Write an SQL query to calculate monthly revenue, previous month's revenue, the difference in revenue compared to the previous month, 
-- and the month-over-month revenue growth percentage. Display sales year, sales month, current month revenue, previous month revenue, 
-- revenue difference, and growth percentage. Sort the results chronologically.
WITH monthly_sales AS (
    SELECT
        YEAR(o.order_date) AS sales_year,
        MONTH(o.order_date) AS sales_month,
        SUM(oi.net_amount) AS current_month_revenue
    FROM orders o
    INNER JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY
        YEAR(o.order_date),
        MONTH(o.order_date)
),

previous_sales AS (
    SELECT
        sales_year,
        sales_month,
        current_month_revenue,

        LAG(current_month_revenue) OVER (
            ORDER BY sales_year, sales_month
        ) AS previous_month_revenue

    FROM monthly_sales
)

SELECT
    sales_year,
    sales_month,
    current_month_revenue,
    previous_month_revenue,

    current_month_revenue - previous_month_revenue
        AS revenue_difference,

    ROUND(
        CASE
            WHEN previous_month_revenue IS NULL
                 OR previous_month_revenue = 0
            THEN NULL
            ELSE
                ((current_month_revenue - previous_month_revenue)
                / previous_month_revenue) * 100
        END,
        2
    ) AS growth_percentage

FROM previous_sales
ORDER BY sales_year, sales_month;

    -- Q37. Write an SQL query to identify customers who placed orders in at least two consecutive calendar months. 
-- Display customer ID, customer name, the month of purchase, and the previous purchase month.
--  Sort the results by customer ID and purchase month.
     WITH customer_months AS (
    SELECT DISTINCT
        c.customer_id,
        c.customer_name,
        DATE_FORMAT(o.order_date, '%Y-%m-01') AS purchase_month
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
),

previous_months AS (
    SELECT
        customer_id,
        customer_name,
        purchase_month,

        LAG(purchase_month) OVER (
            PARTITION BY customer_id
            ORDER BY purchase_month
        ) AS previous_purchase_month

    FROM customer_months
)

SELECT
    customer_id,
    customer_name,
    purchase_month,
    previous_purchase_month
FROM previous_months
WHERE DATE_ADD(
    previous_purchase_month,
    INTERVAL 1 MONTH
) = purchase_month
ORDER BY
    customer_id,
    purchase_month;


   -- Q38. Write an SQL query to calculate yearly revenue, previous year's revenue,
--    revenue difference, and year-over-year revenue growth percentage. 
--    Display sales year, current year revenue, previous year revenue, revenue difference, and growth percentage.
--    Sort the results chronologically. 
       WITH yearly_sales AS (
    SELECT
        YEAR(o.order_date) AS sales_year,
        SUM(oi.net_amount) AS current_year_revenue
    FROM orders o
    INNER JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY YEAR(o.order_date)
),

previous_sales AS (
    SELECT
        sales_year,
        current_year_revenue,

        LAG(current_year_revenue) OVER (
            ORDER BY sales_year
        ) AS previous_year_revenue

    FROM yearly_sales
)

SELECT
    sales_year,
    current_year_revenue,
    previous_year_revenue,

    current_year_revenue - previous_year_revenue
        AS revenue_difference,

    ROUND(
        CASE
            WHEN previous_year_revenue IS NULL
                 OR previous_year_revenue = 0
            THEN NULL
            ELSE
                (
                    (current_year_revenue - previous_year_revenue)
                    / previous_year_revenue
                ) * 100
        END,
        2
    ) AS yoy_growth_percentage

FROM previous_sales
ORDER BY sales_year;



  --  Q39.  Write an SQL query to find the product with the highest total quantity sold in each product category. 
--    Display category name, product ID, product name, total quantity sold, and product rank.
--    If multiple products have the same highest quantity sold, include all tied products.
	WITH product_sales AS (
    SELECT
        c.category_name,
        p.product_id,
        p.product_name,
        SUM(oi.quantity) AS total_quantity_sold
    FROM categories c
    INNER JOIN products p
        ON c.category_id = p.category_id
    INNER JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY
        c.category_id,
        c.category_name,
        p.product_id,
        p.product_name
),

product_ranking AS (
    SELECT
        category_name,
        product_id,
        product_name,
        total_quantity_sold,

        DENSE_RANK() OVER (
            PARTITION BY category_name
            ORDER BY total_quantity_sold DESC
        ) AS product_rank

    FROM product_sales
)

SELECT
    category_name,
    product_id,
    product_name,
    total_quantity_sold,
    product_rank
FROM product_ranking
WHERE product_rank = 1
ORDER BY category_name;



    --  Q40.  Write an SQL query to calculate each customer's total spending, their percentage contribution to overall revenue, and their cumulative revenue contribution.
--  Display customer ID, customer name, total spending, revenue contribution percentage, and cumulative revenue percentage.
--  Sort the results by total spending in descending order.

WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.net_amount) AS total_spending
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    INNER JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY
        c.customer_id,
        c.customer_name
),

revenue_analysis AS (
    SELECT
        customer_id,
        customer_name,
        total_spending,

        SUM(total_spending) OVER() AS overall_revenue,

        SUM(total_spending) OVER(
            ORDER BY total_spending DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS cumulative_revenue

    FROM customer_revenue
)

SELECT
    customer_id,
    customer_name,
    total_spending,

    ROUND(
        total_spending * 100.0 / overall_revenue,
        2
    ) AS revenue_contribution_percentage,

    ROUND(
        cumulative_revenue * 100.0 / overall_revenue,
        2
    ) AS cumulative_revenue_percentage

FROM revenue_analysis
ORDER BY total_spending DESC;