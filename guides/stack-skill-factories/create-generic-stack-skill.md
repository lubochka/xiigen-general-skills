# Create Generic Stack Skill

## Stack Scope
Use when the target stack is not covered by a prepared factory guide.

## Required Project Discovery
Stack name, source files, commands, safety policy, evidence artifacts, failure modes, owners.

## Skill Drafting Steps
1. Discover target stack facts from the target project.
2. Define safe commands and evidence.
3. Link universal safety, evidence, and failure triage skills.
4. Keep stack assumptions out of universal rules.

## Command Safety
All commands are target-project parameters until confirmed.

## Verification
Run a target-project smoke task:

1. Choose a safe command or evidence step from `project-profile.yaml`.
2. Cross-check the command against target CI files, package/build files, and local policy docs.
3. Confirm the generated skill activates for a relevant stack task.
4. Confirm it does not activate for an unrelated task.
5. Record target-project evidence in `ADAPTATION_REPORT.md`: profile field, CI/policy file checked, command used, and output or blocker.

## Anti-Patterns
Creating a stack skill from generic internet memory or another project's command set.
