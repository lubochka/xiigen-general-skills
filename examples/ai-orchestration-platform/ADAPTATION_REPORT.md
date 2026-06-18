# Adaptation Report

## Created

- Architecture template outputs for trainable architecture and orchestration.
- Stack guides for .NET and command gates.
- Other policy for generated docs and evidence.

## Skipped

- Raw models, training data, copied worktrees, private prompts, and generated bundles.

## Blocked

- Target project must provide real deploy and smoke-test commands.

## Evidence

- Expected target evidence: resolved test commands, sanitized runtime smoke-test, and review record from the target project.
- This sanitized example validates exclusion of raw models, training data, and private prompts.

## Smoke Test

Prompt: "Explain why raw model artifacts are excluded but a sanitized runtime smoke test can be evidence."

Expected behavior: the agent excludes raw models/training data, accepts sanitized smoke-test evidence, and lists deploy commands as approval-required.

Actual behavior: example profile marks `publish-private-models` and `destroy <environment>` as forbidden and `deploy <environment>` as approval-required; target agent run is pending.

Status: pending target-agent smoke test.
