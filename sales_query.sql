USE finance

SELECT * FROM [finance data]

-- Data Cleaning 
SELECT * FROM [finance data]
WHERE
	Segment is NULL
	OR 
	Country is NULL 
	OR 
	Product is NULL 
	OR 
	Discount_Band is NULL 
	OR 
	Units_Sold is NULL 
	OR 
	Manufacturing_Price is NULL 
	OR 
	Sale_Price is NULL 
	OR
	Gross_Sales is NULL 
	OR
	Sales is NULL 
	OR 
	COGS is NULL 
	OR 
	Profit is NULL 

-- Data exploration 

-- Total unit sold 
SELECT SUM(Units_Sold) AS total_unit_sold
FROM [finance data]

-- Total Sales
SELECT ROUND(SUM(sales),2) AS total_sales 
FROM [finance data]

-- Total Profit 
SELECT ROUND(SUM(profit),2) AS total_profit
FROM [finance data]

-- Total Gross Sales 
SELECT SUM(Gross_Sales) AS total_gross_sales 
FROM [finance data]

-- Monthly trend 
SELECT month_number, ROUND(SUM(sales),2) AS total_sales 
FROM [finance data]
GROUP BY Month_Number
ORDER BY month_number 

-- Quarter trend 
SELECT 
    FLOOR((month_number - 1) / 3) + 1 AS quarter,
    ROUND(SUM(sales), 2) AS total_sales 
FROM 
    [finance data]
GROUP BY 
    FLOOR((month_number - 1) / 3) + 1
ORDER BY 
    quarter

-- Sales by Segment  
SELECT Segment, ROUND(SUM(sales),2) AS total_sales
FROM [finance data]
GROUP BY Segment
ORDER BY total_sales DESC

-- Sales by Product
SELECT Product, ROUND(SUM(sales),2) AS total_sales
FROM [finance data]
GROUP BY Product
ORDER BY total_sales DESC

-- Sales by Country
SELECT Country, ROUND(SUM(sales),2) AS total_sales
FROM [finance data]
GROUP BY Country
ORDER BY total_sales DESC



