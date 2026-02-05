from locust import HttpUser, task, between

class PlatformHealthUser(HttpUser):
    wait_time = between(1, 5)

    @task
    def analyze_health(self):
        self.client.post("/platform-health/analyze", json={
            "time_window": "5m",
            "service_scope": ["orders"],
            "metrics": {"cpu": 70},
            "error_rates": {"5xx": 0.01},
            "latency_p99": {"orders": 900}
        })
