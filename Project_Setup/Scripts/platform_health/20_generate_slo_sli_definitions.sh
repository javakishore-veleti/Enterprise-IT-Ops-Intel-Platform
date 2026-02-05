#!/usr/bin/env bash
set -e

echo "[20] Generating SLO/SLI definitions"

BASE_DIR=$(git rev-parse --show-toplevel)
SLO_DIR="$BASE_DIR/docs/sre/platform_health"

mkdir -p "$SLO_DIR"

cat <<EOF > "$SLO_DIR/slo_sli.md"
# Platform Health Intelligence – SLO / SLI

## SLIs
- Health decision latency (p95)
- Decision success rate
- Confidence score availability
- API error rate

## SLOs
- 99.9% successful health decisions
- p95 latency < 2 seconds
- Confidence score present in 100% of responses

## Error Budget
- 0.1% monthly error budget
- Alerts triggered at 50% and 75% burn
EOF

echo "[20] SLO/SLI definitions generated"
