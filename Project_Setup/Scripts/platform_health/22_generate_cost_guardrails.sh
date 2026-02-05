#!/usr/bin/env bash
set -e

echo "[22] Generating cost guardrails"

BASE_DIR=$(git rev-parse --show-toplevel)
COST_DIR="$BASE_DIR/docs/cost/platform_health"

mkdir -p "$COST_DIR"

cat <<EOF > "$COST_DIR/cost_guardrails.md"
# Platform Health Intelligence – Cost Guardrails

## Cost Drivers
- LLM inference calls
- Observability data queries
- Workflow executions

## Guardrails
- LLM calls capped per invocation
- Batch analysis preferred over real-time where possible
- Feature flags to disable expensive reasoning

## Monitoring
- Cost allocation tags
- Budget alerts at 70% and 90%

## Optimization Strategies
- Cache deterministic results
- Use lower-cost models for explanations
- Prefer Step Functions for batch workloads
EOF

echo "[22] Cost guardrails generated"
