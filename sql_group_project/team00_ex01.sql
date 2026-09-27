WITH RECURSIVE search_path(current_node, current_path, score) AS
(
    SELECT 
        'a'::CHAR(1) AS current_node,
        'a'::TEXT AS current_path,
        0::INTEGER AS score

    UNION ALL

    SELECT
        edges.point2 AS current_node,
        (search_path.current_path || ',' || edges.point2) AS current_path,  
        (search_path.score + edges.cost) AS score
    FROM search_path
    JOIN edges ON search_path.current_node = edges.point1
    WHERE POSITION(edges.point2 IN search_path.current_path) = 0
),
completed_routes AS (
    SELECT 
        score + (SELECT cost FROM edges WHERE point1 = current_node AND point2 = 'a') AS total_cost,
        '{' || current_path || ',a}' AS tour  
    FROM search_path
    WHERE POSITION('b' IN current_path) != 0 
      AND POSITION('c' IN current_path) != 0
      AND POSITION('d' IN current_path) != 0
      AND LENGTH(REPLACE(current_path, ',', '')) = 4
      AND EXISTS (
          SELECT 1 FROM edges 
          WHERE point1 = current_node AND point2 = 'a'
      )
)
SELECT *
FROM completed_routes
WHERE total_cost = (SELECT MIN(total_cost) FROM completed_routes)

UNION
SELECT *
FROM completed_routes
WHERE total_cost = (SELECT MAX(total_cost) FROM completed_routes)
ORDER BY total_cost, tour;