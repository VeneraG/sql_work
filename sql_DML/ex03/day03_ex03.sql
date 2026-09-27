WITH
   female_visits AS (
      SELECT
         pizzeria.name AS pizzeria_name,
         COUNT(*) AS visits_count
      FROM
         person
         INNER JOIN person_visits ON person_visits.person_id = person.id
         INNER JOIN pizzeria on person_visits.pizzeria_id = pizzeria.id
      where
         person.gender = 'female'
      GROUP by
         pizzeria.name
   ),
   male_visits AS (
      SELECT
         pizzeria.name AS pizzeria_name,
         COUNT(*) AS visits_count
      FROM
         person
         INNER JOIN person_visits ON person_visits.person_id = person.id
         INNER JOIN pizzeria on person_visits.pizzeria_id = pizzeria.id
      where
         person.gender = 'male'
      GROUP by
         pizzeria.name
   )
SELECT
   male_visits.pizzeria_name
FROM
   male_visits
   INNER JOIN female_visits on male_visits.pizzeria_name = female_visits.pizzeria_name
WHERE
   male_visits.visits_count != female_visits.visits_count
ORDER by
   pizzeria_name;