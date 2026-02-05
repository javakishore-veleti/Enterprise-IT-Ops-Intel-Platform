#!/usr/bin/env bash
set -e

echo "[25] Generating release readiness checklist"

BASE_DIR=$(git rev-parse --show-toplevel)
REL_DIR="$BASE_DIR/docs/release/platform_health"

mkdir -p "$REL_DIR"

cat <<EOF > "$REL_DIR/release_readiness.md"
# Platform Health Intelligence – Release Readiness Checklist

## Functional Readiness
- [ ] All unit tests passing
- [ ] Facade contracts validated
- [ ] API schemas reviewed

## Reliability
- [ ] SLOs defined and approved
- [ ] Error budget thresholds configured
- [ ] Load tests executed

## Security
- [ ] Threat model reviewed
- [ ] IAM roles validated
- [ ] Secrets managed via KMS / Secrets Manager

## Cost
- [ ] Cost guardrails applied
- [ ] Budget alerts configured
- [ ] LLM usage capped

## Operations
- [ ] Dashboards deployed
- [ ] Alerts configured
- [ ] Runbooks documented

## Governance
- [ ] Data governance approved
- [ ] Compliance evidence archived
- [ ] Release approved by stakeholders
EOF

echo "[25] Release readiness checklist generated"
