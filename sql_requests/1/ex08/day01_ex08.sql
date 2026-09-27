WITH
   person_renamed AS (
      SELECT
         id AS person_id,
         name,
         age
      FROM
         person
   )
SELECT
   order_date,
   person_renamed.name || '(age:' || person_renamed.age || ')'
FROM
   person_order
   NATURAL JOIN person_renamed
ORDER BY
   order_date,
   person_renamed.name;