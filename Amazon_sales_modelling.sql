-- Price vs Sales
SELECT ROUND(AVG(discounted_price),2) AS avg_price,
	   ROUND(AVG(rating_count),0) AS avg_reviews
FROM amazon_products
GROUP BY FLOOR(discounted_price / 1000)  -- group prices in buckets of 1000
ORDER BY avg_price DESC;

-- Discount vs Sales
SELECT 
    FLOOR(discount_percentage * 100 / 10) * 10 AS discount_band,  -- e.g. 0.37 → 37% → band = 30
    ROUND(AVG(rating_count),0) AS avg_reviews,
    COUNT(*) AS product_num
FROM amazon_products
GROUP BY discount_band
ORDER BY discount_band;

-- Rating vs Sales
SELECT 
    ROUND(rating,1) AS rating_group,
    ROUND(AVG(rating_count),0) AS avg_reviews
FROM amazon_products
GROUP BY rating_group
ORDER BY rating_group DESC;

-- Category vs Sales
SELECT 
    category,
    SUM(rating_count) AS total_reviews,
    ROUND(AVG(rating),2) AS avg_rating,
    ROUND(AVG(discount_percentage),2) AS avg_discount
FROM amazon_products
GROUP BY category
ORDER BY total_reviews DESC;

-- Rating vs Ranting Count
SELECT product_name,
       rating,
       rating_count,
       (rating * rating_count) AS weighted_score
FROM amazon_products
ORDER BY weighted_score DESC
LIMIT 20;

-- Average Rating vs Rating count
SELECT category,
       ROUND(AVG(rating),2) AS avg_rating,
       SUM(rating_count) AS total_reviews,
       ROUND(AVG(rating * rating_count),2) AS weighted_popularity
FROM amazon_products
GROUP BY category
ORDER BY weighted_popularity DESC;

-- Discount vs Rating
SELECT category,
       ROUND(AVG(discount_percentage),2) AS avg_discount,
       ROUND(AVG(rating),2) AS avg_rating
FROM amazon_products
GROUP BY category
ORDER BY avg_discount DESC;

-- Price vs Rating count 
SELECT category,
       ROUND(AVG(discounted_price),2) AS avg_price,
       ROUND(AVG(rating_count),0) AS avg_reviews
FROM amazon_products
GROUP BY category
ORDER BY avg_reviews DESC;

-- Best sellers by estimated revenue
SELECT product_name,
       discounted_price,
       rating_count,
       (discounted_price * rating_count) AS est_revenue
FROM amazon_products
ORDER BY est_revenue DESC
LIMIT 20;

-- AVERAGE AMAZON SALES
SELECT
  CONCAT(FLOOR(discount_band), '% - ', FLOOR(discount_band)+9, '%') AS band_label,
  ROUND(AVG(discounted_price_num),2) AS avg_price,
  ROUND(AVG(rating_num),2)           AS avg_rating,
  ROUND(AVG(rating_count_num),0)     AS avg_reviews,
  COUNT(*)                           AS num_products
FROM (
  SELECT
    FLOOR(CAST(discount_percentage AS DECIMAL(6,4)) * 100 / 10) * 10 AS discount_band,
    CAST(discounted_price AS DECIMAL(10,2)) AS discounted_price_num,
    CAST(rating AS DECIMAL(3,2))            AS rating_num,
    CAST(REPLACE(rating_count,',','') AS UNSIGNED) AS rating_count_num
  FROM amazon_products
) x
GROUP BY discount_band
ORDER BY discount_band;