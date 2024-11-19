WITH
 orders AS(
     SELECT pizzeria.name AS pizzeria_name, gender
     FROM person_order
     JOIN person ON person_order.person_id = person.id
     JOIN menu ON person_order.menu_id = menu.id
     JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
 )

((SELECT pizzeria_name FROM orders WHERE gender = 'male')
EXCEPT
(SELECT  pizzeria_name FROM orders WHERE gender = 'female'))
UNION
((SELECT pizzeria_name FROM orders WHERE gender = 'female')
EXCEPT
(SELECT pizzeria_name FROM orders WHERE gender = 'male'))