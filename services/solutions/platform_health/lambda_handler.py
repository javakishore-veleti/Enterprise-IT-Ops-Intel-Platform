from services.solutions.platform_health.facade import PlatformHealthFacade
from services.solutions.platform_health.dto.health_observation_dto import HealthObservationDTO


def handler(event, context):
    observation = HealthObservationDTO(**event)
    facade = PlatformHealthFacade()
    decision = facade.analyze(observation)
    return decision.model_dump()
