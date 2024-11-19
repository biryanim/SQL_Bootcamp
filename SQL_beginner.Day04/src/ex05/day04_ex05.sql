CREATE VIEW v_price_with_discount AS
SELECT name, pizza_name, price, (price * 0.9)::integer as discount_price
FROM menu
JOIN person_order ON menu.id = person_order.menu_id
JOIN person ON person_order.person_id = person.id
ORDER BY name, pizza_name;

select * from v_price_with_discount
