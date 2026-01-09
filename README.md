# 🧹 Superstore SQL Data Cleaning & Profitability Analysis

![Clean PostgreSQL Database](Project_Image.jpeg)

## 📌 Project Overview
This project involves working with data from a **hypothetical Superstore** to strengthen and demonstrate practical **SQL data cleaning and analysis skills** using **PostgreSQL**.

The analysis focuses on:
- Cleaning improperly typed fields (dates stored as text, numerical inconsistencies)
- Identifying **top-performing product categories** based on profit margins
- Detecting and handling **missing or inconsistent values**
- Applying advanced SQL concepts to transform raw operational data into reliable analytical outputs

This project simulates real-world data quality challenges commonly faced by data analysts and analytics engineers.

---

## 🎯 Objectives
- Convert improperly stored **date and numeric fields** into usable formats
- Identify **categories with the highest profitability**
- Detect **missing or anomalous values** in key business columns
- Practice SQL techniques such as filtering, aggregation, joins, casting, and validation checks

---

## 🗂️ Dataset Description
The database consists of four related tables containing sales, product, people, and return information.

---

## 📖 Data Dictionary

### 🧾 `orders`
| Column | Description | Data Type | Notes |
|------|------------|----------|------|
| `row_id` | Unique record ID | INTEGER | |
| `order_id` | Order identifier | TEXT | Links to `returned_orders.order_id` |
| `order_date` | Order date | TEXT | Requires conversion to DATE |
| `market` | Market the order belongs to | TEXT | |
| `region` | Customer region | TEXT | Links to `people.region` |
| `product_id` | Product identifier | TEXT | Links to `products.product_id` |
| `sales` | Sales amount | DOUBLE PRECISION | |
| `quantity` | Quantity sold | DOUBLE PRECISION | |
| `discount` | Discount applied | DOUBLE PRECISION | |
| `profit` | Profit earned | DOUBLE PRECISION | |

---

### 🔄 `returned_orders`
| Column | Description | Data Type |
|------|------------|----------|
| `returned` | Indicates if an item was returned | TEXT |
| `order_id` | Order identifier | TEXT |
| `market` | Market the order belongs to | TEXT |

---

### 👥 `people`
| Column | Description | Data Type |
|------|------------|----------|
| `person` | Salesperson name | TEXT |
| `region` | Sales region | TEXT |

---

### 🛒 `products`
| Column | Description | Data Type |
|------|------------|----------|
| `product_id` | Product identifier | TEXT |
| `category` | Product category | TEXT |
| `sub_category` | Product sub-category | TEXT |
| `product_name` | Product name | TEXT |

---

## ⚠️ Data Quality Considerations
- Date fields in the `orders` table are stored as **TEXT** and require conversion before analysis
- Numerical fields may contain missing or inconsistent values
- Some joins require careful validation to avoid data duplication or loss

Handling these challenges is a **core part of the project**.

---

## 🛠️ Tools & Technologies
- PostgreSQL
- SQL (Data Cleaning & Analysis)
- GitHub (Version Control & Documentation)

---

## 📈 Key Skills Demonstrated
- SQL data cleaning
- Data type casting and validation
- Multi-table joins
- Aggregation and profitability analysis
- Analytical thinking with real-world datasets
