-- TABLE
CREATE TABLE demo (ID integer primary key, Name varchar(20), Hint text );
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2)
);
 INSERT INTO Orders (order_id, customer_id, order_date, product_id, quantity, price) VALUES
(1, 101, '2024-01-01', 501, 2, 15.00),
(2, 102, '2024-01-03', 502, 1, 25.00),
(3, 101, '2024-01-04', 501, 3, 15.00),
(4, 103, '2024-01-05', 503, 1, 30.00),
(5, 104, '2024-01-06', 501, 4, 15.00),
(6, 102, '2024-01-07', 504, 2, 20.00);

--count total orders--
select count(DISTINCT order_id) from Orders;
-- total revenue generated--
SELECT SUM(quantity * price) AS total_revenue FROM Orders;
-- number of orders/customer--
select customer_id,count(*) as order_count
from Orders
GROUP by customer_id;
--revenue/order--
Select product_id, sum(quantity*price) as Revenue_Per_Product
from Orders
group by product_id;
--orders placed in january--
select * 
from Orders
where order_date between '2024-01-01' AND '2024-01-31';
--Top Customers by Revenue--
Select customer_id, sum(price*quantity) as total_spent
from Orders
group by customer_id
order by total_spent desc;
--AOV--
SELECT order_date, sum(price*quantity)/count(order_date)
from Orders
group by order_date;
--most ordered product--
SELECT product_id, SUM(quantity) AS total_quantity
FROM Orders
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 1;
--customers who have placed more than one order--
SELECT customer_id 
FROM orders 
GROUP BY customer_id 
HAVING COUNT(customer_id) > 1;
--revenue/day--
select order_date, sum(quantity*price) as revenue_per_day
from Orders
group by order_date;

 
