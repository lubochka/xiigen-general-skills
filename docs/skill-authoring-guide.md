# Skill Authoring Guide

Use this guide when adding a new reusable skill or adapting this repository for
a specific project.

## Universal Skill Checklist

Add a ready `SKILL.md` only when the behavior is independent of:

- programming language;
- framework;
- cloud provider;
- runtime;
- product architecture;
- internal project names;
- local commands or private configuration.

## Required Sections

Every universal skill should include:

- Purpose
- When to Use
- Inputs
- Steps
- Gates
- Evidence
- Anti-Patterns
- Related

Distribution copies in `agent-skills/`, `claude/skills/` and `codex/skills/`
also include frontmatter with `name` and `description`.

## Add A New Universal Skill

1. Create `skills/universal/<skill-name>/SKILL.md`.
2. Keep the skill concise and project-independent.
3. Add the skill to `index/SKILLS_INDEX.md`.
4. Add or update the map entry in `adaptation/adaptation-map.yaml`.
5. Regenerate compatibility packs.
6. Run `scripts/validate-map.ps1`.
7. Run `scripts/release-hygiene-scan.ps1`.

## Add Architecture Or Stack Material

If a rule depends on architecture, create a guide in `guides/architecture/`.
If it depends on a language, framework, cloud, CI, package manager or runtime,
create a factory guide in `guides/stack-skill-factories/`.

Do not turn those into ready universal skills.
