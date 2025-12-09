# Customer Retention & Cohort Analysis

## 📌 Project Overview
Analysis of customer retention for a UK-based online retailer using a dataset of 500k+ transactions. The goal was to understand how user engagement changes over time and identify seasonal trends in customer behavior.

## 🛠 Tech Stack
* **SQL (BigQuery):** Data cleaning, window functions for cohort identification.
* **Power BI:** Visualization, DAX measures for dynamic retention calculation.
* **Statistics:** Cohort Analysis, Retention Rate.

## 📊 Visualization & Interactivity

The dashboard allows for both high-level overview and deep-dive analysis into specific cohorts.

### 1. General Overview
The full heatmap shows retention rates across all cohorts from Dec 2010 to Dec 2011.
![Full Dashboard Overview](Cohort_Analys.png)

### 2. Interactive Drill-Down
By clicking on a specific cohort (e.g., **Dec 2010**) in the matrix, the line chart automatically highlights the retention curve for that specific group, allowing for clearer trend analysis.
![Selected Cohort Drill-down](Cohort_filtered.png)

## 💡 Key Insights
1.  **Seasonal Impact:** A significant retention spike (~50%) occurs in **Month 11** for the December 2010 cohort, indicating strong seasonality (customers returning for the next holiday season).
2.  **Early Churn:** The steepest drop in users happens after the first month (Month 0 to Month 1), which is typical for retail, but suggests a need for better onboarding or post-purchase engagement emails.

## 💻 SQL Logic
The core analysis was performed using SQL Window Functions to determine the first purchase date for each customer:

```sql
-- Snippet of the logic
DATE_TRUNC(MIN(InvoiceDate) OVER (PARTITION BY CustomerID), MONTH) as cohort_month
