CREATE TABLE edges(
point1 CHAR(1) NOT NULL,
point2 CHAR(1) NOT NULL,
cost INTEGER NOT NULL,
PRIMARY KEY (point1, point2)
);

INSERT INTO edges (point1, point2, cost)
VALUES ('a', 'b', 10),
('b', 'a', 10),
('a', 'c', 15),
('c', 'a', 15),
('a', 'd', 20),
('d', 'a', 20),
('b', 'c', 35),
('c', 'b', 35),
('b', 'd', 25),
('d', 'b', 25),
('c', 'd', 30),
('d', 'c', 30);

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
ORDER BY total_cost, tour;