# XIIGen AI Agent Skills - reusable Claude, Codex, Cursor and AI coding agent skills

Open-source AI agent skills for safer Claude, Codex, Cursor and AI coding
workflows. XIIGen AI Agent Skills gives coding agents reusable planning,
review, execution-gate, testing, documentation, and no-false-completion
workflows that can be adapted to real projects.

[![License: Apache-2.0](https://img.shields.io/badge/License-Apache--2.0-blue.svg)](LICENSE)
[![Skills](https://img.shields.io/badge/AI%20agent%20skills-Claude%20%7C%20Codex%20%7C%20Cursor-green.svg)](docs/compatibility.md)
[![Safety](https://img.shields.io/badge/safety-no%20secrets%20%7C%20target%20commands-orange.svg)](docs/safety.md)

## What This Is

XIIGen AI Agent Skills is a reusable skill pack for AI coding assistants:

- **Agent Skills-style folders** in `agent-skills/`.
- **Claude-compatible skills** in `claude/skills/`.
- **Codex-compatible skills** in `codex/skills/`.
- **Cursor rules** in `cursor/rules/*.mdc`.
- **Canonical universal skills** in `skills/universal/`.
- **Architecture templates** in `guides/architecture/`.
- **Stack-skill factory guides** in `guides/stack-skill-factories/`.
- **Adaptation map and runbook** for generating target-project rules.
- **npm and VS Code/Open VSX scaffolds** for future distribution.

The ready-to-use `SKILL.md` files are universal-only. Architecture-dependent
and stack-dependent material stays as templates or factory guidance that must be
adapted from the target project.

## Searchable Use Cases

- Claude Code skills for planning, review, testing and safer completion.
- Codex skills for project-rule loading, execution gates and evidence checks.
- Cursor rules for AI coding workflows and no-false-completion behavior.
- Agent Skills-compatible folders for cross-agent reuse.
- AI coding agent review skills, debugging skills and documentation sync skills.
- MCP-compatible guidance skills without pretending to be an MCP server.

## Quick Install From A Clone

```bash
node cli/xiigen-agent-skills.js init
node cli/xiigen-agent-skills.js add cursor-rules
node cli/xiigen-agent-skills.js add claude-skills
node cli/xiigen-agent-skills.js add codex-skills
```

After npm publication, the same flow is intended to work as:

```bash
npx @xiigen/agent-skills init
npx @xiigen/agent-skills add planning
npx @xiigen/agent-skills add cursor-rules
```

## Install Manually

| Target | Copy from | Copy to |
|---|---|---|
| Agent Skills-style tools | `agent-skills/` | target project `agent-skills/` |
| Claude | `claude/skills/` | target project `.claude/skills/` |
| Codex | `codex/skills/` | target project `.agents/skills/` |
| Cursor | `cursor/rules/*.mdc` | target project `.cursor/rules/` |

Review copied files before committing them to a target project.

## Adapt The Full Kit

1. Copy `adaptation/project-profile.template.yaml` into the target project as
   `project-profile.yaml`.
2. Fill stack, architecture, commands, CI, project rules, forbidden actions and
   evidence expectations.
3. Read `adaptation/ADAPTATION-RUNBOOK.md`.
4. Run the render script or ask Claude, Codex or Cursor to follow the runbook.
5. Review `ADAPTATION_REPORT.md`, selected mappings, blockers and smoke tests.

The render script produces neutral adapted artifacts first. Tool-specific
Claude, Codex and Cursor files are created by following the selected adapter
instructions after review.

## Repository Map

- `skills/universal/`: canonical universal skill source.
- `agent-skills/`: Agent Skills-style distribution copy.
- `claude/`: Claude install instructions and skill copy.
- `codex/`: Codex install instructions and skill copy.
- `cursor/`: Cursor install instructions and `.mdc` rules pack.
- `guides/architecture/`: architecture templates for target-project adaptation.
- `guides/stack-skill-factories/`: stack-specific skill factory guides.
- `docs/compatibility.md`: Claude, Codex, Cursor and Agent Skills compatibility.
- `docs/skill-authoring-guide.md`: how to add or adapt skills safely.
- `docs/safety.md`: safety boundary for public and target-project use.
- `docs/mcp-compatible-guidance.md`: MCP-compatible guidance without server claims.
- `examples/before-after/`: prompt-only vs skill-based workflow examples.
- `launch/`: Show HN, Reddit, Dev.to/Hashnode and awesome-list drafts.

## Key Skills

- `authority-chain`: resolve conflicting instructions.
- `project-rules-first`: load target project rules before acting.
- `plan-before-execution`: plan before risky or multi-file work.
- `evidence-before-final`: require proof before completion claims.
- `executor-cannot-self-finish`: separate execution from approval.
- `no-secrets`: keep secrets, private prompts and raw evidence out.
- `code-execution`: run commands intentionally and safely.
- `test-integrity`: keep tests meaningful.
- `generated-code-review`: review generated code before trusting it.
- `goal-delivery-completeness`: verify delivered work against the goal.

## Boundary Rule

Universal skills must not include project-specific stack commands, private
paths, raw logs, internal prompts, copied worktrees, generated bundles, customer
data, model artifacts or source-specific architecture contracts.

Architecture and stack items are guidance for adaptation. Their commands and
constraints must come from the target project profile, CI, docs and maintainers.

## Safety And Responsibility

These skills and templates are developer-assistance materials. They do not
guarantee correct AI outputs, secure code, complete plans or production-ready
results. Users remain responsible for review, testing, validation and approval.

This repository provides general software-development guidance only. It is not
legal, financial, medical, safety, security certification, compliance or
professional advice.

## Release Readiness

This repository uses Apache-2.0. Public release readiness is tracked in
`docs/release-gates.md` and includes sanitizer review, provenance review,
secret/path/archive scans, examples review, git history/export review, security
contact setup and legal review.
