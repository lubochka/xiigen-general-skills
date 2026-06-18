---
name: debug-session
description: "Package debugging work so another agent or human can resume it. Use for longer debugging tasks or handoffs."
---

# Debug Session

## Purpose
Package debugging work so another agent or human can resume it.

## When to Use
Use for longer debugging tasks or handoffs.

## Inputs
Goal, environment, repro, observations, attempted fixes, blockers.

## Steps
1. State the debug goal.
2. Record repro steps and environment.
3. Track attempts and results.
4. End with conclusion, blocker, or next step.

## Gates
The session is understandable without hidden context.

## Evidence
Debug session notes, checked files, and command results.

## Anti-Patterns
Leaving only "it fails" without repro or observations.

## Related
`systematic-debugging`, `session-output-contract`
