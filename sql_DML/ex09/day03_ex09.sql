INSERT INTO person_visits (id, person_id, pizzeria_id,visit_date )
VALUES (
   (SELECT COALESCE(MAX(id), 0) + 1 FROM person_visits),
   (SELECT id from person WHERE person.name = 'Denis'),
   (select id from pizzeria WHERE pizzeria.name = 'Dominos'),
   '2022-02-24'
),
(
   (SELECT COALESCE(MAX(id), 0) + 2 FROM person_visits),
   (SELECT id from person WHERE person.name = 'Irina'),
   (select id from pizzeria WHERE pizzeria.name = 'Dominos'),
   '2022-02-24'
)
;
