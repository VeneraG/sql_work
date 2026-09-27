SELECT
   m.pizza_name,
   pz.name as pizzeria_name
FROM
   person p
   INNER JOIN person_order po ON p.id = po.person_id
   inner join menu m ON m.id = po.menu_id
   inner JOIN pizzeria pz ON pz.id = m.pizzeria_id
WHERE
   p.name = 'Denis'
   OR p.name = 'Anna'
ORDER BY
   m.pizza_name,
   pz.name;

