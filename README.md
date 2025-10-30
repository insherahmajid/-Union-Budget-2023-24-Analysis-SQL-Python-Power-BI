## Union Budget 2023–24 Analysis | SQL + Python + Power BI

##  Project Overview
This project presents a complete **data analytics workflow** using **SQL, Python, and Power BI** to analyze India’s **Union Budget (FY 2021–2023)**.  
It covers every step from **data cleaning and transformation** to **exploratory analysis** and **interactive visualization**.

The goal is to identify **trends, growth patterns, and funding priorities** across ministries and government schemes.

##  Project Objectives
- Analyze **Budget Estimates (BE)** for 2022 and 2023.  
- Identify **top ministries and schemes** by allocation.  
- Detect **growth trends** and **underfunded schemes**.  
- Segment schemes by **positive, negative, and zero growth**.  
- Build an **interactive Power BI dashboard** for visual exploration.

##  Data Cleaning (Python)

### Tools: `Pandas`, `Matplotlib`, `Seaborn`

Performed using Jupyter Notebook (`UnionBudget.ipynb`):

- Imported and inspected CSV file.  
- Cleaned column names and removed redundant fields.  
- Converted numeric columns (`Actuals_2021`, `BE_2022`, `BE_2023`).  
- Calculated new field:
  ```python
  budget['Growth_percent'] = ((budget['BE_2023'] - budget['BE_2022']) / budget['BE_2022']) * 100

-Handled missing values and filtered invalid records.
-Exported the cleaned dataset as unionbudget_cleaned.csv
## [ Notebook:] (UnionBudget.ipynb)

## Data Analysis (SQL)
**Tools:** PostgreSQL

**Top 10 Ministries by 2023 Budget**
SELECT ministry, SUM(BE_2023) AS Total_2023
FROM union_budget_schemes
GROUP BY ministry
ORDER BY Total_2023 DESC
LIMIT 10;

**Total Schemes per Ministry**
SELECT ministry, COUNT(DISTINCT scheme) AS Total_Schemes
FROM union_budget_schemes
GROUP BY ministry
ORDER BY Total_Schemes DESC;

**Schemes with Positive and Negative Growth**
SELECT scheme, ministry, SUM(Growth_Percent) AS Growth_percentage
FROM union_budget_schemes
GROUP BY scheme, ministry
HAVING SUM(Growth_Percent) > 0
ORDER BY Growth_percentage DESC;
## SQL Script: unionBudgetProject.sql

## Visualization (Power BI)

**Tool:** Power BI Desktop
**File:** Union_Budget_2023-24.pbix

| KPI              | Value     |
| ---------------- | --------- |
| Total Schemes    | 710       |
| Total Ministries | 69        |
| Total BE 2022    | ₹1.18M Cr |
| Total BE 2023    | ₹1.47M Cr |
| Overall Growth   | 24%       |

**Key Visuals:**
-Top 5 Ministries by 2023 Budget
-Top 5 Schemes by Allocation
-Ministry-wise Comparison (BE 2022 vs BE 2023)
-Growth Category Distribution (Positive, Negative, Zero)
-Sector-wise Spending Trends

## **Dashboard Report (PDF):**union_budget_project.pdf

 ## Insights & Findings

-Road Transport & Highways and Railways received the largest 2023 allocations.
-Food & Public Distribution and Fertilizers remain consistent high-spending areas.
-Petroleum and Natural Gas show the highest growth rate (~366%).
-220 schemes recorded positive growth, while 292 declined.
-Average year-on-year growth across ministries: ~24%.

## Skills & Tools Demonstrated
**Skill	Description**
**Python**(Pandas, Seaborn)	Data cleaning and feature engineering
**SQL** (PostgreSQL)	Aggregation, grouping, and growth analysis
**Power BI**	Interactive visualization and KPI dashboard
 Data Storytelling	Translating raw financial data into insights

 ## Learnings

-Improved efficiency in combining Python, SQL, and Power BI workflows.
-Gained deeper understanding of public finance datasets.
-Enhanced ability to present data through interactive dashboards.

## Future Enhancements

-Automate dataset refresh using Power BI Service APIs.
-Integrate live budget data from data.gov.in
-Build predictive models for budget trend forecasting.

## Author

Insherah Majid
🎓 B.Tech in Information Technology
📊 Data Analyst | Power BI | SQL | Python
📍 Srinagar, Kashmir

🔗 LinkedIn
 (www.linkedin.com/in/insherah-majid-146496317)
📧 insherahmajid81@gmail.com
 
