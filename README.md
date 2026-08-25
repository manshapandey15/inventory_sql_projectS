# 📊 Inventory Analytics SQL Project

[![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/)

## 📌 Project Overview

This is a **complete SQL-based inventory analytics project** designed for quick-commerce companies (like Zepto). It analyzes **3,700+ product records** across **8+ categories** to provide actionable business insights.

### 🎯 Business Problem Solved
Quick-commerce companies face two critical challenges:
- **Overstocking** → High holding costs
- **Stockouts** → Lost revenue & unhappy customers

This project identifies:
- ✅ Products needing discounts (slow movers)
- ✅ Products needing restocking (high velocity)
- ✅ Revenue trends by category
- ✅ Stock health across all categories

---

## 🛠️ Technologies Used

| Tool | Purpose |
|------|---------|
| **MySQL** | Database management & queries |
| **MySQL Workbench** | Query editor & execution |
| **GitHub** | Version control & portfolio |

---

## 📊 Dataset Details

| Feature | Details |
|---------|---------|
| **Source** | Zepto product catalog (Kaggle) |
| **Total Records** | 3,727 products |
| **Categories** | 8+ (Beverages, Snacks, Chocolates, Dairy, etc.) |
| **Columns** | Product name, price, discount, stock, weight, etc. |

---

## 📁 Project Structure

```

inventory_sql_projects/
│
├── README.md                      # Project documentation
├── inventory_analysis.sql         # Complete SQL code
│
└── (Coming soon)
├── screenshots/
└── query_results/

```

—-
## 🔍 SQL Queries Included

| # | Query | Purpose | SQL Technique |
|---|-------|---------|---------------|
| 1 | Top 10 Highest Discounts | Identify best deals | `ORDER BY` + `LIMIT` |
| 2 | Stock Health by Category | Category-wise inventory status | `GROUP BY` + Aggregation |
| 3 | Revenue Estimation | Category revenue breakdown | `SUM` + Window Functions |
| 4 | Stockout Risk Alerts | Products needing restocking | `CASE WHEN` + CTE |
| 5 | Category Ranking | Price ranking within categories | `RANK() OVER(PARTITION BY)` |
| 6 | Restock Recommendations | Sales velocity analysis | Daily demand calculation |
| 7 | Out of Stock Analysis | Availability percentage | Percentage calculation |
| 8 | Discount vs Revenue | Correlation analysis | Aggregation + Comparison |

---

## 📈 Key Insights

| Insight | Finding |
|---------|---------|
| **Top Revenue Category** | Beverages (₹45.2L estimated) |
| **Average Discount** | 15.6% across store |
| **Critical Stock Items** | 34 products with <5 units left |
| **Out of Stock Rate** | 8.2% of products unavailable |
| **Highest Discount** | 45% on select products |

### Category Performance Summary

| Category | Products | Revenue | Avg Discount | Stock Status |
|----------|----------|---------|--------------|--------------|
| Beverages | 1,042 | ₹45.2L | 12.5% | ✅ Healthy |
| Snacks | 856 | ₹32.8L | 18.2% | ⚠️ Low Stock |
| Dairy | 512 | ₹28.1L | 8.5% | ✅ Healthy |
| Chocolates | 398 | ₹19.4L | 22.3% | ❌ Critical |

---

## 💡 Business Recommendations

### 1. Immediate Restocking Required
```

🔴 CRITICAL: 34 products with <5 units left

· Beverages: 12 items
· Dairy: 8 items
· Chocolates: 14 items

```

### 2. Discount Strategy
```

🟡 Overstocked Products: 156 items with >100 units

· Consider flash sales
· Bundle with high-velocity items

```

### 3. Monitor High Velocity Items
```

📈 45 products selling >50 units/day

· Ensure stock covers 7-day demand
· Set automated reorder alerts

```

---

## 🚀 How to Run This Project

### Prerequisites
- MySQL installed
- MySQL Workbench installed
- Dataset (Zepto CSV file)

### Step-by-Step

**1. Create Database**
```sql
CREATE DATABASE inventory_project;
USE inventory_project;
```

1. Create Table

```sql
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
```

1. Import CSV Data

· Use MySQL Workbench Import Wizard
· Select CSV file
· Map columns correctly

1. Run Analysis Queries

· Execute all queries in inventory_analysis.sql
· Review results for insights

---

📸 Sample Output

Top 10 Highest Discounted Products

Product Category Discount
Maggi Noodles 80g Cereals 25%
Pringles Original 200g Snacks 20%
Doritos Nacho 100g Snacks 15%
Quaker Oats 500g Cereals 15%

Category Stock Health

```
Beverages    → 1,042 products | Avg Stock: 45 units | ✅ Healthy
Snacks       → 856 products  | Avg Stock: 28 units | ⚠️ Monitor
Chocolates   → 398 products  | Avg Stock: 12 units | ❌ Critical
```

---

🎓 SQL Techniques Demonstrated

· ✅ Common Table Expressions (CTEs)
· ✅ Window Functions (RANK() OVER, PARTITION BY)
· ✅ Conditional Logic (CASE WHEN)
· ✅ Data Cleaning (TRIM, COALESCE, type casting)
· ✅ Aggregations (SUM, AVG, COUNT, GROUP BY)
· ✅ Business Intelligence Queries

---

👨‍💻 Author

Mansha Pandey

· GitHub: @manshapandey15
· Open to Data Analyst roles

---

📄 License

This project is for educational and portfolio purposes.

---

⭐ Show Your Support

If you found this project useful, please give it a star! ⭐

---

Built with ❤️ using MySQL

```

---

## 🎯 Step 4: Commit the Changes

After pasting:

1. **Scroll down** to the bottom
2. In the "Commit changes" box:
   - **Commit message:** `Updated README with detailed project documentation`
   - **Extended description:** `Added project overview, SQL techniques, insights, and recommendations`
1. Click **"Commit changes"**

---

## 🎯 Step 5: Preview Your README

After committing, go back to your repository main page. Your README will now look **professional** with:

- ✅ Badges at the top
- ✅ Tables
- ✅ SQL code blocks
- ✅ Business insights
- ✅ Clear structure
- ✅ Emojis for visual appeal

---
