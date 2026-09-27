SELECT p.name
FROM
   person p
   INNER JOIN person_order po ON po.person_id = p.id
   INNER JOIN menu ON menu.id = po.menu_id
WHERE
   p.gender = 'female' and menu.pizza_name in ('cheese pizza', 'pepperoni pizza')
GROUP BY  p.name 
HAVING COUNT(DISTINCT menu.pizza_name) = 2
ORDER BY p.name;