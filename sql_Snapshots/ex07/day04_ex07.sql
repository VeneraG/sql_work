INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
    (SELECT COALESCE(MAX(id), 0) + 1 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    (
        SELECT pz.id 
        FROM pizzeria pz
        INNER JOIN menu m ON m.pizzeria_id = pz.id
        WHERE m.price < 800
          AND pz.id NOT IN (
              SELECT DISTINCT pv.pizzeria_id
              FROM person_visits pv
              INNER JOIN person p ON p.id = pv.person_id
              WHERE p.name = 'Dmitriy' 
                AND pv.visit_date = '2022-01-08'
          )
        LIMIT 1
    ),
    '2022-01-08'
);
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;