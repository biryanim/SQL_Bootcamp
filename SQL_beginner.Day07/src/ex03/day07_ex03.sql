WITH po AS (SELECT name, count(person_order.id) as count, 'order'
            FROM pizzeria
                     JOIN menu ON pizzeria.id = menu.pizzeria_id
                     JOIN person_order ON menu.id = person_order.menu_id
            GROUP BY name),
     pv AS (SELECT name, count(person_visits.id) as count, 'visit' as action_type
            FROM person_visits
                     JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
            GROUP BY name
            ORDER BY count DESC)

SELECT pv.name as name, pv.count + po.count AS total_count
FROM pv
         JOIN po ON pv.name = po.name
ORDER BY total_count DESC, name;

