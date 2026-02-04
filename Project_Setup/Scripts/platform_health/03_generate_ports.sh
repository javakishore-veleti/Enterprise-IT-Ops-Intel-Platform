#!/usr/bin/env bash
set -e

echo "[03] Generating ports (interfaces)"

BASE_DIR=$(git rev-parse --show-toplevel)
PORTS_DIR="$BASE_DIR/services/solutions/platform_health/ports"

cat <<EOF > "$PORTS_DIR/observability_agent.py"
from abc import ABC, abstractmethod
from services.solutions.platform_health.dto.health_observation_dto import HealthObservationDTO


class ObservabilityAgentPort(ABC):

    @abstractmethod
    def analyze(self, observation: HealthObservationDTO):
        pass
EOF

cat <<EOF > "$PORTS_DIR/decision_agent.py"
from abc import ABC, abstractmethod


class DecisionAgentPort(ABC):

    @abstractmethod
    def decide(self, analysis_result: dict):
        pass
EOF

echo "[03] Ports generated"
