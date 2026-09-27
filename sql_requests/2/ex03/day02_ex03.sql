WITH all_dates AS (
    SELECT generate_series('2022-01-01'::DATE, '2022-01-10'::DATE, '1 day') AS missing_date
),
visits AS (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2
)
SELECT DISTINCT all_dates.missing_date::DATE
FROM all_dates
LEFT JOIN visits ON all_dates.missing_date = visits.visit_date
WHERE visits.visit_date IS NULL
ORDER BY missing_date;