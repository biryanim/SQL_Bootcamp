DROP TABLE IF EXISTS paths;

CREATE TABLE paths (
    id SERIAL PRIMARY KEY,
    point1 VARCHAR,
    point2 VARCHAR,
    cost INT
); 

INSERT INTO paths (point1, point2, cost)
VALUES
    ('a', 'b', 10),
    ('b', 'a', 10),
    ('a', 'd', 20),
    ('d', 'a', 20),
    ('a', 'c', 15),
    ('c', 'a', 15),
    ('b', 'd', 25),
    ('d', 'b', 25),
    ('c', 'd', 30),
    ('d', 'c', 30),
    ('b', 'c', 35),
    ('c', 'b', 35)
;


WITH RECURSIVE travel(path, last_point, total_cost, places_count) AS(
    SELECT point1, point1, 0, 1
    FROM paths as start
    WHERE point1 = 'a'

    UNION

    SELECT
        concat(t.path , ',' ,start.point2),
        start.point2,
        t.total_cost + start.cost,
        t.places_count + 1
    FROM travel as t
    JOIN paths as start ON t.last_point = start.point1
    WHERE position(start.point2 in t.path) = 0
),
ready_travel AS(
    SELECT total_cost + (SELECT paths.cost FROM paths WHERE point1 = 'a' AND point2 = last_point) as total_cost, 
        concat('{', path, ',', 'a', '}') as tour
    FROM travel
    WHERE places_count = 4
)
SELECT *
FROM ready_travel
WHERE total_cost = (SELECT min(total_cost) FROM ready_travel)
ORDER BY total_cost, tour;
