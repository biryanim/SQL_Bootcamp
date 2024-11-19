SELECT pizza_name, pizzeria.name as pizzeria_name, price
FROM menu
FULL JOIN pizzeria ON pizzeria_id = pizzeria.id
WHERE pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name
