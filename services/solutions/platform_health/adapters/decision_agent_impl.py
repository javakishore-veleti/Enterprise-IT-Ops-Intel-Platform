from services.solutions.platform_health.ports.decision_agent import DecisionAgentPort


class DecisionAgentImpl(DecisionAgentPort):

    def decide(self, analysis_result: dict):
        return {
            "health_status": "DEGRADED",
            "confidence": 0.82,
            "causes": analysis_result.get("issues", [])
        }
