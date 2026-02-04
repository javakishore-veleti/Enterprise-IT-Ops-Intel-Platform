from abc import ABC, abstractmethod


class DecisionAgentPort(ABC):

    @abstractmethod
    def decide(self, analysis_result: dict):
        pass
