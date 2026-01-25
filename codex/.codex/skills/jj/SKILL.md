---
name: jj
description: Authoritative Jujutsu (jj) workflow rules and allowed commands. Use when performing version control operations in repositories that require jj or when deciding how to use jj safely.
---

# jj skill (authoritative)

## Purpose
Define the only allowed Jujutsu (jj) operational rules. This file is the single source of truth for all jj usage.

## Core Rules
- Read this file before any jj command.
- Summarize intended jj operations in plain language, then wait for user confirmation before executing.
- Prefer read-only commands (e.g., `jj status`, `jj log`) over write operations.
- If a situation is ambiguous, stop and ask for clarification.
- Do not invent workflows or commands not explicitly allowed here.
- Treat all destructive or history-rewriting operations as requiring explicit user confirmation.
- Never perform force-push equivalent operations unless explicitly permitted here.
- Default to "ask first" for any command not explicitly allowed.

## Git Integration Policy (highest priority)
All `jj git *` commands MUST follow "Plan -> Confirm -> Execute" before running.

### `jj git push`
- Posture: confirmation-required and remote-modifying.
- Preconditions: `jj status`, `jj log -r @`, `jj diff`, and identify target remote/branch explicitly.
- Ensure: no commits to be pushed are missing descriptions; add descriptions with `jj describe` before pushing.
- Never do: force-push equivalents, pushing rewritten history, pushing to protected branches (e.g., `main`, `master`, `release/*`) unless explicitly approved by the user.

### `jj git fetch`
- Posture: confirmation-required (read-only remote).
- Preconditions: `jj status` and identify remote.
- Never do: fetch from unapproved or unknown remotes.

### `jj git import`
- Posture: confirmation-required and state-changing.
- Preconditions: `jj status`, `jj log -r @`, and identify source.
- Never do: import from unapproved or unknown remotes.

### `jj git export`
- Posture: confirmation-required and state-changing.
- Preconditions: `jj status`, `jj log -r @`, and identify target.
- Never do: export to protected branches unless explicitly approved.

### `jj git remote`
- Posture: confirmation-required and state-changing.
- Preconditions: `jj status` and identify intended change.
- Never do: add or modify remotes without explicit user instruction.

### `jj git clone`
- Posture: confirmation-required and state-changing.
- Preconditions: confirm destination path and remote URL.
- Never do: clone from unapproved or unknown remotes.

## Allowed Commands (read-only)
- `jj status`
- `jj log`
- `jj diff`
- `jj show`

## Allowed Commands (write, only after confirmation)
- `jj change` (create/switch only; no rewrite without explicit confirmation)
- `jj describe` (update description only after confirmation)
- `jj new` (create a new change)
- `jj edit` (switch working change)
- `jj bookmark` (create/move/delete only after confirmation)
- `jj tag` (create/delete only after confirmation)

## Destructive or History-Rewriting Operations (explicit confirmation required)
- `jj abandon`
- `jj abandon --restore-descendants`
- `jj squash`
- `jj rebase`
- `jj split`
- `jj unsquash`
- `jj backout`
- `jj restore`
- `jj resolve`
- `jj undo`
- `jj op restore`

## Allowed/Forbidden Command Guidance
If a command appears here, follow its guidance and pre-flight checks. If it does not appear, ask first.

### Read-only safe inspection
- `jj status`, `jj log`, `jj log -r @`, `jj diff`, `jj show`, `jj op log`

### State-changing core commands (confirmation required)
#### `jj new`
- Safe use: start a new change from the current checkout.
- Red flags: unclear base or multiple concurrent changes.
- Pre-flight: `jj status`, `jj log -r @`.

#### `jj edit`
- Safe use: move to a known change to continue work.
- Red flags: switching away from unreviewed work.
- Pre-flight: `jj status`, `jj log -r @`.

#### `jj describe`
- Safe use: update description for the current change.
- Red flags: accidental description overwrite.
- Pre-flight: `jj status`, `jj log -r @`.

#### `jj abandon`
- Safe use: discard an unwanted change.
- Red flags: unpushed work or unclear dependencies.
- Pre-flight: `jj status`, `jj log -r @`, `jj diff`.

#### `jj squash` / `jj unsquash`
- Safe use: combine or separate local-only changes before publish.
- Red flags: any change already published or reviewed.
- Pre-flight: `jj status`, `jj log -r @`, `jj diff`.

#### `jj rebase` / `jj split`
- Safe use: local-only cleanup before publish.
- Red flags: published changes, complex dependency chains.
- Pre-flight: `jj status`, `jj log -r @`, `jj diff`.

#### `jj restore` / `jj resolve`
- Safe use: undo/resolve local working tree edits.
- Red flags: unclear target paths or conflict sources.
- Pre-flight: `jj status`, `jj diff`.

#### `jj bookmark` / `jj tag`
- Safe use: local labels for changes.
- Red flags: touching protected names or published refs.
- Pre-flight: `jj status`, `jj log -r @`.

#### `jj undo` / `jj op restore`
- Safe use: recover from known mistakes.
- Red flags: unclear operation target or multiple ops since error.
- Pre-flight: `jj op log`, confirm exact op to restore.

## Forbidden
- Any force-push equivalent behavior.
- Any jj command not listed above.
- Any history rewriting without explicit user confirmation.

## Change/Branch-Equivalent Workflow Conventions
- Use `jj bookmark` as branch equivalents.
- Naming: `feature/`, `fix/`, `chore/`, `wip/`, `release/` prefixes.
- Workflow: `jj new` -> work -> `jj describe` -> attach/move bookmark -> iterate.
- Publish readiness: clean `jj status`, meaningful description, and reviewed diff.
- History rewrite: allowed locally before publish; never after publish unless explicitly approved.
- Change descriptions should use conventional prefixes and optional scopes, and be written in English (e.g., `feat(ui): ...`, `fix(api): ...`, `chore: ...`).

## Operating Procedures (SOP) Templates
### Read-only inspection
1) Run `jj status`, `jj log -r @`, `jj diff` as needed.
2) Summarize findings; ask if any write action is desired.

### Local-only rewrite
1) Pre-flight: `jj status`, `jj log -r @`, `jj diff`.
2) Summarize intended rewrite; wait for confirmation.
3) Execute the single requested rewrite command.

### Publishing to remote
1) Pre-flight: `jj status`, `jj log -r @`, `jj diff`, identify remote/branch.
2) Summarize "Plan -> Confirm -> Execute" with remote details.
3) Execute only after explicit confirmation.

### Recovery after a mistake
1) Pre-flight: `jj op log`.
2) Identify the exact operation to revert.
3) Summarize restore plan; wait for confirmation.
4) Run `jj undo` or `jj op restore` as confirmed.

## Notes
- If a command is not listed here, ask the user to update this file first.
- If unsure whether an operation is safe under jj semantics, stop and ask.
