# Smart Skills Orchestration Template

## Intended Architecture
Use for projects that select skills, prompts, or workflows dynamically.

## Project Inputs
Skill catalog, activation rules, prompt suites, validation contracts, adapter targets.

## Adaptation Questions
- How is the right skill selected?
- Which prompts are private and which are examples?
- How is semantic drift detected across tools?
- What validation blocks release?

## Template Rules
Define selection matrix, prompt validation, adapter consistency, and review gates.

## Outputs
Skill-selection matrix, prompt validation guide, adapter drift checklist.

## Review Gates
No private prompts, hidden model assumptions, or tool-specific copies that drift from canonical mapping.

## Non-Goals
Does not force one agent runtime or orchestration engine.

