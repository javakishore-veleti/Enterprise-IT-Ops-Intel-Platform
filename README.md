
# Enterprise IT Operations Intelligence Platform

---

## Overview

The **Enterprise IT Operations Intelligence Platform** is a modular, enterprise-grade platform designed to deliver
decision intelligence across complex IT and digital platforms. 

This platform reasons over live operational signals (metrics, logs, traces, deployments, topology, and cost) and provides explainable insights and
recommendations for engineers, SREs, platform teams, and technology leadership.

This platform reflects how large enterprises design internal platforms: modular, governed, extensible, and deployable across multiple environments.

---

## Core Problems This Platform Solves

- Lack of holistic visibility across distributed IT platforms
- Difficulty correlating deployments, incidents, and performance degradation
- High cognitive load on SREs and platform engineers during incidents
- Poor translation of low-level signals into executive-level narratives
- Tight coupling between AI frameworks and business logic in most GenAI systems

---

## Key Design Principles

1. **Solution-Oriented Modularity**
2. **DTO-Driven Contracts**
3. **Facade-Based Access**
4. **Workflow-Agnostic Intelligence**
5. **Enterprise Security First**
6. **Manual Environment Promotion**
7. **Pythonic Architecture (Ports & Adapters)**

---

## High-Level Architecture

→ UI / Portals  
→ API Gateway  
→ Solution Facades  
→ Agents & Services  
→ Context Providers (MCP)  
→ AWS Platform Signals

---

## Solutions Implemented

### Platform Health Intelligence
- Correlates metrics, logs, and traces
- Explains platform degradation

### Deployment Impact Analysis
- Analyzes release blast radius
- Recommends rollback vs observe

### Event-Driven Operations Reasoning
- Correlates async events
- Reconstructs incident timelines

### Platform Topology Intelligence
- Maintains service dependency graphs
- Estimates blast radius

### Cost-Aware Optimization
- Correlates cost and performance
- Explains scaling trade-offs

### Developer Productivity Intelligence
- Analyzes CI/CD telemetry
- Identifies delivery bottlenecks

### Executive Narratives
- Converts signals into summaries
- Supports leadership decisions

---

## Repository Structure

```
enterprise-it-ops-intel-platform/
├── docs/
├── ui/
├── services/
│   └── solutions/
│       └── <solution-module>/
│           ├── dto/
│           ├── domain/
│           ├── ports/
│           ├── adapters/
│           ├── facade.py
│           └── api.py
├── infra/
├── config/
└── .github/
```

---

## DTO Strategy

- DTOs owned by solutions
- Minimal kernel protocol DTOs only
- No global DTO package

---

## Facade Pattern

Each solution exposes a single facade used by:
- LangGraph
- Step Functions
- APIs
- Event-driven workflows

---

## Agents & Workflows

- Agents are reusable and framework-agnostic
- Supported workflows:
  - LangGraph
  - Step Functions
  - Event-driven
  - Custom Python

---

## API Strategy

- Optional FastAPI / Flask adapters
- APIs call facades only
- DTO-based contracts

---

## Local Development

- Python 3.11+
- AWS profile-based credentials
- Local configs under /config/local

---

## Cloud Deployment

- IAM roles only (no static keys)
- Secrets via AWS Secrets Manager & KMS
- Environments: dev / qa / preprod / prod

---

## GitHub Workflow Strategy

- Manual promotion
- GitHub Environments for approvals
- No auto-promotion

---

## Technology Stack

Python, AWS Bedrock, FastAPI, LangGraph (optional), Step Functions,
DynamoDB, OpenSearch, S3, Redis, CloudWatch, IAM, KMS, Angular

---

## Purpose

This repository demonstrates real-world enterprise platform design using agentic AI responsibly and modularly.

---

## Solutions & Facades – Capability Matrix

| Solution / Facade Name | What Problem It Solves | Invocation Model (On‑Demand / Scheduled / Automatic) | Input Parameters (DTOs) | Output Parameters (DTOs) | Agents Involved | Agentic AI Tools | Orchestration Frameworks | LLM Usage (Config‑Driven) |
|-----------------------|-----------------------|-------------------------------------------------------|-------------------------|--------------------------|-----------------|------------------|--------------------------|---------------------------|
| **PlatformHealthFacade** | Explains platform degradation by correlating metrics, logs, and traces | On‑demand, Scheduled health checks, Alert‑triggered | Time window, service scope, metrics summary, error rates, latency percentiles, anomaly indicators | Health status, contributing services, probable causes, confidence score | Observability Agent, Decision Agent | Metrics retrieval, log summarization, trace correlation | LangGraph (primary), Step Functions (alternative) | Optional – used for reasoning & explanation |
| **DeploymentImpactFacade** | Determines whether deployments caused incidents and estimates blast radius | Automatic on deployment, On‑demand during incidents | Deployment ID, change metadata, affected services, pre/post metrics | Impact score, affected services, rollback vs observe recommendation | Deployment Analysis Agent, Topology Agent, Decision Agent | Deployment metadata tool, dependency graph analysis | Step Functions (primary), LangGraph (optional) | Optional – explanation & rationale |
| **EventDrivenOpsFacade** | Reconstructs timelines and causal chains from asynchronous platform events | Automatic (event‑driven) | Event payloads, timestamps, correlation IDs | Reconstructed timeline, causal chain, suspected origin | Event Correlation Agent | Event stream consumers (SQS / EventBridge / Kafka) | Event‑driven workflows (no LangGraph) | Minimal – summarization only |
| **TopologyIntelligenceFacade** | Provides service dependency and blast‑radius intelligence | On‑demand, Cached refresh | Service identifier, environment, dependency depth | Upstream/downstream dependencies, risk zones | Topology Agent | Service registry lookup, dependency graph traversal | Direct invocation (no workflow engine) | Optional – natural language explanation |
| **CostOptimizationFacade** | Identifies cost inefficiencies and explains cost/performance trade‑offs | Scheduled (daily/weekly), On‑demand | Cost snapshots, utilization metrics, traffic patterns | Optimization recommendations, estimated savings, risk trade‑offs | Cost Analysis Agent, Decision Agent | Cost analysis, utilization correlation | Step Functions (batch), LangGraph (optional) | Optional – trade‑off explanation |
| **ExecutiveNarrativeFacade** | Converts technical signals into executive‑level decision narratives | On‑demand, Post‑incident reporting | Incident summaries, decisions, supporting evidence | Executive summary, key risks, recommended actions | Narrative Agent | Multi‑source synthesis | Direct invocation, optional LangGraph | **Required** – selected from approved LLM list |

---

## LLM Strategy

| Aspect | Description |
|------|-------------|
| Supported Models | AWS Bedrock LLMs, Azure OpenAI, other enterprise‑approved models |
| Selection | Configuration‑driven per environment |
| Usage Policy | Optional for deterministic workflows; required only where narrative reasoning is needed |
| Security | No static secrets; IAM‑based access; prompts not persisted by default |

---

## Orchestration Strategy

| Orchestration Type | When Used |
|------------------|-----------|
| LangGraph | Interactive, reasoning‑heavy, multi‑signal workflows |
| AWS Step Functions | Deterministic, auditable, long‑running workflows |
| Event‑Driven (SQS / EventBridge) | Reactive, asynchronous processing |
| Custom Python | Lightweight, low‑latency execution paths |

---

## Deployment Model

| Aspect | Details |
|------|--------|
| Local Development | AWS named profiles, local config |
| Cloud Runtime | IAM roles (Lambda / IRSA for EKS) |
| Environments | dev, qa, preprod, prod |
| CI/CD | Manual GitHub workflows with approvals |
| Secrets | AWS Secrets Manager, KMS |

---

## Purpose

This repository demonstrates **enterprise‑grade platform architecture** and responsible use of
agentic AI, emphasizing modularity, governance, and long‑term evolvability.

---

