SET ENABLE_SEQSCAN = OFF;
EXPLAIN ANALYSE
SELECT pizza_name, pizzeria.name
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
