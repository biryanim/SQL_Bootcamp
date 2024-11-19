SELECT DISTINCT m1.pizza_name, p1.name AS pizzeria_name_1, p2.name AS pizzeria_name_2, m1.price AS price
FROM menu m1
         JOIN menu m2 ON m1.pizza_name = m2.pizza_name
         JOIN pizzeria as p1 ON m1.pizzeria_id = p1.id
         JOIN pizzeria as p2 ON m2.pizzeria_id = p2.id
WHERE m1.pizzeria_id > m2.pizzeria_id
  AND m1.price = m2.price
ORDER BY m1.pizza_name;