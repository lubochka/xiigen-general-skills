# Source Skill Family Ledger

This public ledger intentionally does not publish source file names, source
family IDs, exact source-family counts, source paths, source bodies, prompts,
logs, credentials, datasets, or evidence artifacts.

The private source audit classified all reviewed source material before it was
converted into this repository. Only sanitized coverage categories and target
actions are published here.

## Public Classification Summary

| Public bucket | Published action | Boundary rule |
|---|---|---|
| Existing universal behavior | Keep as ready `skills/universal/*/SKILL.md` only when project-independent | No stack commands, no architecture-specific contracts, no source product names |
| Planned universal behavior | Keep as backlog in `docs/missing-universal-and-adaptation-gap-plan.md` until implemented | Do not index as shipped until a real file exists and passes review |
| Architecture-dependent behavior | Convert to `guides/architecture/*-template.md` or future architecture-guide backlog | Templates must use project inputs, questions, gates, and non-goals |
| Stack-dependent behavior | Convert to `guides/stack-skill-factories/create-*-skill.md` or future stack-factory backlog | Commands must come from the target project profile, CI, or docs |
| Reference-only material | Keep as source policy context only | Do not copy raw source examples or private project facts |
| Excluded material | Exclude from publication | Exclude credentials, raw prompts, generated bundles, evidence logs, copied worktrees, raw datasets, model artifacts, and source history dumps |

## Public Coverage Verdict

- All source-derived material used for this repository was classified before
  publication.
- No exact source-family IDs or source inventory counts are published.
- No source paths, credential filenames, archive filenames, raw prompts, logs,
  datasets, generated evidence, or private project artifacts are published.
- Future universal backlog remains separate from shipped universal skills.

## Where To Look

- Current shipped universal skills: `index/SKILLS_INDEX.md`
- Current architecture and stack guides: `index/GUIDES_INDEX.md`
- Sanitized source coverage categories: `index/SOURCE_COVERAGE.md`
- Future universal/architecture/stack backlog: `docs/missing-universal-and-adaptation-gap-plan.md`
- Release hygiene command: `scripts/release-hygiene-scan.ps1`
