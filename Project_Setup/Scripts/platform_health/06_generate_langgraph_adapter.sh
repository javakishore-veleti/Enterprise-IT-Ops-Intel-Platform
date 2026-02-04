#!/usr/bin/env bash
set -e

echo "[06] Generating LangGraph adapter"

BASE_DIR=$(git rev-parse --show-toplevel)
ORCH_DIR="$BASE_DIR/services/solutions/platform_health/orchestration"

cat <<EOF > "$ORCH_DIR/langgraph_adapter.py"
from services.solutions.platform_health.facade import PlatformHealthFacade
from services.solutions.platform_health.dto.health_observation_dto import HealthObservationDTO


def platform_health_node(state: dict) -> dict:
    facade = PlatformHealthFacade()
    observation = HealthObservationDTO(**state["observation"])
    decision = facade.analyze(observation)

    return {
        "health_status": decision.health_status,
        "confidence": decision.confidence,
        "explanation": decision.explanation
    }
EOF

echo "[06] LangGraph adapter generated"
