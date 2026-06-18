# Plugin Runtime Evidence Template

## Intended Architecture
Use for plugin, extension, package, or runtime integration lifecycle evidence.

## Project Inputs
Plugin model, install/update flow, compatibility matrix, smoke-test expectations.

## Adaptation Questions
- What proves installed, running, compatible, and safe?
- Which failures block release?
- Which evidence is architecture-level versus stack-level?

## Template Rules
Define lifecycle states, compatibility gates, smoke-test evidence, and adapter references.

## Outputs
Plugin evidence contract, lifecycle states, smoke-test checklist.

## Review Gates
AWS, Docker, UI, and concrete runtime commands remain in stack guides.

## Non-Goals
Does not include install scripts, deployment scripts, or raw runtime logs.

