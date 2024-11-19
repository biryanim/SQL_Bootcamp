(SELECT name, count(person_visits.id) as count, 'visit' as action_type
 FROM person_visits
          JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
 GROUP BY name
 ORDER BY count DESC
 LIMIT 3)
UNION
(SELECT name, count(person_order.id) as count, 'order'
 FROM pizzeria
          JOIN menu ON pizzeria.id = menu.pizzeria_id
          JOIN person_order ON menu.id = person_order.menu_id
 GROUP BY name
 ORDER BY count DESC
 LIMIT 3)
ORDER BY action_type, count DESC;
