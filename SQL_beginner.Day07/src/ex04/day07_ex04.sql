SELECT name, count(person_visits.id) as count_of_visits
FROM person
         JOIN person_visits ON person.id = person_visits.person_id
GROUP BY name
HAVING count(person_visits.id) > 3;

