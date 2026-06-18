# Taxonomy

## Universal

Portable rules for agent behavior that do not depend on one stack, cloud, runtime, or architecture.

Examples: authority chain, plan-before-execution, evidence-before-final, claim verification, no secrets, debugging discipline, test integrity, documentation hierarchy, session output contract.

## Architecture

Templates that ask project-specific architecture questions and produce project-specific rules. They must not force source-project, trainable-unit, tenant, or enterprise-launch assumptions.

## Stack

Guides for creating skills from the target project's real stack, commands, CI, deployment, and evidence rules. Commands are always taken from `project-profile.yaml` or the target repo.

## Other Policy

Source material that is important but not reusable as a skill: generated docs, raw evidence, reports, legal drafts, archives, training data, models, copied worktrees, and private paths.

## Evidence Rule

- Generic proof-before-final is universal.
- Plugin lifecycle evidence is architecture.
- AWS, Docker, UI, runtime, and build/test/deploy command evidence is stack.
- Logs, screenshots, generated reports, and raw bundles are other policy.
