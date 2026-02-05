#!/usr/bin/env bash
set -e

echo "[16] Generating observability dashboard templates"

BASE_DIR=$(git rev-parse --show-toplevel)
OBS_DIR="$BASE_DIR/services/solutions/platform_health/observability"

mkdir -p "$OBS_DIR"

cat <<EOF > "$OBS_DIR/grafana_dashboard.json"
{
  "title": "Platform Health Intelligence",
  "panels": [
    {
      "type": "graph",
      "title": "Health Status Confidence",
      "targets": []
    },
    {
      "type": "table",
      "title": "Top Contributing Services",
      "targets": []
    }
  ]
}
EOF

cat <<EOF > "$OBS_DIR/cloudwatch_metrics.md"
# CloudWatch Metrics

- PlatformHealthDecisionCount
- PlatformHealthDegradedCount
- PlatformHealthConfidenceAverage
EOF

echo "[16] Observability dashboards generated"
