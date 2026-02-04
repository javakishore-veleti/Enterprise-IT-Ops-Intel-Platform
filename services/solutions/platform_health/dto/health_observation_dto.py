from pydantic import BaseModel
from typing import Dict, List, Optional


class HealthObservationDTO(BaseModel):
    time_window: str
    service_scope: List[str]
    metrics: Dict[str, float]
    error_rates: Dict[str, float]
    latency_p99: Dict[str, float]
    anomalies: Optional[List[str]] = None
