---Inserting values

INSERT INTO customers VALUES
(1,'2023-01-05','India'),
(2,'2023-01-15','India'),
(3,'2023-02-01','USA'),
(4,'2023-02-20','UK'),
(5,'2023-03-10','India');


INSERT INTO products VALUES
(1,'Wireless Mouse','Electronics'),
(2,'Bluetooth Headphones','Electronics'),
(3,'Running Shoes','Fashion'),
(4,'Smart Watch','Electronics'),
(5,'Backpack','Accessories');


INSERT INTO orders VALUES
(101,1,'2023-01-10',1500),
(102,1,'2023-02-15',2200),
(103,2,'2023-01-20',800),
(104,3,'2023-03-05',3200),
(105,4,'2023-03-18',1800);


INSERT INTO order_items VALUES
(1,101,1,1,1500),
(2,102,2,1,2200),
(3,103,5,1,800),
(4,104,4,1,3200),
(5,105,3,1,1800);