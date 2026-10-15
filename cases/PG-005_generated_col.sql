-- PG-005: generated column
DROP TABLE IF EXISTS t_gen;
CREATE TABLE t_gen (
  qty INT NOT NULL,
  price NUMERIC(10,2) NOT NULL,
  total NUMERIC(12,2) GENERATED ALWAYS AS (qty * price) STORED,
  CONSTRAINT t_gen_qty_pos CHECK (qty > 0)
);
INSERT INTO t_gen (qty, price) VALUES (3, 2.50);
SELECT qty, price, total FROM t_gen;
