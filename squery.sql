select * from SALES_DATA;

#1 Total Sales by Product:

SELECT Product_Name, SUM(Quantity) AS Total_Sales
FROM sales_data
GROUP BY Product_Name
ORDER BY Total_Sales DESC;

#2 Top 10 Customers by Total Spending:

SELECT CustomerKey, Name, SUM(Cost_Price) AS Total_Spending
FROM sales_data
GROUP BY CustomerKey, Name
ORDER BY Total_Spending DESC
LIMIT 10;

#3 Total Profit by Category:
SELECT Category,SUM(Profit) AS TOTAL_PROFIT
FROM sales_data
GROUP BY Category
ORDER BY TOTAL_PROFIT DESC;

#4 Average Profit Margin by Brand
SELECT Brand, AVG(Profit_margin) AS Avg_Profit_Margin
FROM sales_data
GROUP BY Brand
ORDER BY Avg_Profit_Margin DESC;

#5 Sales by Continent:

SELECT Continent, SUM(Revenue) AS Total_SAlE
FROM sales_data
GROUP BY Continent
ORDER BY Total_SAlE DESC;

#6 Sales by Store:
SELECT StoreKey, SUM(Revenue) AS Total_Sales
FROM sales_data
GROUP BY StoreKey
ORDER BY Total_Sales DESC
LIMIT 05;

#7 Sales Distribution by Gender:
SELECT Gender, SUM(Revenue) AS Total_Sales
FROM sales_data
GROUP BY Gender;

#8 Most Popular Products by Quantity Sold:
SELECT Product_Name, SUM(Quantity) AS Total_Quantity
FROM sales_data
GROUP BY Product_Name
ORDER BY Total_Quantity DESC;

#9 Most orders selling store_state :

SELECT store_state, SUM(Quantity) AS Total_Quantity
FROM sales_data
GROUP BY store_state
ORDER BY Total_Quantity DESC;

#10 Most quantity selling store_state without online 

SELECT store_state, SUM(Quantity) AS Total_Quantity
FROM sales_data
WHERE store_state <> 'online' 
GROUP BY store_state
ORDER BY Total_Quantity DESC
limit 5;

#11 Top 5 States by Total Sales:

SELECT Customer_State, SUM(Revenue) AS Total_Sales
FROM sales_data
GROUP BY Customer_State
ORDER BY Total_Sales DESC
LIMIT 5;

#12 Profit Analysis by Store:
SELECT StoreKey, store_state,store_Country,SUM(profit) AS Total_Profit
FROM sales_data
GROUP BY StoreKey,store_state,store_Country
ORDER BY Total_Profit DESC;


#13 Average Age of Customers by Product:
SELECT Product_Name, AVG(Age) AS Avg_Age
FROM sales_data
GROUP BY Product_Name
ORDER BY Avg_Age;

#14 Average Shipping Interval by Store:
SELECT StoreKey, AVG(shipping_interval) AS Avg_Shipping_Interval
FROM sales_data
GROUP BY StoreKey
ORDER BY Avg_Shipping_Interval desc;

## Find trends

#15 total profit by each month
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS Month, SUM(profit) AS Total_Sales
FROM sales_data
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY Month;

#16 total Revenue by each month

SELECT DATE_FORMAT(OrderDate, '%Y') AS Month, SUM(Revenue) AS Total_Sales
FROM sales_data
GROUP BY Month
ORDER BY Month;

#17 growth percentage

SELECT 
    DATE_FORMAT(OrderDate, '%Y') AS Year, 
    SUM(Revenue) AS Total_Sales,
    LAG(SUM(Revenue)) OVER (ORDER BY DATE_FORMAT(OrderDate, '%Y')) AS Previous_Year_Sales,
    (SUM(Revenue) - LAG(SUM(Revenue)) OVER (ORDER BY DATE_FORMAT(OrderDate, '%Y'))) / LAG(SUM(Revenue)) OVER (ORDER BY DATE_FORMAT(OrderDate, '%Y'))*100 AS Growth_Rate
FROM sales_data
GROUP BY Year
ORDER BY Year;





