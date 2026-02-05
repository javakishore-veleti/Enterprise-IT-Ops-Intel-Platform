#!/usr/bin/env bash
set -e

echo "[13] Generating AWS Lambda handler"

BASE_DIR=$(git rev-parse --show-toplevel)
PH_DIR="$BASE_DIR/services/solutions/platform_health"

cat <<EOF > "$PH_DIR/lambda_handler.py"
from services.solutions.platform_health.facade import PlatformHealthFacade
from services.solutions.platform_health.dto.health_observation_dto import HealthObservationDTO


def handler(event, context):
    observation = HealthObservationDTO(**event)
    facade = PlatformHealthFacade()
    decision = facade.analyze(observation)
    return decision.model_dump()
EOF

echo "[13] Lambda handler generated"
