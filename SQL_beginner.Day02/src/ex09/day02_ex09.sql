WITH
t AS (SELECT person,name, pizza_name
    FROM person
    JOIN person_order ON person.id = person_order.person_id
    JOIN menu ON person_order.menu_id = menu.id
    WHERE gender = 'female')

SELECT name
FROM t
WHERE pizza_name = 'cheese pizza'
INTERSECT
SELECT name
FROM t
WHERE pizza_name = 'pepperoni pizza'
ORDER BY name
