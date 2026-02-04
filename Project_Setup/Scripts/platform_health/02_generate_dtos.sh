#!/usr/bin/env bash
set -e

echo "[02] Generating DTOs for Platform Health"

BASE_DIR=$(git rev-parse --show-toplevel)
DTO_DIR="$BASE_DIR/services/solutions/platform_health/dto"

cat <<EOF > "$DTO_DIR/health_observation_dto.py"
from pydantic import BaseModel
from typing import Dict, List, Optional


class HealthObservationDTO(BaseModel):
    time_window: str
    service_scope: List[str]
    metrics: Dict[str, float]
    error_rates: Dict[str, float]
    latency_p99: Dict[str, float]
    anomalies: Optional[List[str]] = None
EOF

cat <<EOF > "$DTO_DIR/platform_health_decision_dto.py"
from pydantic import BaseModel
from typing import List


class PlatformHealthDecisionDTO(BaseModel):
    health_status: str
    contributing_services: List[str]
    probable_causes: List[str]
    confidence: float
    explanation: str
EOF

echo "[02] DTOs generated (safe to re-run)"
