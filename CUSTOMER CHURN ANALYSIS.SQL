-- 1) Total No of Customers

SELECT COUNT(*) AS Total_Customers
FROM customer_churn;


-- 2) Churn Rate(%)

SELECT ROUND(COUNT(CASE WHEN Churn=1 THEN 1
END)*100/COUNT(*),2) AS Churn_Rate
FROM customer_churn


-- 3) Active vs Churned Customers

SELECT Churn,COUNT(*) AS Customers
FROM customer_churn
GROUP BY Churn;


-- 4) Gender wise Churn Analysis

SELECT Gender,Churn,COUNT(*) AS Customers
FROM customer_churn
GROUP BY Gender,Churn
ORDER BY Gender;


-- 5)Subscription Type Analysis

SELECT
"Subscription Type",
COUNT(*) AS Total_Customers,
ROUND(AVG("Total Spend"),2)AS Avg_Spend
FROM customer_churn
GROUP BY "Subscription Type"
ORDER BY Total_Customers DESC;


-- 6) Contract Length vs Churn

SELECT 
"Contract Length",
COUNT(*) AS Customers,
SUM(Churn) AS Churned_Customers
FROM customer_churn
GROUP BY "Contract Length";


-- 7) Average Spending by Subscription Type

SELECT 
"Subscription_Type",
ROUND(AVG("TotalSpend"),2) AS Average_Spend
FROM customer_churn
GROUP BY "Subscription_Type"
ORDER BY Average_Spend DESC;


-- 8) Top 10 Highest Spending Customers

SELECT CustomerID, Age,Gender,"Total_Spend"
FROM customer_churn
ORDER BY "Total Spend" DESC
LIMIT 10;


-- 9) Average Tenure By Churn Status

SELECT Churn,
ROUND(AVG(Tenure),2)AS Average_Tenure
FROM customer_churn
GROUP BY Churn;


-- 10) Support Calls vs Churn

SELECT 
"Support Calls",
COUNT(*) AS Customers,
SUM(Churn) AS Churned_Customers
FROM customer_churn
GROUP BY "Support Calls"
ORDER BY "Support Calls";


-- 11) Pyment Delay Analysis

SELECT 
"Payment Delay",
COUNT(*) AS Customers
FROM customer_churn
GROUP BY "Payment Delay"
ORDER BY "Payment Delay" DESC;


-- 12) TOP 5 Ages with Highest Churn

SELECT
Age,
COUNT(*) AS Churned_Customers
FROM customer_churn
WHERE Churn=1
GROUP BY Age
ORDER BY Churned_Customers DESC
LIMIT 5;


