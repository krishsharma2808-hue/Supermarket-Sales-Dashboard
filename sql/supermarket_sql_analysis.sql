-- =======================================================================
-- SUPERMAKET SALES SQL ANALYSIS QUERIES
-- Author: Krish Sharma
-- Description: Data exploration and validation queries used before
--              building the Power BI dashboard.
-- =======================================================================



-- =======================================================================
-- CREATE TABLE FOR SUPERMARKET SALES DATASET
-- =======================================================================

CREATE TABLE supermarket_sales_1000 (
    invoice_id VARCHAR(20),
    branch VARCHAR(5),
    city VARCHAR(50),
    customer_type VARCHAR(20),
    gender VARCHAR(10),
    product_line VARCHAR(100),
    unit_price DECIMAL(10,2),
    quantity INT,
    tax DECIMAL(10,2),
    total DECIMAL(10,2),
    date DATE,
    time TIME,
    payment VARCHAR(20),
    cogs DECIMAL(10,2),
    gross_margin_percentage DECIMAL(10,4),
    gross_income DECIMAL(10,2),
    rating DECIMAL(3,1),
    day_of_week VARCHAR(10),
    Hour INT
);



-- ==========================================================
-- 1. CHECK TOTAL ROW COUNT (Ensure full dataset imported)
-- ==========================================================
SELECT COUNT(*) AS total_rows
FROM supermarket_sales_1000;



-- ==========================================================
-- 2. TOTAL SALES (Revenue)
-- ==========================================================
-- Calculates the total revenue generated from all transactions.
SELECT SUM(total) AS total_sales
FROM supermarket_sales_1000;



-- ==========================================================
-- 3. TOTAL GROSS INCOME
-- ==========================================================
-- Sums up gross income from all invoices.
SELECT SUM(gross_income) AS total_gross_income
FROM supermarket_sales_1000;



-- ==========================================================
-- 4. AVERAGE SALES PER INVOICE
-- ==========================================================
-- Finds the mean bill value across 1000 transactions.
SELECT AVG(total) AS avg_bill_value
FROM supermarket_sales_1000;



-- ==========================================================
-- 5. TOTAL NUMBER OF TRANSACTIONS
-- ==========================================================
-- Counts all unique invoices.
SELECT COUNT(invoice_id) AS total_transactions
FROM supermarket_sales_1000;



-- ==========================================================
-- 6. SALES BY PRODUCT LINE
-- ==========================================================
-- Shows best-performing and worst-performing categories.
SELECT product_line, SUM(total) AS total_sales
FROM supermarket_sales_1000
GROUP BY product_line
ORDER BY total_sales DESC;



-- ==========================================================
-- 7. GROSS INCOME BY PRODUCT LINE
-- ==========================================================
-- Identifies which category generated the highest profit.
SELECT product_line, SUM(gross_income) AS gross_income
FROM supermarket_sales_1000
GROUP BY product_line
ORDER BY gross_income DESC;



-- ==========================================================
-- 8. SALES BY GENDER
-- ==========================================================
-- Compares total spending by male and female customers.
SELECT gender, SUM(total) AS total_sales
FROM supermarket_sales_1000
GROUP BY gender;



-- ==========================================================
-- 9. SALES BY PAYMENT METHOD
-- ==========================================================
-- Cash vs Credit Card vs Ewallet spending distribution.
SELECT payment, SUM(total) AS total_sales
FROM supermarket_sales_1000
GROUP BY payment
ORDER BY total_sales DESC;



-- ==========================================================
-- 10. SALES BY DAY OF THE WEEK
-- ==========================================================
-- Identifies which day has the highest revenue.
SELECT day_of_week, SUM(total) AS total_sales
FROM supermarket_sales_1000
GROUP BY day_of_week
ORDER BY total_sales DESC;



-- ==========================================================
-- 11. SALES BY HOUR OF THE DAY
-- ==========================================================
-- Helps identify when customers shop the most.
SELECT Hour, SUM(total) AS total_sales
FROM supermarket_sales_1000
GROUP BY Hour
ORDER BY Hour;



-- ==========================================================
-- 12. BRANCH PERFORMANCE
-- ==========================================================
-- Which branch (A, B, C) generates the most revenue?
SELECT branch, SUM(total) AS total_revenue
FROM supermarket_sales_1000
GROUP BY branch
ORDER BY total_revenue DESC;



-- ==========================================================
-- 13. CUSTOMER TYPE ANALYSIS
-- ==========================================================
-- Compares spending by members vs non-members.
SELECT customer_type, SUM(total) AS total_spent
FROM supermarket_sales_1000
GROUP BY customer_type;



-- ==========================================================
-- 14. CITY-WISE SALES
-- ==========================================================
-- Which city contributes more revenue?
SELECT city, SUM(total) AS total_sales
FROM supermarket_sales_1000
GROUP BY city
ORDER BY total_sales DESC;



-- ==========================================================
-- 15. RATING vs GROSS INCOME (Correlation Check)
-- ==========================================================
-- Helps see if higher-rated products lead to higher income.
SELECT rating, gross_income
FROM supermarket_sales_1000
ORDER BY rating DESC;



-- ==========================================================
-- 16. TOP 10 HIGHEST VALUE INVOICES
-- ==========================================================
SELECT invoice_id, total
FROM supermarket_sales_1000
ORDER BY total DESC
LIMIT 10;



-- ==========================================================
-- 17. LOWEST 10 VALUE INVOICES
-- ==========================================================
SELECT invoice_id, total
FROM supermarket_sales_1000
ORDER BY total ASC
LIMIT 10;



-- ==========================================================
-- END OF SQL ANALYSIS
-- ==========================================================
