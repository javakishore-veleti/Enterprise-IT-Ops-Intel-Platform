from abc import ABC, abstractmethod
from services.solutions.platform_health.dto.health_observation_dto import HealthObservationDTO


class ObservabilityAgentPort(ABC):

    @abstractmethod
    def analyze(self, observation: HealthObservationDTO):
        pass
