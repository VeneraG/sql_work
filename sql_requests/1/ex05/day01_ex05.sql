select
   p.id as person_id,
   p."name" as person_name,
   p.age,
   p.gender,
   p.address,
   p2.id as pizzeria_id,
   p2."name" as pizzeria_name,
   p2.rating
from
   person p
   cross join pizzeria p2
order by
   p.id,
   p2.id;