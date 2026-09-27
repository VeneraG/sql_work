(
   select
      name as object_name
   from
      person p
   where
      p."name" = 'pizza'
)
union
(
   select
      pizza_name as object_name
   from
      menu m
)
order by
   object_name desc;