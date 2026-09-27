SELECT
   menu.id as menu_id
FROM
   menu
WHERE
   menu.id not in (
      SELECT DISTINCT
         person_order.menu_id
      from
         person_order
   )
order by
   menu.id