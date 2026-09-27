(
   SELECT
      pizzeria.name
   FROM
      person
      inner JOIN person_visits ON person_visits.person_id = person.id
      inner join pizzeria ON pizzeria.id = person_visits.pizzeria_id
   WHERE
      person.name = 'Andrey'
)
except all
(
   SELECT
      pizzeria.name
   FROM
      person
      inner JOIN person_order ON person_order.person_id = person.id
      inner JOIN menu ON menu.id = person_order.menu_id
      inner join pizzeria ON pizzeria.id = menu.pizzeria_id
   WHERE
      person.name = 'Andrey'
)