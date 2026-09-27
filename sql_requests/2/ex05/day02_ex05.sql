SELECT
   person.name
FROM
   person
WHERE
   person.age > 25
   and person.gender = 'female'
ORDER BY
   person.name;