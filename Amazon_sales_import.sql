CREATE DATABASE amazon_sales;
USE amazon_sales;

CREATE TABLE amazon_products (
  product_id VARCHAR(255) PRIMARY KEY,
  product_name TEXT,
  category VARCHAR(255),
  discounted_price DECIMAL(10,2),
  actual_price DECIMAL(10,2),
  discount_percentage DECIMAL(5,2),
  rating DECIMAL(2,1),
  rating_count BIGINT,
  user_id VARCHAR(255),
  user_name VARCHAR(255),
  review_id VARCHAR(255),
  review_title TEXT
);

SELECT COUNT(*) AS rows_imported FROM amazon_products;
SHOW COLUMNS FROM amazon_products;
DESCRIBE amazon_products;

SELECT product_id, product_name, category, discounted_price, actual_price, rating, rating_count, user_id, user_name, review_id, review_title
FROM amazon_products
LIMIT 10;

SELECT DISTINCT rating_count 
FROM amazon_products 
LIMIT 10;

