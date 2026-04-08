/*
CREATE TABLE superstore (
    row_id INT,
    order_id VARCHAR(14),
    order_date VARCHAR(10),
    ship_date VARCHAR(10),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(5),
    region VARCHAR(20),
    product_id VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(300),
    sales DECIMAL(10,2)
); 
*/

COPY superstore
FROM '/tmp/superstore1.csv'
DELIMITER ','
CSV HEADER;

--Preview of table column variables.
SELECT *
FROM superstore
LIMIT 5;

--Total sales and total order count by product category.
SELECT
	ROUND(SUM(sales), 2) AS total_sales,
	category,
	COUNT(*) AS total_orders
FROM superstore
GROUP BY
	category
ORDER BY
	total_orders DESC;

--Total sales and total order count by region.
SELECT
	ROUND(SUM(sales),2) AS total_sales,
	COUNT(*) AS total_orders,
	region
FROM superstore
GROUP BY
	region
ORDER BY
	total_sales DESC;

--Average sales per sub_category.
SELECT
	category,
	sub_category,
	ROUND(AVG(sales), 2) AS avg_sales
FROM superstore
GROUP BY
	category, sub_category
ORDER BY
	avg_sales DESC;

--Total sales and total order count by city.
SELECT
	city,
	ROUND(SUM(sales), 2) AS total_sales,
	COUNT(*) AS total_orders
FROM superstore
GROUP BY
	city
ORDER BY
	total_sales DESC;

--Total sales and total order count by segement focus.
SELECT 
	segment,
	ROUND(SUM(sales), 2) AS total_sales,
	COUNT(*) AS total_orders
FROM superstore
GROUP BY
	segment
ORDER BY
	total_sales DESC




	
	


	
	











