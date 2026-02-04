#!/usr/bin/env bash
set -e

echo "[04] Generating adapters (implementations)"

BASE_DIR=$(git rev-parse --show-toplevel)
ADAPTER_DIR="$BASE_DIR/services/solutions/platform_health/adapters"

cat <<EOF > "$ADAPTER_DIR/observability_agent_impl.py"
from services.solutions.platform_health.ports.observability_agent import ObservabilityAgentPort


class ObservabilityAgentImpl(ObservabilityAgentPort):

    def analyze(self, observation):
        return {
            "issues": ["high_latency"],
            "services": observation.service_scope
        }
EOF

cat <<EOF > "$ADAPTER_DIR/decision_agent_impl.py"
from services.solutions.platform_health.ports.decision_agent import DecisionAgentPort


class DecisionAgentImpl(DecisionAgentPort):

    def decide(self, analysis_result: dict):
        return {
            "health_status": "DEGRADED",
            "confidence": 0.82,
            "causes": analysis_result.get("issues", [])
        }
EOF

echo "[04] Adapters generated"
