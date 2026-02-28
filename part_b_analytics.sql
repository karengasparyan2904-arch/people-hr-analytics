WITH months AS (
    SELECT DATE_TRUNC('month', applied_date) AS month_start
    FROM raw_applications
    UNION
    SELECT DATE_TRUNC('month', decision_date) FROM raw_applications
)
SELECT
    m.month_start,
    COUNT(DISTINCT a.app_id) AS active_applications
FROM months m
JOIN raw_applications a
    ON a.applied_date <= (m.month_start + INTERVAL '1 month' - INTERVAL '1 day')
   AND (a.decision_date IS NULL OR a.decision_date >= m.month_start)
GROUP BY m.month_start
ORDER BY m.month_start;

WITH hires AS (
    SELECT 
        c.source,
        DATE_TRUNC('month', a.decision_date) AS month,
        COUNT(*) AS hires_in_month
    FROM raw_candidates c
    JOIN raw_applications a ON c.candidate_id = a.candidate_id
    WHERE a.decision_date IS NOT NULL
    GROUP BY c.source, DATE_TRUNC('month', a.decision_date)
)
SELECT
    source,
    month,
    SUM(hires_in_month) OVER (PARTITION BY source ORDER BY month) AS cumulative_hires
FROM hires
ORDER BY source, month;
