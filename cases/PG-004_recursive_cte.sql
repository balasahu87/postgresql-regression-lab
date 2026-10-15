-- PG-004: recursive CTE
WITH RECURSIVE cnt(n) AS (
  SELECT 1
  UNION ALL
  SELECT n+1 FROM cnt WHERE n < 5
)
SELECT SUM(n) AS s FROM cnt;
