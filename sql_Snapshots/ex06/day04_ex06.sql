CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT
   pz.name
FROM
   pizzeria pz
   inner JOIN person_visits ON person_visits.pizzeria_id = pz.id
   inner JOIN person ON person.id = person_visits.person_id
   INNER JOIN menu m ON pz.id = m.pizzeria_id
WHERE
   person_visits.visit_date = '2022-01-08'
   AND person.name = 'Dmitriy'
   AND m.price < 800;