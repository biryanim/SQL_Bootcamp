WITH andrey_visit AS (SELECT pizzeria.name AS pizzeria_name, person_visits.person_id
                      FROM pizzeria
                               JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
                      WHERE person_visits.person_id = 2),
     andrey_order AS (SELECT pizzeria.name AS pizzeria_name, person_order.person_id
                      FROM pizzeria
                               JOIN menu ON pizzeria.id = menu.pizzeria_id
                               JOIN person_order ON menu.id = person_order.menu_id
                      WHERE person_order.person_id = 2)

SELECT pizzeria_name
FROM andrey_visit
EXCEPT
SELECT pizzeria_name
FROM andrey_order;



