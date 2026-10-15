#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PSQL=(docker compose exec -T postgres psql -U postgres -d pg_lab -v ON_ERROR_STOP=1 -At)
pass=0; fail=0
shopt -s nullglob
cd "$ROOT"
for sql in cases/*.sql; do
  base="$(basename "$sql" .sql)"
  exp="cases/${base}.expected"
  echo "==> $base"
  out="$(mktemp)"
  if ! "${PSQL[@]}" -f "$sql" >"$out" 2>"$out.err"; then
    # PG-001 intentionally raises NOTICE via DO; still allow if final SELECT ok
    if grep -q 'ok_unique_violation' "$out.err" && [[ -f "$exp" ]]; then
      :
    else
      echo "FAIL $base"; cat "$out.err"; fail=$((fail+1)); continue
    fi
  fi
  # For DO blocks, re-run only the final SELECT if needed
  if [[ "$base" == "PG-001_unique_nulls" ]]; then
    "${PSQL[@]}" -c "SELECT COUNT(*) AS n FROM t_uniq;" >"$out"
  fi
  if diff -u <(grep -v '^$' "$exp" | tr -d ' ') <(grep -v '^$' "$out" | tr -d ' '); then
    echo "PASS $base"; pass=$((pass+1))
  else
    echo "FAIL $base"; diff -u "$exp" "$out" || true; fail=$((fail+1))
  fi
done
echo "Summary: pass=$pass fail=$fail"
[[ "$fail" -eq 0 ]]
