SELECT 
DISTINCT all_dates.missing_date::DATE
FROM
(
    SELECT generate_series('2022-01-01'::DATE, '2022-01-10'::DATE, '1 day') AS missing_date
) AS all_dates
LEFT JOIN (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2
) AS visits ON all_dates.missing_date = visits.visit_date
WHERE visits.visit_date is NULL
ORDER BY missing_date
;