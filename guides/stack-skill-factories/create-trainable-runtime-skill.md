# Create Trainable Runtime Skill

## Stack Scope
Use when the target project implements trainable runtime primitives, model operations, tokenizers, training loops, or custom ML/runtime behavior.

## Required Project Discovery
Runtime language, model artifact policy, training commands, allowed frameworks, forbidden frameworks, verification commands, artifact retention.

## Skill Drafting Steps
1. Separate architecture lifecycle from runtime implementation.
2. Define allowed model/training artifacts.
3. Define verification commands from the target project.
4. Require redaction for models, datasets, and results.

## Command Safety
Training, mutation, publish, and data-export commands require explicit gates.

## Verification
Use deterministic target checks where possible and record non-deterministic limitations.

## Anti-Patterns
Publishing training data, models, experiment results, or source-project-specific implementation details.
