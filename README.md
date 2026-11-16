# Retail & Sales Analytics Using SQL

## Project Overview

In this project, I worked on a retail and e-commerce dataset to understand how a business performs in terms of sales, revenue, customers, products, and orders.

I used MySQL to explore the data and answer 40 business-related questions. The analysis covers different areas, such as customer purchasing habits, product sales, revenue trends, discounts, payments, and shipping performance.

The project starts with basic SQL queries and gradually moves towards more advanced concepts like joins, subqueries, CTEs, and window functions.

## Project Objectives

The main things I wanted to explore through this project were:

- Understand customer purchasing behaviour and spending patterns.
- Find the best-selling products and categories.
- Calculate gross sales, discounts, net sales, and profit.
- Track monthly and yearly sales performance.
- Understand payment methods and payment statuses.
- Identify repeat customers and high-value customers.
- Analyze order status and shipping duration.
- Calculate how much each customer contributes to total revenue.
- Study customer purchase frequency and retention.

## Tools & Technologies

- **Database:** MySQL
- **SQL Editor:** MySQL Workbench
- **Language:** SQL

## Database Structure

For this project, I worked with six relational tables. Each table contains a different part of the retail business data.

| Table Name | Description |
|---|---|
| customers | Stores customer details such as name, email, city, state, and signup date. |
| categories | Contains product category information. |
| products | Stores product names, category IDs, selling prices, and costs. |
| orders | Contains customer orders, order dates, order status, and shipping details. |
| order_items | Stores product-level order details, including quantity, discounts, and net amounts. |
| payments | Contains payment methods, payment amounts, and payment statuses. |

### Database Relationships

The tables are connected through common IDs. These relationships help in combining data from different tables.

- One customer can place multiple orders.
- One category can contain multiple products.
- One order can contain multiple order items.
- One product can appear in multiple order items.
- Each order has one associated payment record in this dataset.

## Business Questions Solved

I solved 40 business questions to explore different parts of the retail business.

### 1. Customer Analysis

1. How many customers are registered in the database?
2. Which cities have the highest number of customers?
3. How many new customers registered in each year?
4. Which customers have placed more than one order?
5. Who are the top 5 customers based on total spending?

### 2. Product and Category Analysis

6. How many products are available in each category?
7. What are the top 10 most expensive products?
8. Which products have never been sold?
9. What are the top 10 best-selling products based on quantity sold?
10. Which product generates the highest profit?

### 3. Sales and Revenue Analysis

11. What are the total gross sales, total discounts, and net sales?
12. How much revenue does each product category generate?
13. What is the monthly revenue trend?
14. What is the average order value (AOV)?
15. How do sales perform on a daily basis?
16. What are the top 10 highest-value orders?

### 4. Discount and Profitability Analysis

17. Which products have the highest average discounts?
18. What is the total discount amount for each product?
19. What are the total profit and profit margin percentage for each product?

### 5. Payment Analysis

20. Which payment methods are used most frequently?
21. How are payments distributed across different payment statuses?
22. Are there any differences between payment amounts and order net amounts?

### 6. Order and Shipping Analysis

23. How many orders fall under each order status?
24. How many days does it take to ship each order?
25. What is the average shipping duration?

### 7. Customer Behaviour and Retention

26. What is the total lifetime spending of each customer?
27. How frequently do customers place orders?
28. What is the average number of days between consecutive customer orders?
29. Which customers made purchases in consecutive months?

### 8. Advanced Business Analysis

30. What is the month-over-month revenue growth?
31. What is the year-over-year revenue growth?
32. Which is the top-selling product in each category?
33. What percentage of total revenue comes from each customer?
34. What is the cumulative revenue contribution of customers?

### 9. Additional Data Analysis

35. How can missing customer and product records be identified?
36. How can duplicate records be identified?
37. How can order-level revenue be calculated?
38. How can customer purchase frequency be analyzed using window functions?
39. How can products be ranked based on their sales performance?
40. How can customer revenue contribution be ranked?

## SQL Concepts Used

While solving these questions, I used different SQL concepts depending on the requirement.

### Basic SQL
- SELECT
- DISTINCT
- WHERE
- ORDER BY
- LIMIT
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- ROUND()

### Filtering and Grouping
- GROUP BY
- HAVING
- AND / OR
- IN
- BETWEEN
- IS NULL
- IS NOT NULL

### Joins
- INNER JOIN
- LEFT JOIN

### Intermediate SQL
- Subqueries
- Common Table Expressions (CTEs)
- CASE WHEN
- Date and Time Functions
- Aggregate Functions
- NULL Handling

### Advanced SQL
- Window Functions
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LAG()
- PARTITION BY
- Running Total
- Cumulative Revenue
- Month-over-Month Growth
- Year-over-Year Growth

## Key Business Metrics Calculated

During the analysis, I worked with the following business metrics:

| Metric | Description |
|---|---|
| Gross Sales | Total sales before discounts |
| Total Discount | Total discount amount |
| Net Sales | Sales amount after discounts |
| Average Order Value (AOV) | Average revenue generated per order |
| Total Cost | Quantity sold multiplied by unit cost |
| Total Profit | Net revenue minus total cost |
| Profit Margin | Profit as a percentage of revenue |
| Shipping Duration | Number of days between order date and shipping date |
| Revenue Growth | Percentage change in revenue over time |
| Customer Contribution | Percentage of total revenue generated by each customer |
| Cumulative Revenue | Running total of customer revenue |

## Dataset Information

- **Dataset Type:** Retail and E-commerce
- **Total Orders:** 500
- **Number of Tables:** 6
- **Database:** MySQL

The dataset includes information about customers, products, categories, orders, order items, and payments.

## Project Files

The project is organized into two main files:

```text
Retail-Sales-Analytics-SQL/
│
├── README.md
└── retail_sales_analytics.sql
```

- **README.md:** Provides information about the project, database, business questions, and SQL concepts used.
- **retail_sales_analytics.sql:** Contains the database setup, data, and SQL queries used to solve the 40 business questions.

## How to Run the Project

Follow these steps to run the project on your system:

1. Install MySQL and MySQL Workbench.
2. Download or clone this GitHub repository.
3. Open `retail_sales_analytics.sql` in MySQL Workbench.
4. Execute the database and table creation statements.
5. Run the data insertion statements to load the dataset.
6. Execute the SQL queries to explore the business questions.
7. Check the query results to understand the sales and customer data.

## What I Learned

Working on this project helped me get more comfortable with SQL and understand how it can be used for business analysis.

Some of the things I practiced were:

- Writing SQL queries to answer business questions.
- Working with multiple related tables.
- Combining data using different types of joins.
- Filtering, grouping, and summarizing records.
- Calculating sales, revenue, discounts, and profit.
- Using subqueries and CTEs to organize complex queries.
- Applying window functions for ranking and cumulative calculations.
- Analyzing customer behaviour and sales trends.

## Conclusion

This project gave me an opportunity to practice SQL on a retail and e-commerce dataset. By solving 40 business questions, I learned how to work with different types of data and use SQL to find information that can help understand business performance.

It was a useful hands-on experience that helped me improve my SQL querying and data analysis skills.

---
