from pydantic import BaseModel
from typing import List


class PlatformHealthDecisionDTO(BaseModel):
    health_status: str
    contributing_services: List[str]
    probable_causes: List[str]
    confidence: float
    explanation: str
