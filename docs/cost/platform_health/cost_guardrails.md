# Platform Health Intelligence – Cost Guardrails

## Cost Drivers
- LLM inference calls
- Observability data queries
- Workflow executions

## Guardrails
- LLM calls capped per invocation
- Batch analysis preferred over real-time where possible
- Feature flags to disable expensive reasoning

## Monitoring
- Cost allocation tags
- Budget alerts at 70% and 90%

## Optimization Strategies
- Cache deterministic results
- Use lower-cost models for explanations
- Prefer Step Functions for batch workloads
