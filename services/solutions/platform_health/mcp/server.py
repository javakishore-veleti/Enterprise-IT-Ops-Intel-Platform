from fastapi import FastAPI
from pydantic import BaseModel
from typing import List, Dict

app = FastAPI(title="Platform Health MCP Server")

class PlatformHealthContext(BaseModel):
    services: List[str]
    health_status: str
    confidence: float
    indicators: Dict[str, float]

@app.post("/context")
def get_platform_health_context(ctx: PlatformHealthContext):
    return {
        "summary": f"Platform health is {ctx.health_status} with confidence {ctx.confidence}",
        "services": ctx.services,
        "indicators": ctx.indicators
    }
