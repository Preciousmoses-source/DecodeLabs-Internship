---- DATA HAS ALREADY BEEN CLEANED USING EXCEL

SELECT *
FROM sales_data;

---- CONVERTING THE DATE COLUMN INTO DATE FORMAT
SELECT 
    `Date`,
    STR_TO_DATE(`Date`, '%d/%m/%Y') AS Converted_Date
FROM sales_data;

ALTER TABLE sales_data
ADD COLUMN Converted_Date DATE;

UPDATE sales_data
SET Converted_Date = STR_TO_DATE(`Date`, '%d/%m/%Y');

ALTER TABLE sales_data DROP COLUMN `Date`;

ALTER TABLE sales_data CHANGE Converted_Date `Date` DATE;


---- 1. BASIC OVERVIEW & SHAPE OF DATA

---- 1.1 View a sample of the data to understand its structure
SELECT * FROM sales_data 
LIMIT 10;

---- 1.2 Get the total number of records (orders) and unique customers
SELECT 
    COUNT(Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Unique_Customers,
    COUNT(DISTINCT Product) AS Unique_Products
FROM sales_data;

---- 1.3 Find the date range of the dataset

SELECT 
    MIN(CAST(Date AS DATE)) AS First_Order_Date,
    MAX(CAST(Date AS DATE)) AS Last_Order_Date
FROM sales_data;




---- 3. DESCRIPTIVE STATISTICS (Numeric Columns)

---- 3.1 Calculate basic statistics for pricing and quantities
SELECT 
    MIN(Total_Price) AS Min_Total_Price,
    MAX(Total_Price) AS Max_Total_Price,
    ROUND(AVG(Total_Price), 2) AS Avg_Order_Value ,
    MIN(Quantity) AS Min_Quantity,
    MAX(Quantity) AS Max_Quantity,
    ROUND(AVG(Quantity), 2) AS Avg_Quantity_Per_Order,
    ROUND(AVG(Items_In_Cart), 2) AS Avg_Cart_Size
FROM sales_data;


---- 4. CATEGORICAL ANALYSIS (Products, Status, Payment, Referrals)

---- 4.1 Product Performance: Top selling products by Revenue and Volume
SELECT 
    Product,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Quantity) AS Total_Units_Sold,
    ROUND(SUM(Total_Price), 2) AS Total_Revenue
FROM sales_data
GROUP BY Product
ORDER BY Total_Revenue DESC;

---- 4.2 Order Status Distribution (Fulfillment Rate)
SELECT 
    Order_Status,
    COUNT(Order_ID) AS Order_Count,
    ROUND(COUNT(Order_ID) * 100.0 / (SELECT COUNT(*) FROM sales_data), 2) AS Percentage
FROM sales_data
GROUP BY Order_Status
ORDER BY Order_Count DESC;

---- 4.3 Payment Method Preferences
SELECT 
    Payment_Method,
    COUNT(Order_ID) AS Usage_Count,
    ROUND(SUM(Total_Price), 2) AS Revenue_Generated
FROM sales_data
GROUP BY Payment_Method
ORDER BY Usage_Count DESC;

---- 4.4 Customer Acquisition: Best Referral Sources
SELECT 
    Referral_Source,
    COUNT(Order_ID) AS Number_Of_Acquisitions,
    ROUND(SUM(Total_Price), 2) AS Revenue_From_Source
FROM sales_data
GROUP BY Referral_Source
ORDER BY Number_Of_Acquisitions DESC;


---- 5. COUPON & MARKETING ANALYSIS

---- 5.1 Coupon Usage Rate
SELECT 
    `Coupon_used/not` AS Coupon_Status,
    COUNT(Order_ID) AS Order_Count,
    ROUND(
        COUNT(Order_ID) * 100.0 / (SELECT COUNT(*) FROM sales_data), 
        2
    ) AS Percentage_of_Total
FROM sales_data
GROUP BY `Coupon_used/not`;


---- 5.2 Most Popular Coupon Codes
SELECT 
    Coupon_Code,
    COUNT(Order_ID) AS Times_Used,
    ROUND(SUM(Total_Price), 2) AS Revenue_Generated
FROM sales_data
WHERE `Coupon_used/not` = 'COUPON USED' 
  AND Coupon_Code != 'NO COUPON'
GROUP BY Coupon_Code
ORDER BY Times_Used DESC;


-- 5.3 Average Order Value (AOV): Coupon vs. No Coupon
SELECT 
    `Coupon_used/not`,
    ROUND(AVG(Total_Price), 2) AS Average_Order_Value,
    ROUND(AVG(Quantity), 2) AS Avg_Quantity_Purchased
FROM sales_data
GROUP BY `Coupon_used/not`;


---- 6. CUSTOMER ANALYSIS

---- 6.1 Top 10 Customers by Lifetime Value (Total Revenue)
SELECT 
    Customer_ID,
    COUNT(Order_ID) AS Total_Purchases,
    ROUND(SUM(Total_Price), 2) AS Lifetime_Value
FROM sales_data
GROUP BY Customer_ID
ORDER BY Lifetime_Value DESC
LIMIT 10;

-- 6.2 Customer Frequency (One-time buyers vs Repeat customers)
WITH CustomerPurchaseCounts AS (
    SELECT 
        Customer_ID, 
        COUNT(Order_ID) AS Purchase_Count
    FROM sales_data
    GROUP BY Customer_ID
)
SELECT 
    CASE 
        WHEN Purchase_Count = 1 THEN 'One-Time Buyer'
        WHEN Purchase_Count BETWEEN 2 AND 5 THEN 'Repeat (2-5)'
        ELSE 'Frequent (>5)'
    END AS Buyer_Type,
    COUNT(Customer_ID) AS Number_of_Customers
FROM CustomerPurchaseCounts
GROUP BY 
    CASE 
        WHEN Purchase_Count = 1 THEN 'One-Time Buyer'
        WHEN Purchase_Count BETWEEN 2 AND 5 THEN 'Repeat (2-5)'
        ELSE 'Frequent (>5)'
    END;


---- 7. TEMPORAL / TIME-SERIES ANALYSIS

---- 7.1 Monthly Sales Revenue & Growth
SELECT 
    EXTRACT(YEAR FROM CAST(Date AS DATE)) AS Sales_Year,
    EXTRACT(MONTH FROM CAST(Date AS DATE)) AS Sales_Month,
    COUNT(Order_ID) AS Total_Orders,
    ROUND(SUM(Total_Price), 2) AS Monthly_Revenue
FROM sales_data
GROUP BY 
    EXTRACT(YEAR FROM CAST(Date AS DATE)),
    EXTRACT(MONTH FROM CAST(Date AS DATE))
ORDER BY 
    Sales_Year, 
    Sales_Month;

---- 7.2 Sales Distribution by Day of the Week
-- (Dialect Specific: PostgreSQL uses EXTRACT(DOW), MySQL uses DAYOFWEEK)
SELECT 
    TO_CHAR(CAST(Date AS DATE), 'Day') AS Day_of_Week, -- Standard PostgreSQL/Snowflake syntax
    COUNT(Order_ID) AS Total_Orders,
    ROUND(SUM(Total_Price), 2) AS Revenue
FROM sales_data
GROUP BY TO_CHAR(CAST(Date AS DATE), 'Day')
ORDER BY Total_Orders DESC;