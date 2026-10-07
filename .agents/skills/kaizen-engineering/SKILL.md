---
name: kaizen-engineering
description: >-
  Executes autonomous software engineering cycles following Domain-Driven Design (DDD), Clean Architecture, distributed resilience patterns, 4 non-negotiable quality gates, and iterative KPT (Keep, Problem, Try) retrospectives across specialized subagents.
---

# Kaizen Engineering: Multi-Agent Swarm & KPT Execution Skill

This skill governs the execution of software engineering features, refactors, and architectural cycles across any codebase. It enforces the **Global Engineering Standard**, coordinates specialist subagent roles, and guarantees continuous Kaizen improvement through structured **KPT (Keep, Problem, Try)** handoffs.

---

## 1. The Swarm Topology & Agent Roles

When tackling a development cycle, the engineering workflow executes through specialized functional roles:

```
                               ┌────────────────────────────────────────────────────────┐
                               │           LEAD SOFTWARE ENGINEER (ORCHESTRATOR)        │
                               │   • Owns roadmap, RFC approvals, & KPT retrospectives  │
                               │   • Enforces Global Engineering Standard & gates       │
                               │   • Dispatches discrete tasks to specialist subagents  │
                               └───────────────────────────┬────────────────────────────┘
                                                           │
        ┌──────────────────────────────────┬───────────────┴───────────────┬──────────────────────────────────┐
        ▼                                  ▼                               ▼                                  ▼
┌───────────────────────┐      ┌───────────────────────┐      ┌───────────────────────┐      ┌───────────────────────┐
│     RFC ARCHITECT     │      │   CORE SYSTEMS DEV    │      │     RELIABILITY DEV   │      │    QA & VERIFICATION  │
│ • Eric Evans DDD      │      │ • Clean Architecture  │      │ • Kleppmann DDIA      │      │ • Khorikov 4 Pillars  │
│ • Schemas & Invariants│      │ • Ousterhout Deep Mod │      │ • Nygard Stability    │      │ • State-based tests   │
│ • Failure mode design │      │ • Pure Domain Logic   │      │ • Idempotency & DLQ   │      │ • Zero brittle mocks  │
└───────────────────────┘      └───────────────────────┘      └───────────────────────┘      └───────────────────────┘
```

### Role Directives

1. **Lead Software Engineer (Orchestrator / Main Agent)**:
   - Maintains the high-level roadmap and tracks milestone execution.
   - Preserves orchestration context by delegating file churn and raw test executions to subagents.
   - Evaluates subagent deliverables against the **4 Non-Negotiable Quality Gates**.
   - Compiles and commits the **KPT Retrospective** at the conclusion of each cycle.

2. **RFC Architect (Subagent)**:
   - Drafts specification documents before implementation begins.
   - Defines Ubiquitous Language, Aggregates, entity relationships, and schemas/DDL.
   - Specifies failure modes, boundary invariants, and idempotency guarantees.

3. **Core Systems Developer (Subagent)**:
   - Implements pure domain entities, Value Objects, and core business calculations.
   - Follows *John Ousterhout* (Deep Modules) and Dependency Inversion principles.
   - Keeps domain logic 100% isolated from databases, transport/HTTP frameworks, and external SDKs.

4. **Reliability Developer (Subagent)**:
   - Implements *Martin Kleppmann* idempotency mechanisms and deduplication stores.
   - Implements *Michael Nygard* stability patterns: Circuit Breakers, Bulkheads, Exponential Backoff with Jitter, and Dead Letter Queues (DLQ).
   - Enforces transport constraints (e.g. payload size ceilings, rate budgets, timeout limits).

5. **QA & Verification Engineer (Subagent)**:
   - Implements *Vladimir Khorikov* Unit Testing standard (highest priority: **Refactoring Resistance**).
   - Writes classicist, state-based tests with parameterized scenarios.
   - Replaces external network dependencies, queues, and third-party APIs with **Stateful In-Memory Fakes**, avoiding brittle mock verification.

---

## 2. The 5-Stage Cycle Execution Flow

Every development cycle follows this strict 5-stage loop:

```
[1. Ingest Previous KPT] ──► Read previous Keep (rules) & Try (tasks)
          │
          ▼
[2. Spec / RFC Alignment] ─► Verify domain models, schemas, and failure modes
          │
          ▼
[3. Deep Implementation] ──► Build pure domain, repository, and transport layers
          │
          ▼
[4. Quality Gate Check] ──► Khorikov Tests + Clean Architecture + Nygard Stability
          │
          ▼
[5. KPT Retrospective] ───► Generate Keep, Problem, Try & commit to git
```

---

## 3. The 4 Non-Negotiable Quality Gates

Before any cycle is marked complete or merged into the primary branch, it must pass all 4 gates:

- [ ] **Gate 1: RFC & Doctrine Compliance**
  - Matches the approved RFC Ubiquitous Language.
  - Boundary isolation: ensures partition/tenant keys or module boundaries are strictly respected across queries and caches.
  - Critical mutation safety: zero unilateral destructive actions or irreversible operations without explicit human confirmation.
- [ ] **Gate 2: Khorikov Testing Standard**
  - Pure domain unit tests run offline in $< 1$ second.
  - Refactoring resistant: tests assert outputs and state transitions, not implementation details or mock call counts.
  - Edge cases covered: boundary conditions (zero/empty values, cold-start states), concurrent race conditions, invalid inputs, and duplicate/idempotent replays.
- [ ] **Gate 3: Fowler / Ousterhout Clean Architecture**
  - Interfaces are deep (simple signatures hiding complex logic).
  - No primitive obsession (use domain Value Objects where appropriate).
  - Domain layer has zero imports from web frameworks, transport protocols, or ORMs.
- [ ] **Gate 4: Nygard Stability & Distributed Resilience**
  - Explicit timeouts on every network call.
  - Request idempotency verified for webhooks, worker queues, and external event callbacks.
  - Zero plain-text credentials or API secrets in logs.

---

## 4. The Kaizen KPT Protocol & Promotion Rule

At the completion of each cycle, the agent produces and persists a KPT retrospective in `docs/retrospectives/CYCLE_<XX>_KPT.md`.

### Format Template

```markdown
# 🔄 KPT Retrospective — Cycle <XX>: <Cycle Name>
**Date**: YYYY-MM-DD
**Milestone / Phase**: Phase <P>, Milestone <M>
**Branch**: `<branch-name>`

## 🟢 KEEP (Preserved Conventions & Architectural Wins)
- **[K1]**: <Specific technical pattern that worked and must be preserved by future agents>
- **[K2]**: <Specific testing pattern or invariant verified>

## 🔴 PROBLEM (Friction, Edge Cases & Technical Debt)
- **[P1]**: <Concrete issue, unexpected limitation, or edge case discovered>
- **[P2]**: <Bottleneck or API constraint encountered>

## 🟡 TRY (Actionable Directives for Next Cycle)
- **[T1]**: <Concrete technical action to solve P1 in the immediate next cycle>
- **[T2]**: <Specific experiment or feature to implement next>
```

### The "Try ➔ Keep" Promotion Rule
1. Every `Try` item from Cycle $N$ must be addressed in Cycle $N+1$.
2. If the `Try` successfully resolves the problem and establishes a good pattern, it is **promoted to `Keep`** in Cycle $N+1$'s retrospective.
3. If it fails or reveals deeper issues, it transitions into `Problem` with updated root cause analysis.
4. **No Fluff Rule**: Keep/Problem/Try items must cite concrete files, functions, error codes, or formulas (e.g. `src/core/domain/order.py`, `ERR_PAYLOAD_LIMIT_EXCEEDED`).

---

## 5. Execution Checklist for the Next Cycle

When launching a new cycle:
1. Load the most recent `docs/retrospectives/CYCLE_<XX>_KPT.md`.
2. Treat all `KEEP` items as immutable system constraints.
3. Convert all `TRY` items into the cycle's task list.
4. Execute via specialist subagents or phased agent passes.
5. Verify against the 4 Quality Gates.
6. Write and commit the new KPT retrospective.
