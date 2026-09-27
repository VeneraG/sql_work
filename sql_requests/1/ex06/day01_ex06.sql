(
   select
      po.order_date as action_date,
      (
         select
            name
         from
            person p
         where
            p.id = po.person_id
      ) as person_name
   from
      person_order po
)
intersect
(
   select
      pv.visit_date as action_date,
      (
         select
            name
         from
            person p
         where
            p.id = pv.person_id
      ) as person_name
   from
      person_visits pv
)
order by
   action_date asc,
   person_name desc;