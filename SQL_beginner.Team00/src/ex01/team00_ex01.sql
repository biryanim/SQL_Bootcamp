WITH RECURSIVE travel(path, last_point, total_cost, points_visited) AS (
  SELECT 
    'a' as path,
    CAST('a' as text) as last_point, 
    0 as total_cost, 
    'a' as points_visited
  UNION ALL
    SELECT
      CONCAT(t.path, ',', paths.point2),
      paths.point2,
      t.total_cost + paths.cost,
      CONCAT(t.points_visited, paths.point2)
    FROM travel t INNER JOIN paths
    ON t.last_point = paths.point1
    WHERE position(paths.point2 IN t.points_visited) = 0
), final_travel AS ( 
    SELECT
      CONCAT('{', t.path, ',', paths.point2, '}') as tour,
      paths.point2 as last_point,
      t.total_cost + paths.cost as total_cost,
      CONCAT(t.points_visited, paths.point2) as visited_points
    FROM travel t INNER JOIN paths
      ON t.last_point = paths.point1
    WHERE paths.point2 = 'a'
      AND length(t.points_visited) = (SELECT COUNT(DISTINCT point1) FROM paths)
)
SELECT total_cost, tour
FROM final_travel
WHERE total_cost = (SELECT MIN(total_cost) FROM final_travel)
    UNION ALL
SELECT total_cost, tour
FROM final_travel
WHERE total_cost = (SELECT MAX(total_cost) FROM final_travel)
ORDER BY total_cost, tour;