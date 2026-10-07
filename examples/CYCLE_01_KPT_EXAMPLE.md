# 🔄 KPT Retrospective — Cycle 01: Core Domain Entities & Idempotency Boundary
**Date**: 2026-10-07
**Milestone / Phase**: Phase 1, Milestone 1
**Branch**: `feature/cycle-01-core-domain`

## 🟢 KEEP (Preserved Conventions & Architectural Wins)
- **[K1] Pure Domain Isolation**: Domain entities in `src/core/domain/` contain zero dependencies on ORMs or HTTP frameworks (`fastapi`, `flask`). Tests execute offline in < 0.2s.
- **[K2] Invariant Defense via Value Objects**: All currency calculations use the `Money(amount, currency)` Value Object, preventing floating-point drift and invalid negative amounts at creation.
- **[K3] Khorikov State Verification**: Unit tests assert final state mutations instead of spying on mock interaction counts, ensuring zero brittle refactor breakage.

## 🔴 PROBLEM (Friction, Edge Cases & Technical Debt)
- **[P1] Unhandled In-Flight Duplicate Requests**: When identical payloads arrive concurrently within 50ms, both pass initial check before the database unique constraint raises an unhandled database driver exception.
- **[P2] Ambiguous Error Payloads**: Webhook error responses returned raw internal exception strings instead of standardized RFC 7807 problem details.

## 🟡 TRY (Actionable Directives for Next Cycle)
- **[T1] Kleppmann Distributed Deduplication**: Introduce an explicit atomic idempotency reserve step with a 15-minute lease and unique key index before processing (`src/core/reliability/idempotency.py`).
- **[T2] RFC 7807 Problem Detail Middleware**: Standardize all HTTP/webhook error bodies with machine-readable error codes and status metadata.
