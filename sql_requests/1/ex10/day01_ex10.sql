SELECT
   person.name,
   menu.pizza_name,
   pizzeria.name
FROM
   person
   inner JOIN person_order ON person_order.person_id = person.id
   inner JOIN menu ON person_order.menu_id = menu.id
   inner JOIN pizzeria on pizzeria.id = menu.pizzeria_id
ORDER BY
   person.name,
   menu.pizza_name,
   pizzeria.name;