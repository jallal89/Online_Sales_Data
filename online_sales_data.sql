-- In this project, we use a database named: online_sales_data 
-- Note: SQL Server shows numeric values left-sided, even with functions it does not change (see attempts below)
USE online_sales_data
-- Q1: Write a SQL statement to return all data from both tables, orders and purchase_details 
SELECT * 
FROM Orders FULL OUTER JOIN purchase_details
ON Orders.Order_ID = purchase_details.Order_ID;

-- Q2: Write a query to format Quantity column as follow: add two decimal places and show right alignment
SELECT FORMAT(Quantity, 'N2') AS Quantity
FROM purchase_details;

-- When we run the query to select *, the Quantity column above shows values left sides as before
-- This is  SQL server Grid result restriction that we can not change with writing queries 

-- Q3: Write a query to check for null values in CustomerName, City and Order_ID columns 

SELECT * from Orders
WHERE CustomerName IS NULL OR City IS NULL OR Order_ID IS NULL;

-- Q4: write a select statement to add dollar sign ($) to both, Amount and Profit columns 
SELECT '$' + CAST(Amount AS VARCHAR(20)) AS Amount, 
		'$' + CAST(Profit AS VARCHAR(20)) AS Profit
FROM purchase_details;

-- Q5: The above statement worked, but it did not permanently change it
-- we will use the UPDATE function to try to permanently update those two columns by adding $

UPDATE purchase_details
SET Amount = '$' + CAST(Amount AS VARCHAR(20)),
	Profit = '$' + CAST(Profit AS VARCHAR(20));

-- Q6: Even after conducting the UPDATE function, we see that the Profit and Amount did not change
-- the functions we used are properly used and therefore, it is likely SQL Server issue
SELECT * FROM purchase_details

-- Currently, our date shows as yyyy-mm-dd, but we want it as dd-mm-yyyy
-- Q7: Write a select statement to change data type as explained above 

SELECT CONVERT(VARCHAR(10), Order_Date, 103) AS Order_Date
FROM Orders;

-- Q8: write a query to select CustomerName, State And from Orders, and amount, profit and quantity from purchase_details
-- the query should return ALL records from Orders table, even if there is no matching record from purchase_details

SELECT CustomerName, State, Amount, Profit, Quantity
FROM Orders LEFT JOIN purchase_details
ON Orders.Order_ID = purchase_details.Order_ID;

--Q9: Rewrite the above query but only include records that are a match in both tables 
-- Ensure it is listed by Quantity in ascending orders(smallest to largest)

SELECT CustomerName, State, Amount, Profit, Quantity
FROM Orders INNER JOIN purchase_details
ON Orders.Order_ID = purchase_details.Order_ID
ORDER BY Quantity ASC;


--Q10: Write a query to select order_date and City from Orders, and category, sub_category and paymentMode from Purchase_details
-- Order by orderdate in desc order

SELECT Order_Date, City, Category, Sub_Category, PaymentMode 
FROM Orders
LEFT JOIN purchase_details
on Orders.Order_ID = purchase_details.Order_ID
ORDER BY Order_Date DESC;

--Q11: Write a SELECT statement to return Online_sales data as follow: customer name, Profit, quantity, Category
-- Group orders based on their category

SELECT O.CustomerName,FORMAT(SUM(PD.Profit), 'C', 'en-US') AS Profit,  SUM(PD.Quantity) AS Quantity, PD.Category
FROM Orders O INNER JOIN purchase_details PD
ON O.Order_ID = PD.Order_ID 
GROUP BY O.CustomerName, PD.Category


--Q12: Write a query to generate a combination of orders data with purchase_details and show them as a list 

SELECT * 
FROM Orders 
CROSS JOIN purchase_details;

--Q13: Write a query to combine and return data for all sales orders of any customers that have matching profit and quantity

SELECT Orders.CustomerName, FORMAT(SUM(purchase_details.Profit), 'C', 'en-US') AS Profit,
SUM(purchase_details.Quantity) AS Quantity
FROM Orders
FULL OUTER JOIN purchase_details
ON Orders.Order_ID = purchase_details.Order_ID
GROUP BY CustomerName;

--Q14: Find all orders whith a specific order Id

SELECT *
FROM Orders
WHERE State = (SELECT State FROM Orders WHERE Order_ID = 'B-25601');

-- The above query did return data, however, results were not specific, this is likely due to subquery condition
--Q15 We can directly filter based on the same ID without needing Subquery

SELECT * 
FROM Orders
WHERE Order_ID = 'B-25601';

--Q16: Find city where orders were places in the date: 2018-08-04

SELECT * 
FROM Orders
WHERE City = (SELECT City FROM Orders WHERE Order_Date = '2018-08-04');


-- Different dates were pulled not just the desired date 
--Q17: We will use direct filtering based on a specific date and results should be 1 date

SELECT Order_Date, City
FROM Orders
WHERE Order_Date = '2018-08-04';

--Q18: Find all customers, their city, and order date that placed more than 7 online sales orders

SELECT Orders.Order_Date, Orders.CustomerName, Orders.City, purchase_details.Quantity

FROM Orders INNER JOIN purchase_details
ON Orders.Order_ID = purchase_details.Order_ID
WHERE Quantity > 7;

--Q19: Return customer names of people who made online sales orders to purchase clothes that has profit of at least $230 as total

SELECT Orders.CustomerName, FORMAT(purchase_details.Profit, 'C', 'en-US'), purchase_details.Category
FROM Orders INNER JOIN purchase_details
ON Orders.Order_ID = purchase_details.Order_ID 
WHERE Profit >= 230 AND Category = 'Clothing'
ORDER BY Profit ASC;

--Q20: return online sales orders of electrnics games that were ordered by credit cards 

SELECT * 
FROM purchase_details
where Category = 'Electronics' AND Sub_Category = 'Electronic Games' AND PaymentMode = 'Credit Card';

-- Q21: List all online sales details of orders that had profit between $400 to $600 and where ordered 2018-01-01 to 2018-12-31

SELECT Orders.CustomerName, Orders.Order_Date, FORMAT(SUM(purchase_details.Profit), 'C','en-US') AS Profit
FROM Orders INNER JOIN purchase_details
ON Orders.Order_ID = purchase_details.Order_ID
WHERE Profit BETWEEN 400 AND 600 AND (Order_Date BETWEEN '2018-01-01' AND '2018-12-31')
GROUP BY CustomerName, Profit, Order_Date
ORDER BY Order_Date ASC;

--Q22: Find total profit or loss for each state and for the date after 2018-05-20

SELECT Orders.State,Orders.Order_Date, FORMAT(SUM(purchase_details.Profit), 'C', 'en-US') AS Profit 
FROM Orders INNER JOIN purchase_details
ON Orders.Order_ID = purchase_details.Order_ID 
WHERE Order_Date > '2018-05-20'
GROUP BY State, Profit, Order_Date
ORDER BY Order_Date ASC;

--Q23: Find date between january 2018 to Dec 2019 where customers made purchase for funiture and used EMI payment method

SELECT Orders.CustomerName, Orders.Order_Date, purchase_details.Category, purchase_details.PaymentMode
FROM Orders LEFT JOIN purchase_details
ON Orders.Order_ID = purchase_details.Order_ID
WHERE Order_Date BETWEEN '2018-01-01' AND '2019-12-31' AND (Category = 'Furniture') AND (PaymentMode = 'EMI')
ORDER BY Order_Date ASC;

--Q24: Find locations of customers who purchased more than 2 trousers and at least 4 Sarees

SELECT Orders.CustomerName, Orders.State, Orders.City, purchase_details.Sub_Category, purchase_details.Quantity
FROM Orders INNER JOIN purchase_details
ON Orders.Order_ID = purchase_details.Order_ID
WHERE Sub_Category IN ('Trousers', 'Saree') AND (Quantity > 2 AND Quantity >= 4);
