SELECT DISTINCT
   p.name
FROM
   person p
   INNER JOIN person_order po ON po.person_id = p.id
   INNER JOIN menu ON menu.id = po.menu_id
WHERE
   p.gender = 'male'
   and (
      p.address = 'Moscow'
      or p.address = 'Samara'
   )
   and menu.pizza_name in ('mushroom pizza', 'pepperoni pizza')
order by
   p.name DESC;