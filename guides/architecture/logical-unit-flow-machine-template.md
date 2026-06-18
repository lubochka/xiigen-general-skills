# Logical Unit Flow Machine Template

## Intended Architecture
Use for DAG, workflow, pipeline, or orchestrated task systems.

## Project Inputs
Workflow types, node model, dependencies, execution mode, retry policy, checkpoint rules.

## Adaptation Questions
- Are flows synchronous, asynchronous, or mixed?
- How are fan-out, fan-in, retries, and partial failures handled?
- Which component owns execution state?

## Template Rules
Define flow model, unit contract, execution order, failure handling, and observability expectations.

## Outputs
Flow model document, unit contract, orchestration rules, and failure matrix.

## Review Gates
No required source-specific interface names, numbered flow artifacts, product interface names, or concrete queue implementation.

## Non-Goals
Does not force a specific orchestrator, broker, database, or runtime.
