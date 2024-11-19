SELECT person.name as name, pizza_name, price, price - (price * discount/100.0) as discount_price, pizzeria.name as pizzeria_name
FROM person_discounts
JOIN person ON person_discounts.person_id = person.id
JOIN menu ON person_discounts.pizzeria_id = menu.pizzeria_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY name, pizza_name