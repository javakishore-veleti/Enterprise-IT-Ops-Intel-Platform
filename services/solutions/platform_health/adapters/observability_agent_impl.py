from services.solutions.platform_health.ports.observability_agent import ObservabilityAgentPort


class ObservabilityAgentImpl(ObservabilityAgentPort):

    def analyze(self, observation):
        return {
            "issues": ["high_latency"],
            "services": observation.service_scope
        }
