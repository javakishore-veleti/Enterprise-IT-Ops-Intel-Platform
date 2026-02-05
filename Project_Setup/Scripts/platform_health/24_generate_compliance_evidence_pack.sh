#!/usr/bin/env bash
set -e

echo "[24] Generating compliance evidence pack"

BASE_DIR=$(git rev-parse --show-toplevel)
COMP_DIR="$BASE_DIR/docs/compliance/platform_health"

mkdir -p "$COMP_DIR"

cat <<EOF > "$COMP_DIR/compliance_evidence.md"
# Platform Health Intelligence – Compliance Evidence Pack

## Security Controls
- IAM-based authentication
- Least-privilege roles
- KMS encryption at rest and in transit

## Audit Evidence
- CloudTrail logs enabled
- Request tracing with correlation IDs
- Immutable build artifacts

## Change Management
- GitHub pull request approvals
- Manual promotion across environments
- Tagged releases

## AI Governance Evidence
- Config-driven LLM selection
- Feature flags for AI capabilities
- Cost and usage monitoring

## Applicable Frameworks
- ISO 27001 (controls alignment)
- SOC 2 (logical access, change management)
- NIST (least privilege, auditability)
EOF

echo "[24] Compliance evidence pack generated"
