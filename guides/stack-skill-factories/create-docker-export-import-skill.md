# Create Docker Export / Import Skill

## Stack Scope
Use when the target project uses Docker Compose, container packaging, export packages, import flows, or install bundles.

## Required Project Discovery
Compose files, image names, build commands, smoke commands, import/export paths, artifact policy, cleanup rules.

## Skill Drafting Steps
1. Identify target container lifecycle.
2. Define safe build and smoke commands.
3. Define export/import evidence.
4. Exclude raw packages and large bundles from reusable guidance.

## Command Safety
Cleanup, volume deletion, registry push, and publish commands require explicit gates.

## Verification
Use target smoke commands and sanitized package metadata.

## Anti-Patterns
Copying one project's compose files, image names, paths, or export package layout as universal rules.

