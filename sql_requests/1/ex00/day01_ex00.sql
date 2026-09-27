select
   id as object_id,
   name as object_name
from
   person p
union
select
   id,
   pizza_name
from
   menu m
order by
   object_id,
   object_name;