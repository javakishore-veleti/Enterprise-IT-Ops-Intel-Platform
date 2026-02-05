from services.solutions.platform_health.facade import PlatformHealthFacade
from services.solutions.platform_health.dto.health_observation_dto import HealthObservationDTO

if __name__ == "__main__":
    observation = HealthObservationDTO(
        time_window="5m",
        service_scope=["orders", "payments"],
        metrics={"cpu": 75.0},
        error_rates={"5xx": 0.01},
        latency_p99={"orders": 950.0},
        anomalies=["latency_spike"]
    )

    facade = PlatformHealthFacade()
    decision = facade.analyze(observation)

    print("=== Platform Health Decision ===")
    print(decision.model_dump())
