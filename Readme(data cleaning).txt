
# 📘 README: Data Cleaning Process in Excel

## 1. **File Overview**
- Source: `Dataset for Data Analytics (3).xlsx`
- Contains transactional sales data with fields like `OrderID`, `Date`, `CustomerID`, `Product`, `Quantity`, `UnitPrice`, `TotalPrice`, `CouponCode`, etc.
- Issues observed:
  - Dates stored as serial numbers (e.g., `44930`) instead of readable dates.
  - Floating-point precision errors (e.g., `550.6799999999999`).
  - Inconsistent coupon representation (`NO COUPON`, blanks, etc.).
  - Truncated/incomplete rows at the end.
  - Mixed data types (numbers stored as text).

---

## 2. **Cleaning Steps in Excel**

### 🔹 Step 1: Convert Dates
- Select the `Date` column.
- Use **Format Cells → Date → YYYY-MM-DD** to convert serial numbers into proper dates.
- If needed, use formula:
  ```excel
  =TEXT(A2,"YYYY-MM-DD")
  ```
  (assuming `A2` contains the serial date).

### 🔹 Step 2: Fix Numeric Precision
- Select `UnitPrice` and `TotalPrice` columns.
- Use **Format Cells → Number → 2 decimal places**.
- Optionally, apply formula:
  ```excel
  =ROUND(B2,2)
  ```
  to round values.

### 🔹 Step 3: Standardize Coupon Codes
- Replace blanks with `"NO COUPON"` using **Find & Replace**.
- Ensure consistent casing (e.g., `SAVE10`, `WINTER15`, `FREESHIP`).
- Add a helper column:
  ```excel
  =IF(CouponCode="NO COUPON","No","Yes")
  ```
  to mark whether a coupon was used.

### 🔹 Step 4: Validate Totals
- Add a check column:
  ```excel
  =IF(Quantity*UnitPrice=TotalPrice,"OK","Mismatch")
  ```
- Investigate mismatches.

### 🔹 Step 5: Clean Text Fields
- Use **TRIM()** to remove extra spaces:
  ```excel
  =TRIM(D2)
  ```
- Apply **PROPER()** if you want consistent capitalization:
  ```excel
  =PROPER(E2)
  ```

### 🔹 Step 6: Handle Incomplete Rows
- Scroll to the bottom and delete truncated rows (e.g., `ORD200250`).
- Keep only complete records.

### 🔹 Step 7: Ensure Consistent Data Types
- Convert `Quantity` and `ItemsInCart` to integers.
- Convert `UnitPrice` and `TotalPrice` to numbers with 2 decimals.
- Ensure `OrderID` and `CustomerID` remain text.

---

## 3. **Output**
After cleaning:
- Dates are readable (`YYYY-MM-DD`).
- Prices rounded to 2 decimals.
- Coupon usage standardized.
- No incomplete rows.
- Consistent text formatting.
- All columns have correct data types.

