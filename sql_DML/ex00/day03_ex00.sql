SELECT
   menu.pizza_name as pizza_name,
   menu.price,
   pizzeria.name as pizzeria_name,
   person_visits.visit_date
FROM
   person
   INNER JOIN person_visits ON person_visits.person_id = person.id
   inner JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
   inner JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE
   person.name = 'Kate'
   and menu.price BETWEEN 800 and 1000
ORDER BY
   menu.pizza_name,
   menu.price,
   pizzeria.name;