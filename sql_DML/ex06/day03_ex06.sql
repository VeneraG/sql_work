WITH
   p2 AS (
      SELECT
         menu.pizza_name,
         p1.name as pizzeria_name_2,
         menu.price
      FROM
         pizzeria p1
         inner JOIN menu ON p1.id = menu.pizzeria_id
   )
SELECT
   p2.pizza_name,
   p1.name as pizzeria_name_1,
   p2.pizzeria_name_2,
   p2.price
FROM
   pizzeria p1
   inner JOIN menu ON p1.id = menu.pizzeria_id
   inner JOIN p2 on menu.pizza_name = p2.pizza_name
WHERE
   p1.name != p2.pizzeria_name_2
   and menu.price = p2.price
   and p1.name < p2.pizzeria_name_2
