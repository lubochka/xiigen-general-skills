# Cursor Adaptation

Use `adaptation/ADAPTATION-RUNBOOK.md` and `adaptation/adaptation-map.yaml` as canonical input.

## Output Layout

- `.cursor/rules/*.mdc` for persistent or path-scoped rules.
- Optional `AGENTS.md` for shared repository entry instructions.

## Activation Mapping

- `always`: render as an always-applied `.mdc` rule or a short `AGENTS.md` startup section.
- `explicit_skill`: render as a `.mdc` rule with description and manual invocation guidance.
- `path_scoped`: render as a `.mdc` rule with globs.
- `manual`: render as documentation referenced by the adaptation report.

## Rules

1. Every generated rule must reference the `adaptation-map.yaml` entry id and canonical version.
2. Long procedures should stay in generated skills or docs, not always-on rules.
3. Cursor output must preserve purpose, gates, anti-patterns, and evidence requirements.
