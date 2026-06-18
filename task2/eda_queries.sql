-- ApexPlanet Task 2: Business Intelligence Queries

-- Q1: Top 5 products by total revenue
SELECT Product, Category, ROUND(SUM(Total_Sales), 2) AS Revenue
FROM sales_data
GROUP BY Product, Category
ORDER BY Revenue DESC
LIMIT 5;

-- Q2: Order volume and revenue by city (with Nan handling fix)
SELECT 
    CASE WHEN City = 'Nan' THEN 'Unknown' ELSE City END AS Clean_City, 
    COUNT(Order_ID) AS Total_Orders, 
    ROUND(SUM(Total_Sales), 2) AS Total_Revenue
FROM sales_data
GROUP BY Clean_City
ORDER BY Total_Orders DESC;

-- Q3: Average Order Value (AOV) by Age Group
SELECT Age_Group, ROUND(AVG(Total_Sales), 2) AS Avg_Order_Value
FROM sales_data
GROUP BY Age_Group
ORDER BY Avg_Order_Value DESC;

-- Q4: Product Category Share by Gender
SELECT Gender, Category, SUM(Quantity) AS Total_Units_Sold, ROUND(SUM(Total_Sales), 2) AS Total_Revenue
FROM sales_data
GROUP BY Gender, Category
ORDER BY Gender, Total_Revenue DESC;

-- Q5: Top 3 VIP Customers
SELECT Customer_ID, Customer_Name, ROUND(SUM(Total_Sales), 2) AS Lifetime_Value
FROM sales_data
GROUP BY Customer_ID, Customer_Name
ORDER BY Lifetime_Value DESC
LIMIT 3;

-- Q6: Monthly Revenue Trends
SELECT strftime('%Y-%m', Order_Date) AS Month, ROUND(SUM(Total_Sales), 2) AS Monthly_Revenue
FROM sales_data
GROUP BY Month
ORDER BY Month ASC;
