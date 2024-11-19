WITH t1 AS (SELECT id as person_id, name, age
            FROM person)

SELECT order_date, CONCAT(t1.name, ' (age:', t1.age, ')') AS person_information
FROM person_order
NATURAL JOIN t1
ORDER BY order_date, person_information;