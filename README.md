# 📊 Superstore Business Analytics Dashboard  
End-to-end Business Analytics project using SQL + Power BI to analyze Superstore sales, customer segments, and product performance (2015–2018). Includes KPIs, insights, and recommended actions.

---

## 🔥 Project Overview
This project demonstrates a full analytics workflow used in Business Analyst / Data Analyst roles:

- Data ingestion (CSV → PostgreSQL staging)
- Star schema data modeling
- ETL pipeline using SQL
- Analytical SQL queries (KPIs, YoY growth, trends)
- Power BI dashboard with interactive slicers
- Executive insights + recommended business actions

---

## 🧱 Project Architecture
Dataset (train.csv)
↓
PostgreSQL Staging Table (stg_superstore)
↓
Dimension Tables:
- dim_customer
- dim_product
- dim_date
Fact Table:
- fact_sales
↓
Analytical SQL Queries
↓
Power BI Dashboard + Insights


---

## 🗄️ SQL Pipeline Structure  
Folder: `/SQL`

| File | Description |
|------|-------------|
| 00_create_database.sql | Create database & schema |
| 01_create_staging_table.sql | Create staging table |
| 02_create_tables_star_schema.sql | Star schema structure |
| 03_create_dim_customer.sql | Customer dimension |
| 04_create_dim_date.sql | Date dimension |
| 05_create_dim_product.sql | Product dimension |
| 06_create_fact_sales.sql | Sales fact table |
| 07_load_staging_table.sql | Load raw CSV into staging |
| 08_load_dim_customer.sql | Populate dim_customer |
| 09_load_dim_product.sql | Populate dim_product |
| 10_load_dim_date.sql | Populate dim_date |
| 11_load_fact_sales.sql | Populate fact_sales |
| 12_analysis_queries.sql | KPI & analysis SQL |

---

## 📈 Power BI Dashboard  
Folder: `/PowerBI`

### Dashboard Includes:
- KPIs (Total Sales, Orders, Customers, AOV)
- Monthly Sales Trend
- Sales by Category
- Sales by Sub-Category
- Sales by Segment
- Slicers (Year, Category, Segment)
- Executive Insights Box

---

## 🔍 Key Insights

### **Overall Performance**
- **Total Sales:** $2.26M  
- **Total Orders:** 5K+  
- **Total Customers:** 793  
- **AOV:** $459  

### **Business Insights**
- Technology & Phones drive the highest revenue → expand promotions  
- Underperforming Sub-Categories (Fasteners/Labels) → consider repositioning or reducing inventory  
- Q3–Q4 consistently show peak sales → ideal timing for campaigns & bundled offers  

---

## 🧠 Skills Demonstrated

### **SQL (PostgreSQL)**
- ETL pipeline development  
- Star schema modeling  
- Window functions (LAG, ROW_NUMBER)  
- Aggregation & analytical queries  
- Joins & CTEs  

### **Power BI**
- Data modeling  
- KPI visuals  
- Interactive slicers  
- Trend & segmentation analysis  

### **Business Analytics**
- Retail performance analysis  
- KPI storytelling  
- Executive insights & recommendations  

---

## 📂 Dataset
`train.csv` (retail order dataset)  
Includes: Orders, customers, products, sales, ship details, and geolocation data.

---

## 🚀 How to Run

### **1. Load SQL Pipeline**
Run files in this order:
00 → 01 → 02 → ... → 12


### **2. Load Dashboard**
- Connect Power BI to PostgreSQL  
- Import calculated SQL queries  
- Use provided visuals to recreate dashboard  

---

## 👤 Author
**Siripaiboon “Flame” Janpetch**  
M.S. Data Analytics @ UTSA  
Business Analyst / Data Analyst (SQL, Python, Power BI)

GitHub: https://github.com/FlameSJ2000  
LinkedIn: www.linkedin.com/in/siripaiboon-janpetch

---

## ⭐ Support
If you find this project useful, please ⭐ star the repository!  
It helps support my portfolio while applying for BA/DA internships.

