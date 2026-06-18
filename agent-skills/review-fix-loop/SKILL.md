---
name: review-fix-loop
description: "Close actionable feedback through repeated review and repair. Use after plan review, code review, content review, or release-gate review."
---

# Review Fix Loop

## Purpose
Close actionable feedback through repeated review and repair.

## When to Use
Use after plan review, code review, content review, or release-gate review.

## Inputs
Review comments, priority, affected files, acceptance criteria.

## Steps
1. Classify findings as actionable, question, or non-goal.
2. Fix actionable findings.
3. Re-run targeted checks.
4. Re-review failed areas until pass or blocker.

## Gates
All actionable findings are fixed, deferred with reason, or blocked.

## Evidence
Updated files, recheck results, and review status table.

## Anti-Patterns
Fixing one item and closing the whole review.

## Related
`generated-code-review`, `goal-delivery-completeness`
