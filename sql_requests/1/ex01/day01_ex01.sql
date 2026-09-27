(
   select
      name as object_name
   from
      person p
   order by
      object_name
)
union all
(
   select
      pizza_name as object_name
   from
      menu m
   order by
      object_name
);