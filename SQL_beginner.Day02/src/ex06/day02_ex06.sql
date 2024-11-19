SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE menu.id IN
      (SELECT person_order.menu_id FROM person_order
       WHERE person_order.person_id IN (SELECT person.id FROM person WHERE person.name = 'Denis' OR person.name = 'Anna'))
ORDER BY pizza_name, pizzeria_name
