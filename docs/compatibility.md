# Compatibility

XIIGen AI Agent Skills is designed as a reusable skill pack for multiple AI
coding agent surfaces.

| Surface | Supported files | Intended use |
|---|---|---|
| Agent Skills-style tools | `agent-skills/<skill>/SKILL.md` | Cross-agent reusable skill folders |
| Claude | `claude/skills/<skill>/SKILL.md` | Claude-compatible project skills |
| Codex | `codex/skills/<skill>/SKILL.md` | Codex-compatible project skills |
| Cursor | `cursor/rules/*.mdc` | Cursor-native project rules |
| npm | `cli/xiigen-agent-skills.js` | Copy packs into a target project |
| VS Code/Open VSX | `vscode-extension/` | Marketplace wrapper scaffold |

## Canonical Source

The canonical reusable skills live in `skills/universal/`. Distribution folders
are generated compatibility copies. If a skill changes, update the canonical
skill first and regenerate the packs.

## Adapter Boundary

The same skill meaning should survive across Claude, Codex and Cursor. File
format can differ; behavior should not drift.

## Architecture And Stack Boundary

Architecture templates and stack-skill factories are not universal skills.
Adapt them with `adaptation/project-profile.template.yaml` and the runbook
before copying project-specific rules into a target project.
