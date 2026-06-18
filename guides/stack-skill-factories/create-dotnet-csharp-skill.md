# Create .NET / C# Skill

## Stack Scope
Use when the target project uses `.sln`, `.slnx`, `.csproj`, C#, .NET, or C# test projects.

## Required Project Discovery
Find target project SDK version, solution files, project layout, build/test/lint commands, namespace rules, DI patterns, async rules, and forbidden commands.

## Skill Drafting Steps
1. Create a project-specific skill from discovered facts.
2. Include commands only from `project-profile.yaml`, CI, or the target repo.
3. Include verification and failure triage.
4. Link to universal `code-execution`, `test-integrity`, and `failure-triage`.

## Command Safety
Never copy commands from another repo. Mark restore/build/test/deploy commands as safe, approval-required, or forbidden according to the target project.

## Verification
Run the narrowest target-project build/test command or document why it is skipped.

## Anti-Patterns
Hard-coding .NET versions, namespaces, DI patterns, or test commands from any source project.
