# PostgreSQL Regression Lab

SQL regression fixtures and documentation-oriented examples for [PostgreSQL](https://github.com/postgres/postgres).

Personal lab by [@balasahu87](https://github.com/balasahu87).

## Quick start

```bash
docker compose up -d
./scripts/wait_ready.sh
./scripts/run_cases.sh
```

## Cases

| ID | Area | Intent |
|----|------|--------|
| `PG-001` | NULLS DISTINCT | Unique null handling (`UNIQUE NULLS NOT DISTINCT`) |
| `PG-002` | JSONB | Containment / path query |
| `PG-003` | Window | `FILTER` clause on aggregates |
| `PG-004` | CTE | `SEARCH` / recursive CTE depth |
| `PG-005` | Generated | Generated columns + check constraint |

## Upstream

PostgreSQL contributions typically go through the community process (pgsql-hackers / commitfest), not only GitHub PRs. Track any real submissions in [UPSTREAM.md](UPSTREAM.md).

## References

- Lab: https://github.com/balasahu87/postgresql-regression-lab
- Upstream mirror: https://github.com/postgres/postgres
- Contribute: https://wiki.postgresql.org/wiki/Development_information
