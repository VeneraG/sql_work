SELECT
   pizzeria.name
FROM
   pizzeria
WHERE
   pizzeria.id NOT IN (
      SELECT
         pizzeria_id
      FROM
         person_visits
   );

SELECT
   p.name
FROM
   pizzeria p
WHERE
   not EXISTS (
      SELECT
         1
      FROM
         person_visits pv
      WHERE
         pv.pizzeria_id = p.id
   );