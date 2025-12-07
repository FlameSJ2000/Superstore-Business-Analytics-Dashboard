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

## 📊 Power BI Dashboard

### 👉 Download dashboard file (PBIX)
[Click to download Power BI Dashboard](PowerBI/superstore_analytics_dashboard.pbix)

---

## 🖼️ Dashboard Preview  
(หลังจากอัปโหลดภาพเข้าโฟลเดอร์ `/images`)

### **Executive Overview**
![Executive](images/dashboard_overview.png)

### **Product Performance**
![Product](images/product_performance.png)

### **Segment Analysis**
![Segment](images/segment_analysis.png)

---

## 🔍 Key Insights

### ⭐ **Overall Performance**
- **Total Sales:** $2.26M  
- **Total Orders:** 5k+  
- **Total Customers:** 793  
- **Avg Order Value:** $459  

### 💼 **Business Insights**
- Technology & Phones generate the highest revenue → expand inventory  
- Underperforming sub-categories → consider repositioning or promotions  
- Q3–Q4 seasonal peaks → ideal period for marketing campaigns  

---

## 🎓 Skills Demonstrated

### 🛢️ **SQL (PostgreSQL)**
- ETL pipeline development  
- Star schema modeling  
- Window functions (LAG, ROW_NUMBER)  
- Advanced joins & aggregations  
- CTE-based analytical queries  

### 📊 **Power BI**
- Data modeling  
- DAX measures  
- Interactive visuals  
- Segmentation & trend dashboards  

---

## ▶️ How to Run

### **1. Load SQL Pipeline**
Execute SQL files in order (00 → 11).  
This will build your warehouse and populate all dimensions & fact tables.

### **2. Load Dashboard**
- Open `.pbix` file  
- Connect Power BI to PostgreSQL  
- Refresh data  
- Explore KPIs & insights  

---

## 👤 Author

**Siripaiboon “Flame” Janpetch**  
M.S. Data Analytics – UTSA  
Business Analyst / Data Analyst (SQL, Python, Power BI)

GitHub: https://github.com/FlameSJ2000  
LinkedIn: https://www.linkedin.com/in/siripaiboon-janpetch  

---

## ⭐ Support
If you find this project helpful, please **star ⭐ the repository**.  
Your support helps strengthen my analytics portfolio while applying for internships.

