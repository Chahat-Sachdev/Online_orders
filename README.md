# Online_orders
Online orders marks as a milestone of my application of my knowledge in SQL to data analysis, it analysis simple questions like orders/day to important business questions like Average order value , using aggregate functions, group functions and much more!  

DATA ANALYSIS EXAMPLES

--Input creating table--
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

--Table: Orders--
| order_id	    | customer_id   |	order_date   | product_id |	quantity	 | price      | 
| ------------- | ------------- | ------------  ------------ ------------ ------------
|      1	      |      101	    |  01/01/2024	 |     501	  |     2       |	  15      |
| 	   2        |      102	    |  03/01/2024	 |     502	  |     1	      |   25      |
|      3        |      101	    |  04/01/2024	 |     501	  |     3	      |   15      |
|      4        |      103	    |  05/01/2024	 |     503	  |     1	      |   30      |
|	     5        |      104	    |  06/01/2024	 |     501	  |     4       |	  15      |
|	     6        |      102	    |  07/01/2024	 |     504	  |     2	      |   20      |

--Query1: count total orders--
select count(DISTINCT order_id) from Orders;

--Output 1--
6

--Query 2: total revenue generated--
  SELECT SUM(quantity * price) AS total_revenue FROM Orders;

  --Output 2--
  230

  --Query 3: number of orders/customer--
  Select customer_id,count(*) as order_count
  From Orders
  GROUP by customer_id;

  --Output 3--
  | customer_id	    | Order_count   |
  | -------------   | ------------- |
  |      101        |      2  	    |
  |      102        |      2  	    |
  |      103	      |      1   	    |
  |      104	      |      1        |

  --Query 4: revenue/order--
  Select product_id, sum(quantity*price) as Revenue_Per_Product
  From Orders
  Group by product_id;

  --Output 3--
  | Product_id      | Order_count   |
  | -------------   | ------------- |
  |      501        |      135  	  |
  |      502        |      25  	    |
  |      503	      |      30   	  |
  |      504	      |      40       |

