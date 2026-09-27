WITH
   female_visits AS (
      SELECT
         pizzeria.name AS pizzeria_name,
         COUNT(*) AS order_count
      FROM
         person
         INNER JOIN person_order ON person_order.person_id = person.id
         inner join menu ON menu.id = person_order.menu_id
         INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
      where
         person.gender = 'female'
      GROUP by
         pizzeria.name
   ),
   male_visits AS (
      SELECT
         pizzeria.name AS pizzeria_name,
         COUNT(*) AS order_count
      FROM
         person
         INNER JOIN person_order ON person_order.person_id = person.id
         inner join menu ON menu.id = person_order.menu_id
         INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
      where
         person.gender = 'male'
      GROUP by
         pizzeria.name
   )
SELECT
   female_visits.pizzeria_name
from
   female_visits
except all
SELECT
   male_visits.pizzeria_name
FROM
   male_visits;
