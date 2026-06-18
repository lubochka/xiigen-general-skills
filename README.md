# XIIGen General Skills

XIIGen General Skills is an open-source collection of reusable agent skills,
architecture templates, adaptation guides, and review checklists for configuring
AI coding assistants such as Claude, Cursor, and Codex.

Licensed under the Apache License 2.0.

This repository is not a copy of one project's `AGENTS.md`, `CLAUDE.md`, internal contracts, generated evidence, or stack commands. It is a reusable kit for creating project-specific rules and skills for Cursor, Claude, and Codex.

## What This Contains

- `skills/universal/`: reusable skills that are not tied to a specific stack or architecture.
- `guides/architecture/`: architecture templates that must be adapted to a target project.
- `guides/stack-skill-factories/`: guides for creating stack-specific skills from the target project's real commands and constraints.
- `guides/other-policies/`: policies for evidence, generated docs, archived plans, legal/content drafts, and source material.
- `adaptation/adaptation-map.yaml`: the canonical map for adapting skills and guides.
- `adaptation/ADAPTATION-RUNBOOK.md`: the human-readable workflow to run with Cursor, Claude, or Codex.
- `adapters/`: thin instructions for each agent surface.
- `examples/`: sanitized example adaptation profiles and reports.
- `docs/`: taxonomy, source boundary, release gates, review checklist, and versioning.

## Decision Path

- Need only general agent discipline: start with `skills/universal/` and `index/SKILLS_INDEX.md`.
- Need architecture guidance: start with `guides/architecture/` and `adaptation/project-profile.template.yaml`.
- Need .NET, AWS, Docker, UI, runtime, or command rules: start with `guides/stack-skill-factories/`.
- Need to adapt the full kit into another project: run `adaptation/ADAPTATION-RUNBOOK.md` with `adaptation/adaptation-map.yaml`.
- Need the next source-derived expansion plan: read `docs/missing-universal-and-adaptation-gap-plan.md`.
- Need the safe per-family source ledger for that plan: read `index/SOURCE_SKILL_FAMILY_LEDGER.md`.

## Boundary Rule

Ready-to-use `SKILL.md` files in this repository are universal-only. Architecture-dependent material belongs in `guides/architecture/`; stack-dependent material belongs in `guides/stack-skill-factories/` and must be adapted from the target project's own commands, CI, and rules.

## Quick Start

1. Copy `adaptation/project-profile.template.yaml` into the target project as `project-profile.yaml`.
2. Fill stack, architecture, commands, CI, project rules, forbidden actions, and evidence expectations.
3. Open `adaptation/ADAPTATION-RUNBOOK.md`.
4. Give the runbook and `adaptation/adaptation-map.yaml` to Cursor, Claude, or Codex.
5. Review the generated `ADAPTATION_REPORT.md` and run the smoke tests.

Expected output from the render script: neutral adapted artifacts, selected mappings,
an adaptation report, skipped entries, blockers, and smoke-test instructions.
Project-specific Cursor, Claude, or Codex files are then created by following
the selected adapter instructions.

## Tool Outputs

- Cursor: `.cursor/rules/*.mdc`, plus optional `AGENTS.md`.
- Claude: `CLAUDE.md` and `.claude/skills/<skill-name>/SKILL.md`.
- Codex: `AGENTS.md` and `.agents/skills/<skill-name>/SKILL.md`.

All tool outputs must reference the same `adaptation-map.yaml` entry id and canonical version. The delivery format can differ; the meaning must not drift.

Tool outputs may include project-specific skills created during adaptation. Those generated skills belong to the target project; they are not ready-made universal skills shipped by this repository.

## Common Failures

- Placeholders were not resolved before rendering.
- Build/test/deploy commands were copied from a source project instead of the target project.
- A stack-specific command leaked into a universal skill.
- Architecture templates still contain mandatory XIIGen, tenant, or trainable-unit names instead of placeholders.
- Generated evidence, private prompts, copied worktrees, or local absolute paths were treated as reusable skills.

## Safety and Responsibility

These skills and templates are developer-assistance materials. They do not
guarantee correct AI outputs, secure code, complete plans, or production-ready
results. Users remain responsible for reviewing, testing, validating, and
approving all outputs before use.

## Not Legal, Security, Medical, Financial, or Professional Advice

This repository provides general software-development guidance only. It is not
legal, financial, medical, safety, security certification, compliance, or
professional advice.

## Release Readiness

This repository uses Apache-2.0, but public release readiness still depends on
`docs/release-gates.md`: sanitizer review, provenance review, secret/path/archive
scans, examples review, git history/export review, security contact setup, and
legal review.
