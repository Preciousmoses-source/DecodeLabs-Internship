# 🛒 E-Commerce Sales – Exploratory Data Analysis (EDA)

An end-to-end Exploratory Data Analysis of an e-commerce sales dataset spanning **January 2023 to June 2025**, uncovering trends in revenue, product performance, customer behavior, payment preferences, and referral sources.

-----

## 📁 Dataset Overview

|Property         |Details            |
|-----------------|-------------------|
|**File**         |`clean_data.xlsx`  |
|**Main Sheet**   |Sheet1             |
|**Total Records**|1,200 orders       |
|**Columns**      |15                 |
|**Date Range**   |Jan 2023 – Jun 2025|
|**Total Revenue**|$1,264,761.96      |

-----

## 📋 Dataset Columns

|Column           |Type    |Description                       |
|-----------------|--------|----------------------------------|
|`OrderID`        |String  |Unique identifier for each order  |
|`Date`           |DateTime|Date the order was placed         |
|`CustomerID`     |String  |Unique customer identifier        |
|`Product`        |String  |Product purchased                 |
|`Quantity`       |Integer |Number of units ordered           |
|`UnitPrice`      |Float   |Price per unit ($)                |
|`ShippingAddress`|String  |Delivery address                  |
|`PaymentMethod`  |String  |Method used to pay                |
|`OrderStatus`    |String  |Current status of the order       |
|`TrackingNumber` |String  |Shipment tracking reference       |
|`ItemsInCart`    |Integer |Total items in customer’s cart    |
|`CouponCode`     |String  |Discount coupon applied           |
|`Coupon used/not`|String  |Whether a coupon was used         |
|`ReferralSource` |String  |Channel that referred the customer|
|`TotalPrice`     |Float   |Final order value ($)             |

-----

## 📊 Key Statistics

|Metric                   |Value     |
|-------------------------|----------|
|Average Order Value (AOV)|$1,053.97 |
|Median Order Value       |$823.62   |
|Min Order Value          |$11.39    |
|Max Order Value          |$3,456.40 |
|Avg Quantity per Order   |~3 units  |
|Avg Items in Cart        |~5.5 items|
|Avg Unit Price           |$356.41   |

-----

## 📂 Workbook Sheets

|Sheet                            |Description                                                |
|---------------------------------|-----------------------------------------------------------|
|**Sheet1**                       |Raw cleaned dataset (1,200 rows × 15 columns)              |
|**SALES TREND**                  |Pivot table — monthly revenue breakdown by year (2023–2025)|
|**Percentage of referral source**|Distribution of orders by referral channel                 |
|**effectiveness of delivery**    |Analysis of delivery/order status performance              |
|**most sold products**           |Order count by product type                                |
|**percentage of coupon used**    |Coupon usage rate (74.25% used vs 25.75% not used)         |

-----

## 🔍 EDA Areas Explored

### 1. 📈 Sales Trend Analysis

- Monthly and yearly revenue trends across 2023, 2024, and 2025
- Peak revenue periods and seasonal dips identified

### 2. 🛍️ Product Performance

- **7 product categories:** Monitor, Phone, Tablet, Chair, Printer, Laptop, Desk
- Most sold products ranked by order count
- Revenue contribution per product

### 3. 💳 Payment Method Analysis

- **5 payment methods:** Debit Card, Online, Credit Card, Gift Card, Cash
- Distribution of payment preferences across customers

### 4. 📦 Order Status Breakdown

- **5 statuses tracked:** Shipped, Cancelled, Returned, Delivered, Pending
- Delivery effectiveness and cancellation/return rates

### 5. 🎟️ Coupon Usage Analysis

- **74.25%** of orders used a coupon
- **3 active coupon codes:** SAVE10, FREESHIP, WINTER15
- Impact of discounts on order volume

### 6. 📣 Referral Source Analysis

- **5 channels:** Instagram, Referral, Email, Facebook, Google
- Percentage share of orders per referral source

-----

## 💡 Key Insights

- Over **74%** of customers used a coupon, suggesting discounts are a strong purchase driver
- Revenue peaked mid-year with a notable drop in Q4
- **Chair and Laptop** were among the most frequently ordered products
- Orders were fairly distributed across all 5 payment methods
- All 5 referral channels contributed roughly equally, with no single dominant source

-----

## 🛠️ Tools Used

- **Microsoft Excel** – Data cleaning AND pivot tables
- **Power Query** – Data transformation
- **DAX** – Calculated measures for KPIs

-----

## 🚀 How to Use

1. Open `EDA.xlsx` in Excel or Power BI
1. Navigate to **Sheet1** for the raw data
1. Explore the additional sheets for pre-built pivot summaries
1. Connect to Power BI for interactive dashboard visuals

-----

## 📄 License

This project is for portfolio and educational purposes only.