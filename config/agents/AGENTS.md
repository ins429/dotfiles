# Personal coding preferences

These preferences apply across repositories and working directories. Follow
explicit task requirements and repository-specific conventions when they differ.

## Proactively suggest agentic workflows

When discussing or performing work, look for high-value opportunities where agents could meaningfully reduce manual effort or improve outcomes, including improvements to the broader workflow beyond the immediate task. Briefly suggest what an agent could handle, the expected benefit, and where human review or approval should remain. Prefer practical, lightweight approaches; recommend simple automation when agent reasoning is unnecessary. Avoid low-value, repetitive, or forced suggestions. Offer a short suggestion first and elaborate only if the user is interested. Do not implement the suggestion or expand the task without approval.

## Clarifying questions

When the user prompts "questions?", ask any necessary clarifying questions one
at a time using the agent's interactive question or prompt tool when available.
Wait for each answer before asking the next question; do not batch questions
into a list or multi-question form. If no clarification is needed, say so
briefly rather than inventing questions.

## Existing code and commit history

When modifying code written by others, preserve its established patterns as
much as possible. Prefer minimal, additive changes that fully address the task.
Do not restyle or broadly refactor existing code to match these preferences;
this takes precedence over aggressive DRY and functional-style preferences.

Favor removing unnecessary code when it is safe and in scope, but isolate
removal and cleanup work in a dedicated commit. Keep DRY refactors and other
structural refactors in separate commits from feature additions or bug fixes.
Each commit should have one clear purpose and a message explaining what changed
and why, preserving an easy-to-review audit trail. Do not mix unrelated changes
or rewrite existing commit history without explicit permission. These guidelines
govern commit organization, not permission to create commits.

## Declarative coding

Prefer declarative coding patterns when they improve clarity. Express intent
through typed data, schemas, configuration, and explicit state models rather
than procedural orchestration.

Apply DRY aggressively in production code and tests: consolidate repeated logic
into reusable, intention-revealing declarative functions. Search for and reuse
existing helpers before adding new ones. Keep abstractions cohesive and inputs
explicit so reuse improves readability rather than hiding behavior.

Keep side effects in small, explicit functions. Use straightforward imperative
code when it is clearer. Avoid custom DSLs, hidden behavior, or excessive
abstraction solely to make code declarative.

## Functional style

Prefer functional programming styles: small, composable functions, pure
transformations, immutable data, and explicit inputs and return values. Favor
function composition over class hierarchies and shared mutable state. Keep
side effects at clear boundaries, separate from core transformation logic.
Use functional collection operations when they make intent clearer; avoid
cryptic chains or abstractions that make code harder to follow.

## Readable tests

Prefer declarative, intention-revealing helper functions and patterns so humans
can easily read each test's setup, action, and assertions. For example, a test
might call `setupXDepMocks()`, then `setupHttpMocks()`, then
`const { component } = renderXComponent()`, followed by explicit assertions.
This is an illustrative pattern, not a required naming scheme or fixed sequence.

Reuse existing test helpers where appropriate. Keep scenario-specific inputs,
behavior, and expected outcomes visible in the test; encapsulate repetitive
mocking and rendering mechanics without hiding important details or introducing
unnecessary abstraction.

## File size

Keep source code files at or below 300 lines, except when modifying existing
files that already exceed 300 lines. Those files may remain over the limit;
do not split them solely to satisfy this rule. Otherwise, split larger files
into focused, cohesive modules rather than compressing formatting.
