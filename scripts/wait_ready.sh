#!/usr/bin/env bash
set -euo pipefail
for i in $(seq 1 60); do
  if docker compose exec -T postgres pg_isready -U postgres >/dev/null 2>&1; then
    echo "Postgres ready"; exit 0
  fi
  sleep 1
done
exit 1
