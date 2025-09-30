-- 1. Count total products
SELECT COUNT(*) AS total_products
FROM amazon_products;

-- 2. Check distinct categories and their product counts
SELECT category, COUNT(*) AS product_count
FROM amazon_products
GROUP BY category
ORDER BY product_count DESC;

-- 3. Price distribution (avg, min, max per category)
SELECT category,
       AVG(CAST(discounted_price AS DECIMAL(10,2))) AS avg_discounted_price,
       MIN(CAST(discounted_price AS DECIMAL(10,2))) AS min_discounted_price,
       MAX(CAST(discounted_price AS DECIMAL(10,2))) AS max_discounted_price
FROM amazon_products
GROUP BY category
ORDER BY avg_discounted_price DESC;

-- 4. Average ratings per category
SELECT category,
       ROUND(AVG(CAST(rating AS DECIMAL(3,2))), 2) AS avg_rating,
       COUNT(*) AS num_products
FROM amazon_products
GROUP BY category
ORDER BY avg_rating DESC;


-- 5. Most reviewed products
SELECT product_name,
       CAST(rating_count AS UNSIGNED) AS reviews
FROM amazon_products
ORDER BY reviews DESC
LIMIT 10;

-- 6. Most popular categories by reviews
SELECT category, SUM(CAST(rating_count AS UNSIGNED)) AS total_reviews
FROM amazon_products
GROUP BY category
ORDER BY total_reviews DESC
LIMIT 10;

-- 7. Rating distribution
SELECT rating, COUNT(*) AS count_products
FROM amazon_products
GROUP BY rating
ORDER BY rating DESC;

-- 8. Estimated revenue (approximation)
SELECT product_name, 
       (CAST(discounted_price AS DECIMAL(10,2)) * CAST(rating_count AS UNSIGNED)) AS estimated_revenue
FROM amazon_products
ORDER BY estimated_revenue DESC
LIMIT 20;

-- 9. Categories with highest discounts
SELECT category, ROUND(AVG(CAST(discount_percentage AS DECIMAL(5,2))),2) AS avg_discount
FROM amazon_products
GROUP BY category
ORDER BY avg_discount DESC;
