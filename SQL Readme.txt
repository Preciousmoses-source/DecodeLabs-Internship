Exploratory Data Analysis of an E-commerce brand using MySQL


Author: Moses Precious


Tools Used: MySQL


Project objective: Using SQL queries to extract key insights from the e-commerce dataset provided


Data insights; The underlying dataset (SQL.csv) contains transactions spanning several years.

Each record represents an individual customer order containing specific detail about purchase metrics, shipping status, and promotional usage.

Data Cleaning; Data was already cleaned using excel but, before starting the exploratory analysis, the raw string dates must be structured properly. 

The script begins with crucial data transformation logic to modify the table in place (formatted specifically for MySQL), 

therefore the date column was changed with using the (str_to_date) query to change the date so that it can become readable for MySQL.



EDA Query Structure

The SQL file is divided into distinct sections, each addressing specific operational questions:

1. Data Overview & Shape

Retrieves sample records to verify columns and formatting.

Calculates the total metrics, including total transactions, unique customer counts, and product variety.

Finds temporal boundaries (start and end date of data coverage).

2. Descriptive Statistics

Calculates statistical boundaries (Min, Max, Avg) for the transaction sizes (Total_Price), quantities per order, and cart volume.

3. Categorical Analysis

Product Performance: Ranks products by revenue generated and quantity sold to identify bestsellers.

Fulfillment Pipeline: Breaks down order status counts to track delivery fulfillment rates and returns.

Payment Preferences: Analyzes transactions across payment gateways to find consumer checkout preferences.

Acquisition Channels: Computes acquisition metrics grouped by referral sources to identify high-ROI channels.

4. Coupon & Marketing Performance

Calculates baseline coupon usage percentages.

Ranks promotional codes by revenue generation.

Compares Average Order Value (AOV) for purchases with discount codes versus full-price purchases to evaluate coupon-driven behaviors.

5. Customer LTV & Engagement

Ranks top customers by Lifetime Value (LTV) or aggregate contribution.

Segments buyers by frequency class (One-Time Buyer, Repeat (2-5 purchases), or Frequent (>5 purchases)).

6. Temporal & Trend Analysis

Examines revenue and volume on a month-over-month basis.

Analyzes purchasing density by days of the week to reveal optimal marketing windows.



 Usage Instructions

Create Database/Table: Create a target database and load the parsed SQL.csv contents into a table named sales_data.

Execute Cleaning Phase: Run the top commands in the SQL script to align your date schema types.

