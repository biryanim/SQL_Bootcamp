WITH
visits AS (SELECT pizzeria.name AS pizzeria_name, person.gender as p_gender
FROM pizzeria
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
JOIN person ON person_visits.person_id = person.id)

((SELECT pizzeria_name FROM visits WHERE p_gender = 'male')
EXCEPT ALL
(SELECT  pizzeria_name FROM visits WHERE p_gender = 'female'))
UNION ALL
((SELECT pizzeria_name FROM visits WHERE p_gender = 'female')
EXCEPT  ALL
(SELECT pizzeria_name FROM visits WHERE p_gender = 'male'))
ORDER BY pizzeria_name
