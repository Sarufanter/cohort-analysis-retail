with clean_data as (
  SELECT * FROM online_retail d
  where d.CustomerID is not null and d.Quantity > 0 and d.UnitPrice > 0
),
user_activities as (
SELECT
    CustomerID,
    DATE(DATE_TRUNC(InvoiceDate, MONTH)) as activity_month,
    
    DATE(DATE_TRUNC(
        MIN(InvoiceDate) OVER (PARTITION BY CAST(CustomerID AS INT)), 
        MONTH
    )) as cohort_month

FROM clean_data
)

SELECT
    cohort_month,
    DATE_DIFF(activity_month, cohort_month, MONTH) AS month_number, 
    count(distinct(CustomerID)) AS num_users    
FROM user_activities
GROUP BY 1, 2
ORDER BY 1, 2
