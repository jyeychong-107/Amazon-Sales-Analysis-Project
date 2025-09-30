# 📊 Amazon Sales Data Analysis Project

## 📝 Overview
This project explores **Amazon product sales data** to uncover factors that influence sales performance.  
By analyzing pricing, discounts, ratings, and categories, the goal is to understand customer behavior and identify what drives product popularity.  

The analysis was done using **SQL for data exploration and modeling**, and results were visualized in a **Tableau dashboard**.  

---

## 🎯 Objectives
- Perform **Exploratory Data Analysis (EDA)** to understand the dataset.  
- Identify **key factors that affect sales** (price, discount, ratings, category).  
- Estimate **best-selling products and categories**.  
- Explore the relationship between **discounts and customer demand**.  
- Build a **Tableau dashboard** for interactive exploration.  
- Provide **recommendations** for business improvements.  

---

## 🔍 Steps Performed

### 1. Data Cleaning
- Removed symbols like `₹` and `%` from price/discount columns.  
- Converted columns to proper numeric types (`discounted_price`, `actual_price`, `rating`, `rating_count`, `discount_percentage`).  
- Handled missing or inconsistent values.  

### 2. Exploratory Data Analysis (EDA)  
- **Dataset overview**: total products, distinct categories.  
- **Price analysis**: average, min, max prices per category.  
- **Rating analysis**: average rating per category, rating distribution.  
- **Review analysis**: most reviewed products and categories.  
- **Discounts**: categories with highest average discounts.  

### 3. Data Modeling with SQL
- **Price vs Sales**: Grouped products by price ranges and compared average reviews.  
- **Discount vs Sales**: Created discount percentage bands (e.g., 0–9%, 10–19%) to measure effect on sales.  
- **Rating vs Sales**: Checked if higher ratings → more reviews.  
- **Category vs Sales**: Ranked categories by total reviews and average ratings.  
- **Weighted Popularity**: Used `(rating × rating_count)` as a proxy for product strength.  
- **Revenue Estimation**: Estimated sales revenue as `(discounted_price × rating_count)`.  

### 4. Visualization
Built a **Tableau dashboard** to display:  
- Top-selling products  
- Best-performing categories  
- Discount impact on sales  
- Price vs sales trends  

---

## 📊 Results
- **Electronics and Accessories** categories dominated sales.  
- Products with **moderate discounts (40-60%)** performed better than those with extreme discounts.  
- **Mid-range priced products** had higher sales compared to very expensive or very cheap items.  
- High ratings correlated positively with higher sales, but **rating count** was a stronger sales indicator.  

---

## 🔧 Improvements for Next Analysis
- Add **time-series analysis** (if timestamps available) to see sales trends over time.  
- Explore **correlation analysis** (SQL `CORR()`) between price/discount and sales volume.  
- Include **customer segmentation** (e.g., frequent buyers vs one-time buyers).  
- Use **machine learning models** (e.g., regression) to predict sales drivers more accurately.  
- Expand visualization with **geographic or seasonal insights** if more metadata is available.  

---

## 🛠 Tech Stack
- **Excel** → Initial data preprocessing before import.  
- **SQL** (MySQL) → Data cleaning, EDA, and analysis.  
- **Tableau** → Data visualization and interactive dashboard.  
- **GitHub** → Version control and documentation.  

## 📂 Project Structure
