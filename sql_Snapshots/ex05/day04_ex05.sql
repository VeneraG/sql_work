CREATE VIEW v_price_with_discount AS
select 
person.name,
menu.pizza_name,
menu.price,
round(menu.price - menu.price * 0.1) as discount_price
FROM person
inner join person_order ON person_order.person_id = person.id
inner JOIN menu ON menu.id = person_order.menu_id
ORDER BY person.name,menu.pizza_name;
