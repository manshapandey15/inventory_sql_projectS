-- Use your schema
USE inventory_project;

-- Create the raw products table
CREATE TABLE raw_zepto (
    sku_id INT PRIMARY KEY,
    category VARCHAR(100),
    name VARCHAR(255),
    mrp INT,
    discountPercent DECIMAL(5,2),
    availableQuantity INT,
    discountedSellingPrice INT,
    weightInGms INT,
    outOfStock VARCHAR(10),
    quantity INT
);

-- Check if table was created
SHOW TABLES;
USE inventory_project;

-- Count total products
SELECT COUNT(*) AS total_products FROM raw_zepto;

-- Preview the data
SELECT * FROM raw_zepto LIMIT 10;

-- Check what categories you have
SELECT DISTINCT category FROM raw_zepto;
SELECT DISTINCT category FROM raw_zepto ORDER BY category;
-- Drop the old table
DROP TABLE raw_zepto;

-- Create new table WITHOUT sku_id (let MySQL auto-generate it)
CREATE TABLE raw_zepto (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Auto-generated
    category VARCHAR(100),
    name VARCHAR(255),
    mrp INT,
    discountPercent DECIMAL(5,2),
    availableQuantity INT,
    discountedSellingPrice INT,
    weightInGms INT,
    outOfStock VARCHAR(10),
    quantity INT
);

DROP TABLE raw_zepto;

CREATE TABLE raw_zepto (
    category VARCHAR(100),
    name VARCHAR(255),
    mrp INT,
    discountPercent DECIMAL(5,2),
    availableQuantity INT,
    discountedSellingPrice INT,
    weightInGms INT,
    outOfStock VARCHAR(10),
    quantity INT
);
SELECT COUNT(*) AS total_products FROM raw_zepto;

-- Preview the data
SELECT * FROM raw_zepto LIMIT 10;

-- Check what categories you have
SELECT DISTINCT category FROM raw_zepto;
SELECT DISTINCT category FROM raw_zepto ORDER BY category;

USE inventory_project;

CREATE TABLE cleaned_products AS
SELECT 
    category,
    TRIM(name) AS product_name,
    mrp / 100.0 AS mrp_rupees,
    discountedSellingPrice / 100.0 AS price_rupees,
    IFNULL(discountPercent, 0) AS discount_percent,
    availableQuantity,
    weightInGms,
    CASE 
        WHEN LOWER(outOfStock) = 'true' THEN 1 
        ELSE 0 
    END AS is_out_of_stock,
    quantity
FROM raw_zepto
WHERE mrp > 0 
  AND name IS NOT NULL 
  AND name != '';

-- Verify cleaned data
SELECT COUNT(*) FROM cleaned_products;
SELECT * FROM cleaned_products LIMIT 10;

-- QUERY 1

SELECT 
    product_name,
    category,
    discount_percent,
    price_rupees,
    mrp_rupees
FROM cleaned_products
WHERE is_out_of_stock = 0
ORDER BY discount_percent DESC
LIMIT 10;

-- QUERY TWO

SELECT 
    category,
    COUNT(*) as total_products,
    SUM(availableQuantity) as total_stock,
    ROUND(AVG(discount_percent), 2) as avg_discount,
    ROUND(AVG(price_rupees), 2) as avg_price,
    SUM(CASE WHEN availableQuantity < 5 THEN 1 ELSE 0 END) as critical_stock,
    SUM(CASE WHEN availableQuantity < 15 THEN 1 ELSE 0 END) as low_stock,
    SUM(CASE WHEN availableQuantity > 100 THEN 1 ELSE 0 END) as overstocked
FROM cleaned_products
GROUP BY category
ORDER BY total_stock DESC;

-- QUERY 3

SELECT 
    category,
    COUNT(*) as product_count,
    SUM(price_rupees * quantity) as estimated_revenue,
    ROUND(AVG(price_rupees), 2) as avg_product_price
FROM cleaned_products
GROUP BY category
ORDER BY estimated_revenue DESC;

-- QUERY 4

SELECT 
    category,
    COUNT(*) as product_count,
    SUM(price_rupees * quantity) as estimated_revenue,
    ROUND(AVG(price_rupees), 2) as avg_product_price
FROM cleaned_products
GROUP BY category
ORDER BY estimated_revenue DESC;

-- QUERY 5

SELECT 
    category,
    product_name,
    price_rupees,
    RANK() OVER (PARTITION BY category ORDER BY price_rupees DESC) as price_rank,
    ROUND(AVG(price_rupees) OVER (PARTITION BY category), 2) as avg_category_price
FROM cleaned_products
ORDER BY category, price_rank;


-- Export cleaned data to CSV for Power BI
SELECT * FROM cleaned_products 
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_products.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


