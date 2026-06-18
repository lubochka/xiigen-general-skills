---
name: documentation-sync
description: "Keep documentation aligned with behavior. Use when changing workflows, commands, APIs, examples, or user-facing behavior."
---

# Documentation Sync

## Purpose
Keep documentation aligned with behavior.

## When to Use
Use when changing workflows, commands, APIs, examples, or user-facing behavior.

## Inputs
Changed files, affected docs, source-of-truth hierarchy, examples.

## Steps
1. Identify impacted docs.
2. Update only relevant sections.
3. Check links and instructions.
4. Mark generated docs separately.

## Gates
Docs do not contradict current behavior or source-of-truth docs.

## Evidence
Updated doc paths and validation notes.

## Anti-Patterns
Documenting intended behavior that was not implemented.

## Related
`document-hierarchy`, `output-readability-gate`
