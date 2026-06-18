# AGENTS.md - xiigen-general-skills

This is an Apache-2.0 open-source release-candidate repository for portable
agent skills and project-adaptation guides.

## Read First

1. `README.md`
2. `index/TAXONOMY.md`
3. `adaptation/ADAPTATION-RUNBOOK.md`
4. `adaptation/adaptation-map.yaml`
5. `docs/review-checklist.md`

## Rules

1. Do not copy source project `AGENTS.md`, `CLAUDE.md`, internal contracts, evidence logs, generated bundles, or private paths into reusable guidance.
2. Keep layers separate: universal, architecture, stack, other policy.
3. Universal skills must not contain concrete stack commands, cloud commands, local paths, or XIIGen-only requirements.
4. Architecture guides must be templates with project inputs, adaptation questions, gates, and non-goals.
5. Stack guides must teach how to create target-project skills using the target project's commands.
6. `adaptation/adaptation-map.yaml` is the canonical source for adaptable artifacts.
7. Cursor, Claude, and Codex adapters must preserve the same meaning and differ only by delivery format.
8. Before finalizing changes, run the 10 checks in `docs/review-checklist.md`.
9. Public release readiness requires `docs/release-gates.md` to pass, including sanitizer review, provenance review, public contact setup, and legal review.

## Output Contract

When reporting work, include changed files, checks run, skipped items, blockers, and evidence.
