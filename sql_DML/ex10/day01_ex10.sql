INSERT INTO person_order (id, person_id, menu_id,order_date )
VALUES (
   (SELECT COALESCE(MAX(id), 0) + 1 FROM person_order),
   (SELECT id from person WHERE person.name = 'Denis'),
   (select id from menu WHERE menu.pizza_name = 'sicilian pizza'),
   '2022-02-24'
),
(
   (SELECT COALESCE(MAX(id), 0) + 2 FROM person_order),
   (SELECT id from person WHERE person.name = 'Irina'),
   (select id from menu WHERE menu.pizza_name = 'sicilian pizza'),
   '2022-02-24'
)
;
