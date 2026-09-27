SELECT
   m.pizza_name,
   pi.name,
   m.price
FROM
   menu m
   INNER JOIN pizzeria pi ON m.pizzeria_id = pi.id
WHERE
   m.pizza_name = 'mushroom pizza'
   OR m.pizza_name = 'pepperoni pizza'
ORDER BY
   m.pizza_name,
   pi.name;