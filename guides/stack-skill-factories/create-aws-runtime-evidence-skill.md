# Create AWS Runtime Evidence Skill

## Stack Scope
Use when a target project has AWS deployment, CI/CD, runtime readiness, or cloud evidence requirements.

## Required Project Discovery
Cloud provider, CI system, deploy commands, read-only verification commands, approval-required commands, blocked commands, accepted evidence artifacts.

## Skill Drafting Steps
1. Separate read-only evidence from deploy or mutation commands.
2. Keep credentials and account identifiers out of the skill.
3. Define evidence artifacts and redaction.
4. Link evidence to release gates, not approval.

## Command Safety
Deploy, destroy, credential, and infrastructure mutation commands require explicit target-project gates.

## Verification
Use read-only target-project commands or sanitized CI evidence.

## Anti-Patterns
Publishing raw AWS configs, account ids, private logs, or treating runtime evidence as approval.

