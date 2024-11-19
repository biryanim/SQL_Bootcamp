WITH
pv AS(
    SELECT visit_date
    FROM person_visits
    WHERE person_id = 1 or person_id = 2
)
SELECT vd::date as missing_date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS vd
LEFT JOIN pv ON pv.visit_date = vd
WHERE pv.visit_date is NULL