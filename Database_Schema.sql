
--1 Customers 
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  signup_date DATE,
  country VARCHAR(50)
);


--2 Orders
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  order_value DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


--3 Products
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  category VARCHAR(50)
);


--Order_items
CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);



