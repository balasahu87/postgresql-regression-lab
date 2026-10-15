-- PG-002: jsonb containment
SELECT '{"a":1,"b":{"c":true}}'::jsonb @> '{"b":{"c":true}}'::jsonb AS contains;
