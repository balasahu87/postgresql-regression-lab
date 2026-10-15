-- PG-003: aggregate FILTER
SELECT
  COUNT(*) AS all_n,
  COUNT(*) FILTER (WHERE n % 2 = 0) AS even_n
FROM generate_series(1,10) AS t(n);
