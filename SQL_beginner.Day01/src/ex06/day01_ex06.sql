SELECT DISTINCT order_date AS action_date, person.name as person_name 
FROM person_order
INNER JOIN person
ON person_id = person.id
INNER JOIN person_visits
ON person_visits.person_id = person_order.person_id
ORDER BY action_date, person_name DESC