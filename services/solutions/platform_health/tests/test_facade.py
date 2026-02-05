from services.solutions.platform_health.facade import PlatformHealthFacade
from services.solutions.platform_health.dto.health_observation_dto import HealthObservationDTO


def test_platform_health_facade():
    facade = PlatformHealthFacade()

    observation = HealthObservationDTO(
        time_window="5m",
        service_scope=["orders", "payments"],
        metrics={"cpu": 80.0},
        error_rates={"5xx": 0.02},
        latency_p99={"orders": 1200.0},
        anomalies=["latency_spike"]
    )

    decision = facade.analyze(observation)

    assert decision.health_status in ["HEALTHY", "DEGRADED", "CRITICAL"]
    assert decision.confidence > 0
    assert decision.explanation is not None
