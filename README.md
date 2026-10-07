# ⚡ Kaizen Engineering Skill

> **Autonomous Multi-Agent Swarm Orchestration & Compounding KPT Retrospective Engine for AI Software Development.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Antigravity Skill](https://img.shields.io/badge/Antigravity-Skill%20Ready-purple.svg)](https://antigravity.google)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20%7C%20DDD%20%7C%20Nygard-green.svg)](#3-the-4-non-negotiable-quality-gates)
[![Quality Protocol](https://img.shields.io/badge/Loop-Kaizen%20KPT-orange.svg)](#4-the-kaizen-kpt-protocol--promotion-rule)

---

## 📖 Overview

Standard AI coding assistants tend to drift over long conversations: context windows get polluted by raw logs, architecture degrades, brittle mocks replace real tests, and lessons learned in one task are forgotten in the next.

**Kaizen Engineering** transforms single-prompt AI assistants into a disciplined **5-role autonomous engineering department**. It enforces Domain-Driven Design (DDD), Clean Architecture, distributed systems resilience, and continuous self-improvement through structured **KPT (Keep, Problem, Try)** retrospectives.

---

## 🏛️ 1. Swarm Topology & Subagent Roles

Instead of one monolithic prompt attempting everything, the workflow dispatches focused responsibilities across specialized agent roles:

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

| Role | Core Directive & Theoretical Foundation |
| :--- | :--- |
| **Lead Engineer (Orchestrator)** | Maintains the high-level roadmap, manages subagent lifecycles, avoids context pollution from raw logs, and synthesizes the cycle retrospective. |
| **RFC Architect** | **Eric Evans (DDD)**: Defines Ubiquitous Language, Aggregate Roots, SQL DDL, mathematical invariants, and failure modes before code is written. |
| **Core Systems Dev** | **John Ousterhout (Deep Modules) & Clean Architecture**: Implements pure domain entities and business rules with zero dependencies on frameworks, databases, or ORMs. |
| **Reliability Dev** | **Martin Kleppmann (DDIA) & Michael Nygard (Release It!)**: Builds idempotency tables, distributed leases, circuit breakers, backoff with jitter, and dead-letter queues (DLQ). |
| **QA & Verification Engineer** | **Vladimir Khorikov (Unit Testing)**: Writes classical, state-based tests that execute in $< 1$s. Replaces external APIs with **Stateful In-Memory Fakes** instead of brittle mocks. |

---

## 🔄 2. The 5-Stage Cycle Loop

Every engineering cycle moves through a deterministic pipeline:

```
[1. Ingest Previous KPT] ──► Read previous Keep (laws) & Try (mandatory tasks)
          │
          ▼
[2. Spec / RFC Alignment] ─► Verify domain models, schemas, and failure budgets
          │
          ▼
[3. Deep Implementation] ──► Build pure domain, repository, and transport layers
          │
          ▼
[4. Quality Gate Check] ──► Khorikov Tests + Clean Architecture + Nygard Resilience
          │
          ▼
[5. KPT Retrospective] ───► Commit Keep, Problem, Try & advance milestone
```

---

## 🛡️ 3. The 4 Non-Negotiable Quality Gates

Before any milestone is completed or merged, it must satisfy all 4 gates:

1. **Gate 1: RFC & Doctrine Compliance**
   - Strictly conforms to approved RFC Ubiquitous Language and schemas.
   - Enforces data isolation and bounded context partitions.
   - **Critical Mutation Safety**: Zero unilateral destructive operations (batch drops, funds movements, secret rotations) without human verification.
2. **Gate 2: Khorikov Testing Standard**
   - Pure domain unit tests run offline in **$< 1$ second**.
   - **Refactoring Resistance**: Tests assert outputs and observable state transitions, never implementation details or mock invocation counts.
   - Covers edge cases: zero/empty boundaries, cold-start states, race conditions, and duplicate replay payloads.
3. **Gate 3: Fowler / Ousterhout Clean Architecture**
   - Deep interfaces: simple function signatures concealing rich logic.
   - Zero primitive obsession (e.g. encapsulated `Money`, `Email`, `TenantId` Value Objects).
   - Domain layer has **zero imports** from web frameworks or ORMs.
4. **Gate 4: Nygard Stability & Distributed Resilience**
   - Explicit timeouts configured on all network and external operations.
   - Idempotency verified for all external webhooks, worker queues, and event callbacks.
   - Zero plain-text credentials or API secrets in logs.

---

## 📈 4. The Kaizen KPT Engine (Try ➔ Keep)

Continuous improvement is codified through structured retrospectives stored in `docs/retrospectives/CYCLE_<XX>_KPT.md`:

```
CYCLE N                       CYCLE N+1                      CYCLE N+2
┌────────────────┐            ┌────────────────┐             ┌────────────────┐
│ TRY: [T1] Add  │ ─────────► │ Implement [T1] │ ──────────► │ KEEP: [K3]     │
│ distributed    │            │ Verify in test │             │ Distributed    │
│ lease to queue │            │                │             │ lease is now   │
└────────────────┘            └────────────────┘             │ standard law   │
                                                             └────────────────┘
```

1. **Mandatory Input**: Every `Try` from Cycle $N$ is required input for Cycle $N+1$.
2. **Promotion to Law**: When a `Try` successfully resolves a problem, it is promoted to `Keep` in the subsequent cycle and becomes an immutable system invariant.
3. **No Fluff Rule**: Keep/Problem/Try entries must cite concrete files, functions, error codes, or formulas (e.g. `src/core/domain/order.py`, `ERR_PAYLOAD_LIMIT_EXCEEDED`).

---

## 🚀 Installation & Setup

### For Google Antigravity

#### Option 1: Global Installation (Available across all workspaces)
Clone or run the install script to make `kaizen-engineering` available everywhere on your machine:

```bash
git clone https://github.com/techuy06/kaizen-engineering-skill.git /tmp/kaizen-skill
cd /tmp/kaizen-skill
./scripts/install.sh --global
```
*Installs to `~/.gemini/config/skills/kaizen-engineering/`.*

#### Option 2: Project-Level Installation (Commit to your repository)
If you want to share the skill with teammates via your project's version control:

```bash
# From within your target project repository:
mkdir -p .agents/skills/kaizen-engineering
curl -sSL https://raw.githubusercontent.com/techuy06/kaizen-engineering-skill/main/SKILL.md -o .agents/skills/kaizen-engineering/SKILL.md
curl -sSL https://raw.githubusercontent.com/techuy06/kaizen-engineering-skill/main/resources/KPT_TEMPLATE.md -o .agents/skills/kaizen-engineering/resources/KPT_TEMPLATE.md
git add .agents/skills/kaizen-engineering
git commit -m "chore: install kaizen-engineering agent skill"
```

---

### For Other AI Agents (Cursor, Claude Code, Windsurf, Copilot)

Because `SKILL.md` is standard Markdown and follows Domain-Driven Design and Clean Architecture, you can adopt it anywhere:

- **Cursor**: Copy `SKILL.md` into `.cursorrules` or `.cursor/rules/kaizen-engineering.mdc`.
- **Claude Code**: Add `SKILL.md` to your `CLAUDE.md` or `.claude/skills/`.
- **GitHub Copilot**: Link `SKILL.md` inside `.github/copilot-instructions.md`.

---

## 💻 How to Use

Once installed, trigger the skill in your AI assistant:

### 1. Slash Command
```text
/kaizen-engineering
```

### 2. Conversational Trigger
```text
"Run the next development cycle using the Kaizen Engineering workflow. 
Check our latest KPT retrospective in docs/retrospectives/ and begin Phase 1."
```

### 3. What the Agent Will Do
1. Inspect the latest KPT retrospective in `docs/retrospectives/` and extract `KEEP` invariants and `TRY` items.
2. Delegate the technical specification to the **RFC Architect**.
3. Implement clean domain models with the **Core Systems Developer**.
4. Apply resilience and idempotency patterns with the **Reliability Developer**.
5. Validate against the **4 Quality Gates** with the **QA & Verification Engineer**.
6. Generate and commit the new `docs/retrospectives/CYCLE_<XX>_KPT.md`.

---

## 📂 Repository Structure

```text
kaizen-engineering-skill/
├── SKILL.md                          # Primary agent skill specification
├── resources/
│   └── KPT_TEMPLATE.md               # Standard template for cycle retrospectives
├── examples/
│   ├── RFC_EXAMPLE.md                # Example Domain-Driven RFC
│   └── CYCLE_01_KPT_EXAMPLE.md       # Example retrospective with Try ➔ Keep promotion
├── scripts/
│   └── install.sh                    # Helper script for global/project installation
├── LICENSE                           # MIT License
└── README.md                         # Documentation and guide
```

---

## 🤝 Contributing

Contributions, enhancements, and suggestions are welcome!
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/new-quality-gate`)
3. Commit your changes (`git commit -m 'feat: add database migration safety gate'`)
4. Push to the branch (`git push origin feature/new-quality-gate`)
5. Open a Pull Request

---

## 📄 License

Distributed under the [MIT License](LICENSE). Free for individual and commercial use.
