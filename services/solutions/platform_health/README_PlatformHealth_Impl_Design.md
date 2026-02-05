# Platform Health Intelligence – Implementation Design (Agentic AI Aligned)

## Document Purpose
This document defines **how the architecture is implemented**, aligning the Platform Health solution
with **Agentic AI anatomy**, while remaining pragmatic and v1-friendly.

---

## 1. Design Philosophy

- Business-first, not framework-first
- Facade-first internally
- API-first externally
- Agents are modular and replaceable
- Avoid over-engineering v1

---

## 2. Layered Implementation Model

```
Adapters (API / CLI / Lambda / Workflow)
        |
Facade (Business Orchestration)
        |
Agents (Sense • Reason • Plan • Coordinate • Act)
        |
Ports (Contracts)
        |
Adapters (Data, Tools, Environments)
```

---

## 3. Facade Implementation Rules

### Responsibilities
- Accept validated input DTOs
- Establish business goals
- Invoke agents in correct order
- Aggregate outcomes
- Produce final decision DTO

### Non-Responsibilities
- Transport handling
- Agent orchestration frameworks
- Environment-specific logic

The facade **never reasons directly**.

---

## 4. Agent Implementation Model

Each agent internally implements:

| Component | Responsibility |
|---------|----------------|
| Goals | Desired outcomes |
| Sense | Collect signals |
| Reason | Interpret signals (LLM-assisted) |
| Plan | Decide next actions |
| Coordinate | Interact via shared memory |
| Act | Execute actions |
| Memory | Store experiences |

Agents are:
- stateless across invocations (by default)
- optionally stateful via shared memory

---

## 5. Shared Memory Implementation

Shared memory:
- enables agent collaboration
- stores observations, plans, decisions
- can be backed by in-memory, Redis, DynamoDB, etc.

Agents never communicate directly.

---

## 6. DTO Design

### Input DTO (HealthObservation)
- Represents *perception*
- Structured, aggregated signals

### Output DTO (PlatformHealthDecision)
- Represents *action outcome*
- Stable, explainable

DTOs are solution-scoped and versioned implicitly (v1).

---

## 7. API Adapter Implementation

- Converts HTTP → DTO
- Calls facade
- Converts DTO → HTTP
- Versioned at `/api/v1`

No business logic allowed.

---

## 8. Workflow & Agentic Framework Integration

### LangGraph
- Facade used as a node
- Reasoning loops externalized
- Shared memory injected

### n8n / Low-Code
- Integrates via API
- Treats platform as a service

---

## 9. MCP Server Implementation

- Exposes platform health context
- Provides deterministic summaries
- Used by external agents
- No reasoning logic inside MCP server

---

## 10. Configuration & Feature Flags

- Enable/disable LLM reasoning
- Control coordination behavior
- Govern cost-heavy actions
- Environment-specific overrides

---

## 11. Error Handling Strategy

- Fail fast on invalid perception
- Graceful degradation when signals missing
- Explicit error propagation

---

## 12. Testing Strategy

- Unit tests for agents and facade
- Mock adapters for environments
- No LLM dependency in unit tests
- Integration tests per runtime

---

## 13. Evolution Strategy

- Add new agents without breaking facade
- Introduce negotiation patterns later
- Expand shared memory strategies
- Version APIs only when externally required

---

## 14. Guardrails

1. No logic in API adapters
2. No orchestration frameworks inside agents
3. No hardcoded LLMs or tools
4. No cross-agent direct calls
5. No premature abstractions
