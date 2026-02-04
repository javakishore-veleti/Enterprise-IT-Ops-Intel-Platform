#!/usr/bin/env bash
set -e

echo "[05] Generating PlatformHealthFacade"

BASE_DIR=$(git rev-parse --show-toplevel)
PH_DIR="$BASE_DIR/services/solutions/platform_health"

cat <<EOF > "$PH_DIR/facade.py"
from services.solutions.platform_health.dto.health_observation_dto import HealthObservationDTO
from services.solutions.platform_health.dto.platform_health_decision_dto import PlatformHealthDecisionDTO
from services.solutions.platform_health.adapters.observability_agent_impl import ObservabilityAgentImpl
from services.solutions.platform_health.adapters.decision_agent_impl import DecisionAgentImpl


class PlatformHealthFacade:

    def __init__(self):
        self.observability_agent = ObservabilityAgentImpl()
        self.decision_agent = DecisionAgentImpl()

    def analyze(self, observation: HealthObservationDTO) -> PlatformHealthDecisionDTO:
        analysis = self.observability_agent.analyze(observation)
        decision = self.decision_agent.decide(analysis)

        return PlatformHealthDecisionDTO(
            health_status=decision["health_status"],
            contributing_services=analysis.get("services", []),
            probable_causes=decision.get("causes", []),
            confidence=decision["confidence"],
            explanation="Correlated latency and error signals indicate degradation."
        )
EOF

echo "[05] Facade generated"
