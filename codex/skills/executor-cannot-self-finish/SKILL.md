---
name: executor-cannot-self-finish
description: "Separate execution from completion approval. Use when an agent both implements and reviews its own work."
---

# Executor Cannot Self-Finish

## Purpose
Separate execution from completion approval.

## When to Use
Use when an agent both implements and reviews its own work.

## Inputs
Plan, acceptance criteria, evidence, review owner or required gate.

## Steps
1. Complete the implementation.
2. Collect evidence.
3. Send work through the required review gate.
4. Mark blockers instead of self-approving.

## Gates
The executor does not declare final approval without the required gate.

## Evidence
Review records, acceptance matrix, or explicit user approval.

## Anti-Patterns
Treating "no errors seen" or "commit created" as approval.

## Related
`review-fix-loop`, `evidence-before-final`
