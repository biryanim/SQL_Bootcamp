SELECT pizzeria.name          as name,
       count(person_order.id) as count_of_orders,
       round(avg(price), 2)   as average_price,
       max(price)             as max_price,
       min(price)             as min_price
FROM menu
         JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
         JOIN person_order ON menu.id = person_order.menu_id
GROUP BY pizzeria.name
ORDER BY name;
