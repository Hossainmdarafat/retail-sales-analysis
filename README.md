# Retail Sales Analysis (Excel + MySQL + Power BI)

## Project Overview
This is an end-to-end retail sales analysis project using a Global Superstore dataset.  
The goal was to understand sales performance, customer behavior (segments), and profitability across markets to support business decision-making.

## Business Questions
- Which **markets** generate the highest profit?
- Which **customer segments** are most profitable?
- How does profitability change **year by year**?
- Are there areas with **losses (negative profit)** that need attention?

## Dataset
- Source: Public “Global Superstore” dataset (used for portfolio/learning purposes)
- Format: Excel/CSV
- Columns used: `Order Date`, `Segment`, `Market`, `Sales`, `Profit`

## Tools Used
- **Microsoft Excel** (cleaning + pivot analysis + charts)
- **MySQL** (data type fixes + aggregation queries)
- **Power BI Desktop** (interactive dashboard)

---

## Excel Work
### Data Cleaning & Preparation
- Standardized mixed date formats and sorted dates chronologically
- Removed/handled blank date values
- Prepared data for time-based analysis

### Analysis
- Pivot Table: **Market × Segment → Sum of Profit**
- Pivot Chart: Visualized segment-wise profitability by market
- Timeline filter: Year-based analysis (similar to dashboard filtering)

![Excel Pivot Table and Chart](screenshot/excel_pivot_profit_by_market_segment.png)

---

## SQL (MySQL) Work
### Data Preparation
- Fixed import issues where numeric/date fields were stored as TEXT
- Converted:
  - `Sales`, `Profit` → DECIMAL
  - `Order Date` → DATE (where applicable)

### Core Analysis Queries
- Total sales & total profit
- Profit by market
- Profit by segment
- Profit by market × segment
- Year-wise and market-wise profit trends

[View SQL queries](sql/sql_queries.sql)

---

## Power BI Dashboard
Built a simple interactive dashboard to visualize:
- **Profit by Market**
- **Profit by Segment**
- **Year slicer** for filtering (2011–2014)

 
![Power BI Dashboard](screenshot/powerbi_dashboard.png)
---

## Sales Insights & Recommendations

- Sales peaked during the later years of the dataset (2013–2014), indicating strong growth momentum.
- Lower sales were observed in the early years, particularly in 2011.
- The company should analyze strategies used during high-sales periods and replicate them across weaker markets or segments.
- Seasonal and year-based trends can be leveraged for better sales forecasting and planning.


## Key Insights (Example)
- Consumer segment produced the highest overall profit.
- APAC and EU markets showed strong profitability.

---

## How to Use

- Open the Power BI report (`.pbix`) from the `/powerbi` folder.
- Use the Year slicer to filter and explore results across different years.
- Review the SQL queries used for analysis in `/sql/sql_queries.sql`.


---

## Author
**Md. Arafat Hossain**

