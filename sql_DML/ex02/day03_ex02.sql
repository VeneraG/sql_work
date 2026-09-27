SELECT
   menu.pizza_name,menu.price, pizzeria.name AS pizzeria_name
FROM
   menu
inner JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE
   menu.id not in (
      SELECT DISTINCT
         person_order.menu_id
      from
         person_order
   )
order by
   menu.pizza_name