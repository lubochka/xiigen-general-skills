---
name: e2e-test-matrix
description: "Design end-to-end coverage across critical paths. Use for release readiness, user workflows, UI/API flows, and adapter validation."
---

# E2E Test Matrix

## Purpose
Design end-to-end coverage across critical paths.

## When to Use
Use for release readiness, user workflows, UI/API flows, and adapter validation.

## Inputs
Journeys, roles, environments, risk areas, target project commands.

## Steps
1. List critical journeys.
2. Cross journeys with roles, environments, and risk categories.
3. Pick minimal representative coverage.
4. Mark skipped matrix cells with reason.

## Gates
Critical paths are covered beyond a single happy path.

## Evidence
Matrix, smoke-test output, or skipped-cell rationale.

## Anti-Patterns
Calling one happy path complete E2E readiness.

## Related
`user-journey-testing`, `integration-testing`
