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
