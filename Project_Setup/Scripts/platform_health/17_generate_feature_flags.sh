#!/usr/bin/env bash
set -e

echo "[17] Generating feature flag configuration"

BASE_DIR=$(git rev-parse --show-toplevel)
CFG_DIR="$BASE_DIR/config/feature_flags"

mkdir -p "$CFG_DIR"

cat <<EOF > "$CFG_DIR/platform_health_flags.yaml"
platform_health:
  enable_llm_reasoning: true
  enable_anomaly_correlation: true
  enable_event_triggering: false
  rollout_percentage: 100
EOF

echo "[17] Feature flag configuration generated"
