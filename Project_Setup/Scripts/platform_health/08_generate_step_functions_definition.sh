#!/usr/bin/env bash
set -e

echo "[08] Generating Step Functions definition"

BASE_DIR=$(git rev-parse --show-toplevel)
SF_DIR="$BASE_DIR/services/solutions/platform_health/orchestration"

cat <<EOF > "$SF_DIR/platform_health_state_machine.asl.json"
{
  "Comment": "Platform Health Intelligence Workflow",
  "StartAt": "AnalyzePlatformHealth",
  "States": {
    "AnalyzePlatformHealth": {
      "Type": "Task",
      "Resource": "arn:aws:states:::lambda:invoke",
      "Parameters": {
        "FunctionName": "platform-health-analyze",
        "Payload.$": "$"
      },
      "End": true
    }
  }
}
EOF

echo "[08] Step Functions definition generated"
