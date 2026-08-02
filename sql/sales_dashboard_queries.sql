/*=========================================================
        SALES PERFORMANCE DASHBOARD
        SQL BUSINESS ANALYSIS
-----------------------------------------------------------
Project      : Sales Performance Dashboard
Database     : superstore_project
Table        : sales
Dataset Size : 9,994 Rows
Tools Used   : Python | MySQL | Power BI
Author       : Sweta Singh
=========================================================*/

USE superstore_project;





/*=========================================================
SECTION 1 : DATA EXPLORATION
Objective :
Understand the dataset before performing analysis.
=========================================================*/


-- -------------------------------------------------------
-- Query 1 : View First 10 Records
-- Business Question :
-- Is the data imported correctly?
-- -------------------------------------------------------

SELECT *
FROM sales
LIMIT 10;



-- -------------------------------------------------------
-- Query 2 : Count Total Records
-- Business Question :
-- How many sales records are available?
-- -------------------------------------------------------

SELECT
COUNT(*) AS Total_Rows
FROM sales;



-- -------------------------------------------------------
-- Query 3 : View Table Structure
-- Business Question :
-- What columns and data types are present?
-- -------------------------------------------------------

DESCRIBE sales;



-- -------------------------------------------------------
-- Query 4 : View Product Categories
-- Business Question :
-- Which product categories are available?
-- -------------------------------------------------------

SELECT DISTINCT category
FROM sales;



-- -------------------------------------------------------
-- Query 5 : View Customer Segments
-- Business Question :
-- Which customer segments exist?
-- -------------------------------------------------------

SELECT DISTINCT segment
FROM sales;



-- -------------------------------------------------------
-- Query 6 : View Sales Regions
-- Business Question :
-- Which sales regions are available?
-- -------------------------------------------------------

SELECT DISTINCT region
FROM sales;






/*=========================================================
SECTION 2 : KPI ANALYSIS
Objective :
Calculate the key business metrics required for the dashboard.
=========================================================*/


-- -------------------------------------------------------
-- Query 7 : Total Sales
-- Business Question :
-- What is the total revenue generated?
-- -------------------------------------------------------

SELECT
ROUND(SUM(sales),2) AS Total_Sales
FROM sales;



-- -------------------------------------------------------
-- Query 8 : Total Profit
-- Business Question :
-- How much profit has the company earned?
-- -------------------------------------------------------

SELECT
ROUND(SUM(profit),2) AS Total_Profit
FROM sales;



-- -------------------------------------------------------
-- Query 9 : Total Orders
-- Business Question :
-- How many unique orders were placed?
-- -------------------------------------------------------

SELECT
COUNT(DISTINCT order_id) AS Total_Orders
FROM sales;



-- -------------------------------------------------------
-- Query 10 : Total Customers
-- Business Question :
-- How many unique customers purchased products?
-- -------------------------------------------------------

SELECT
COUNT(DISTINCT customer_id) AS Total_Customers
FROM sales;



-- -------------------------------------------------------
-- Query 11 : Average Order Value
-- Business Question :
-- What is the average revenue generated per order?
-- -------------------------------------------------------

SELECT
ROUND(
SUM(sales)
/ COUNT(DISTINCT order_id),
2
) AS Average_Order_Value
FROM sales;



-- -------------------------------------------------------
-- Query 12 : Total Quantity Sold
-- Business Question :
-- How many products have been sold?
-- -------------------------------------------------------

SELECT
SUM(quantity) AS Total_Quantity_Sold
FROM sales;



-- -------------------------------------------------------
-- Query 13 : Average Profit Margin
-- Business Question :
-- What is the average profit margin?
-- -------------------------------------------------------

SELECT
ROUND(
AVG(profit_margin_percent),
2
) AS Average_Profit_Margin
FROM sales;



-- -------------------------------------------------------
-- Query 14 : Average Shipping Time
-- Business Question :
-- What is the average shipping duration?
-- -------------------------------------------------------

SELECT
ROUND(
AVG(shipping_days),
2
) AS Average_Shipping_Days
FROM sales;
/*=========================================================
SECTION 3 : SALES TREND ANALYSIS
Objective :
Analyze sales performance over time to identify
monthly, yearly, and quarterly trends.
=========================================================*/


-- -------------------------------------------------------
-- Query 15 : Year-wise Sales
-- Business Question :
-- How has sales revenue changed over the years?
-- -------------------------------------------------------

SELECT
    order_year,
    ROUND(SUM(sales),2) AS Total_Sales
FROM sales
GROUP BY order_year
ORDER BY order_year;



-- -------------------------------------------------------
-- Query 16 : Year-wise Profit
-- Business Question :
-- How has profit changed over the years?
-- -------------------------------------------------------

SELECT
    order_year,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY order_year
ORDER BY order_year;



-- -------------------------------------------------------
-- Query 17 : Monthly Sales Trend
-- Business Question :
-- Which month generates the highest sales?
-- -------------------------------------------------------

SELECT
    order_month,
    order_month_name,
    ROUND(SUM(sales),2) AS Total_Sales
FROM sales
GROUP BY
    order_month,
    order_month_name
ORDER BY order_month;



-- -------------------------------------------------------
-- Query 18 : Monthly Profit Trend
-- Business Question :
-- Which month generates the highest profit?
-- -------------------------------------------------------

SELECT
    order_month,
    order_month_name,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY
    order_month,
    order_month_name
ORDER BY order_month;



-- -------------------------------------------------------
-- Query 19 : Quarterly Sales
-- Business Question :
-- Which quarter contributes the highest revenue?
-- -------------------------------------------------------

SELECT
    order_quarter,
    ROUND(SUM(sales),2) AS Total_Sales
FROM sales
GROUP BY order_quarter
ORDER BY order_quarter;



-- -------------------------------------------------------
-- Query 20 : Quarterly Profit
-- Business Question :
-- Which quarter generates the highest profit?
-- -------------------------------------------------------

SELECT
    order_quarter,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY order_quarter
ORDER BY order_quarter;
/*=========================================================
SECTION 4 : PRODUCT PERFORMANCE ANALYSIS
Objective :
Analyze product categories and products based on
sales, profit and quantity sold.
=========================================================*/


-- -------------------------------------------------------
-- Query 21 : Sales by Category
-- Business Question :
-- Which category generates the highest sales?
-- -------------------------------------------------------

SELECT
    category,
    ROUND(SUM(sales),2) AS Total_Sales
FROM sales
GROUP BY category
ORDER BY Total_Sales DESC;



-- -------------------------------------------------------
-- Query 22 : Profit by Category
-- Business Question :
-- Which category generates the highest profit?
-- -------------------------------------------------------

SELECT
    category,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY category
ORDER BY Total_Profit DESC;



-- -------------------------------------------------------
-- Query 23 : Sales by Sub-Category
-- Business Question :
-- Which sub-category generates the highest sales?
-- -------------------------------------------------------

SELECT
    sub_category,
    ROUND(SUM(sales),2) AS Total_Sales
FROM sales
GROUP BY sub_category
ORDER BY Total_Sales DESC;



-- -------------------------------------------------------
-- Query 24 : Profit by Sub-Category
-- Business Question :
-- Which sub-category generates the highest profit?
-- -------------------------------------------------------

SELECT
    sub_category,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY sub_category
ORDER BY Total_Profit DESC;



-- -------------------------------------------------------
-- Query 25 : Top 10 Products by Sales
-- Business Question :
-- Which products generate the highest sales revenue?
-- -------------------------------------------------------

SELECT
    product_name,
    ROUND(SUM(sales),2) AS Total_Sales
FROM sales
GROUP BY product_name
ORDER BY Total_Sales DESC
LIMIT 10;



-- -------------------------------------------------------
-- Query 26 : Top 10 Products by Profit
-- Business Question :
-- Which products generate the highest profit?
-- -------------------------------------------------------

SELECT
    product_name,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY product_name
ORDER BY Total_Profit DESC
LIMIT 10;



-- -------------------------------------------------------
-- Query 27 : Bottom 10 Products by Profit
-- Business Question :
-- Which products generate the least profit?
-- -------------------------------------------------------

SELECT
    product_name,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY product_name
ORDER BY Total_Profit ASC
LIMIT 10;



-- -------------------------------------------------------
-- Query 28 : Top 10 Products by Quantity Sold
-- Business Question :
-- Which products are sold in the highest quantity?
-- -------------------------------------------------------

SELECT
    product_name,
    SUM(quantity) AS Total_Quantity
FROM sales
GROUP BY product_name
ORDER BY Total_Quantity DESC
LIMIT 10;



-- -------------------------------------------------------
-- Query 29 : Category-wise Quantity Sold
-- Business Question :
-- Which category has sold the maximum quantity?
-- -------------------------------------------------------

SELECT
    category,
    SUM(quantity) AS Total_Quantity
FROM sales
GROUP BY category
ORDER BY Total_Quantity DESC;



-- -------------------------------------------------------
-- Query 30 : Average Profit Margin by Category
-- Business Question :
-- Which category has the highest average profit margin?
-- -------------------------------------------------------

SELECT
    category,
    ROUND(AVG(profit_margin_percent),2) AS Avg_Profit_Margin
FROM sales
GROUP BY category
ORDER BY Avg_Profit_Margin DESC;
/*=========================================================
SECTION 5 : CUSTOMER PURCHASING BEHAVIOR ANALYSIS
Objective :
Analyze customer purchasing behavior, customer
segments and customer contribution to sales.
=========================================================*/


-- -------------------------------------------------------
-- Query 31 : Top 10 Customers by Sales
-- Business Question :
-- Which customers generate the highest revenue?
-- -------------------------------------------------------

SELECT
    customer_name,
    ROUND(SUM(sales),2) AS Total_Sales
FROM sales
GROUP BY customer_name
ORDER BY Total_Sales DESC
LIMIT 10;



-- -------------------------------------------------------
-- Query 32 : Top 10 Customers by Profit
-- Business Question :
-- Which customers generate the highest profit?
-- -------------------------------------------------------

SELECT
    customer_name,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY customer_name
ORDER BY Total_Profit DESC
LIMIT 10;



-- -------------------------------------------------------
-- Query 33 : Customer Segment-wise Sales
-- Business Question :
-- Which customer segment contributes the highest sales?
-- -------------------------------------------------------

SELECT
    segment,
    ROUND(SUM(sales),2) AS Total_Sales
FROM sales
GROUP BY segment
ORDER BY Total_Sales DESC;



-- -------------------------------------------------------
-- Query 34 : Customer Segment-wise Profit
-- Business Question :
-- Which customer segment contributes the highest profit?
-- -------------------------------------------------------

SELECT
    segment,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY segment
ORDER BY Total_Profit DESC;



-- -------------------------------------------------------
-- Query 35 : Number of Customers in Each Segment
-- Business Question :
-- How many unique customers belong to each segment?
-- -------------------------------------------------------

SELECT
    segment,
    COUNT(DISTINCT customer_id) AS Total_Customers
FROM sales
GROUP BY segment
ORDER BY Total_Customers DESC;



-- -------------------------------------------------------
-- Query 36 : Average Sales per Customer
-- Business Question :
-- What is the average sales generated by each customer?
-- -------------------------------------------------------

SELECT
    customer_name,
    ROUND(AVG(sales),2) AS Average_Sales
FROM sales
GROUP BY customer_name
ORDER BY Average_Sales DESC
LIMIT 10;



-- -------------------------------------------------------
-- Query 37 : Total Orders by Customer
-- Business Question :
-- Which customers have placed the highest number of orders?
-- -------------------------------------------------------

SELECT
    customer_name,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM sales
GROUP BY customer_name
ORDER BY Total_Orders DESC
LIMIT 10;



-- -------------------------------------------------------
-- Query 38 : Average Order Value by Customer
-- Business Question :
-- Which customers have the highest average order value?
-- -------------------------------------------------------

SELECT
    customer_name,
    ROUND(
        SUM(sales) /
        COUNT(DISTINCT order_id),2
    ) AS Average_Order_Value
FROM sales
GROUP BY customer_name
ORDER BY Average_Order_Value DESC
LIMIT 10;
/*=========================================================
SECTION 6 : REGIONAL SALES ANALYSIS
Objective :
Analyze regional sales, profit and geographical
performance across regions, states and cities.
=========================================================*/


-- -------------------------------------------------------
-- Query 39 : Sales by Region
-- Business Question :
-- Which region generates the highest sales?
-- -------------------------------------------------------

SELECT
    region,
    ROUND(SUM(sales),2) AS Total_Sales
FROM sales
GROUP BY region
ORDER BY Total_Sales DESC;



-- -------------------------------------------------------
-- Query 40 : Profit by Region
-- Business Question :
-- Which region generates the highest profit?
-- -------------------------------------------------------

SELECT
    region,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY region
ORDER BY Total_Profit DESC;



-- -------------------------------------------------------
-- Query 41 : Sales by State
-- Business Question :
-- Which states generate the highest sales?
-- -------------------------------------------------------

SELECT
    state,
    ROUND(SUM(sales),2) AS Total_Sales
FROM sales
GROUP BY state
ORDER BY Total_Sales DESC
LIMIT 10;



-- -------------------------------------------------------
-- Query 42 : Profit by State
-- Business Question :
-- Which states generate the highest profit?
-- -------------------------------------------------------

SELECT
    state,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY state
ORDER BY Total_Profit DESC
LIMIT 10;



-- -------------------------------------------------------
-- Query 43 : Top 10 Cities by Sales
-- Business Question :
-- Which cities contribute the highest sales?
-- -------------------------------------------------------

SELECT
    city,
    ROUND(SUM(sales),2) AS Total_Sales
FROM sales
GROUP BY city
ORDER BY Total_Sales DESC
LIMIT 10;



-- -------------------------------------------------------
-- Query 44 : Top 10 Cities by Profit
-- Business Question :
-- Which cities contribute the highest profit?
-- -------------------------------------------------------

SELECT
    city,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY city
ORDER BY Total_Profit DESC
LIMIT 10;



-- -------------------------------------------------------
-- Query 45 : Total Orders by Region
-- Business Question :
-- Which region receives the highest number of orders?
-- -------------------------------------------------------

SELECT
    region,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM sales
GROUP BY region
ORDER BY Total_Orders DESC;



-- -------------------------------------------------------
-- Query 46 : Quantity Sold by Region
-- Business Question :
-- Which region sold the highest quantity of products?
-- -------------------------------------------------------

SELECT
    region,
    SUM(quantity) AS Total_Quantity
FROM sales
GROUP BY region
ORDER BY Total_Quantity DESC;
/*=========================================================
SECTION 7 : SHIPPING & DISCOUNT ANALYSIS
Objective :
Analyze shipping efficiency and discount impact
on sales and profitability.
=========================================================*/


-- -------------------------------------------------------
-- Query 47 : Average Shipping Days by Ship Mode
-- -------------------------------------------------------

SELECT
    ship_mode,
    ROUND(AVG(shipping_days),2) AS Avg_Shipping_Days
FROM sales
GROUP BY ship_mode
ORDER BY Avg_Shipping_Days;



-- -------------------------------------------------------
-- Query 48 : Average Discount by Category
-- -------------------------------------------------------

SELECT
    category,
    ROUND(AVG(discount),2) AS Avg_Discount
FROM sales
GROUP BY category
ORDER BY Avg_Discount DESC;



-- -------------------------------------------------------
-- Query 49 : Average Discount by Sub-Category
-- -------------------------------------------------------

SELECT
    sub_category,
    ROUND(AVG(discount),2) AS Avg_Discount
FROM sales
GROUP BY sub_category
ORDER BY Avg_Discount DESC;



-- -------------------------------------------------------
-- Query 50 : Profit by Ship Mode
-- -------------------------------------------------------

SELECT
    ship_mode,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY ship_mode
ORDER BY Total_Profit DESC;



-- -------------------------------------------------------
-- Query 51 : Sales by Ship Mode
-- -------------------------------------------------------

SELECT
    ship_mode,
    ROUND(SUM(sales),2) AS Total_Sales
FROM sales
GROUP BY ship_mode
ORDER BY Total_Sales DESC;



-- -------------------------------------------------------
-- Query 52 : Average Profit Margin by Ship Mode
-- -------------------------------------------------------

SELECT
    ship_mode,
    ROUND(AVG(profit_margin_percent),2) AS Avg_Profit_Margin
FROM sales
GROUP BY ship_mode
ORDER BY Avg_Profit_Margin DESC;
/*=========================================================
SECTION 8 : ADVANCED SQL ANALYSIS
Objective :
Perform advanced analytical SQL using ranking,
window functions and profitability analysis.
=========================================================*/


-- -------------------------------------------------------
-- Query 53 : Top Customers Using RANK()
-- -------------------------------------------------------

SELECT
    customer_name,
    ROUND(SUM(sales),2) AS Total_Sales,
    RANK() OVER(ORDER BY SUM(sales) DESC) AS Sales_Rank
FROM sales
GROUP BY customer_name;



-- -------------------------------------------------------
-- Query 54 : Top Products Using DENSE_RANK()
-- -------------------------------------------------------

SELECT
    product_name,
    ROUND(SUM(profit),2) AS Total_Profit,
    DENSE_RANK() OVER(ORDER BY SUM(profit) DESC) AS Profit_Rank
FROM sales
GROUP BY product_name;



-- -------------------------------------------------------
-- Query 55 : Running Sales Total
-- -------------------------------------------------------

SELECT
    order_date,
    sales,
    SUM(sales) OVER(ORDER BY order_date) AS Running_Total
FROM sales;



-- -------------------------------------------------------
-- Query 56 : Top Customer in Each Segment
-- -------------------------------------------------------

WITH customer_sales AS
(
SELECT
segment,
customer_name,
SUM(sales) AS total_sales,
ROW_NUMBER() OVER(
PARTITION BY segment
ORDER BY SUM(sales) DESC
) AS rn
FROM sales
GROUP BY segment, customer_name
)

SELECT
segment,
customer_name,
total_sales
FROM customer_sales
WHERE rn = 1;



-- -------------------------------------------------------
-- Query 57 : Category Contribution to Total Sales
-- -------------------------------------------------------

SELECT
category,
ROUND(SUM(sales),2) AS Category_Sales,
ROUND(
SUM(sales)*100/
(SELECT SUM(sales) FROM sales),
2
) AS Sales_Percentage
FROM sales
GROUP BY category
ORDER BY Sales_Percentage DESC;



-- -------------------------------------------------------
-- Query 58 : Products with Negative Profit
-- -------------------------------------------------------

SELECT
product_name,
ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY Total_Profit;



-- -------------------------------------------------------
-- Query 59 : Region Contribution to Total Profit
-- -------------------------------------------------------

SELECT
region,
ROUND(SUM(profit),2) AS Total_Profit,
ROUND(
SUM(profit)*100/
(SELECT SUM(profit) FROM sales),
2
) AS Profit_Percentage
FROM sales
GROUP BY region
ORDER BY Profit_Percentage DESC;



-- -------------------------------------------------------
-- Query 60 : Overall Business Summary
-- -------------------------------------------------------

SELECT
COUNT(DISTINCT order_id) AS Total_Orders,
COUNT(DISTINCT customer_id) AS Total_Customers,
ROUND(SUM(sales),2) AS Total_Sales,
ROUND(SUM(profit),2) AS Total_Profit,
SUM(quantity) AS Total_Quantity,
ROUND(AVG(discount),2) AS Avg_Discount,
ROUND(AVG(profit_margin_percent),2) AS Avg_Profit_Margin;