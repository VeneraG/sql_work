select
	(select name from person p where p.id = po.person_id ) as name 
	from person_order po 
	where (po.menu_id = 13 or po.menu_id = 14 or po.menu_id = 18) and po.order_date = '2022-01-07' ;
	
	