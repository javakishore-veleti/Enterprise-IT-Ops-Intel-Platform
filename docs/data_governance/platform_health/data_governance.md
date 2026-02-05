# Platform Health Intelligence – Data Governance Policies

## Data Categories
- Operational metrics (non-PII)
- System logs (non-PII)
- Trace metadata
- Derived health decisions

## Data Classification
| Data Type | Classification |
|----------|----------------|
| Metrics | Internal |
| Logs | Internal |
| Traces | Internal |
| Health Decisions | Confidential |

## Data Handling Rules
- No customer PII ingested
- No raw logs persisted by default
- Derived insights retained, not raw signals

## AI & LLM Governance
- Prompts must not contain secrets
- Responses are ephemeral by default
- LLM calls are audited and traceable

## Retention Policy
- Metrics: governed by source system
- Health decisions: 30 days (configurable)
- Audit logs: 90 days

## Ownership
- Platform Team: policy enforcement
- Security Team: audit & compliance
