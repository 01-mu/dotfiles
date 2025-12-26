---
description: Execute the most recent numbered plan strictly from top to bottom.
argument-hint: [MODE=run|dry] [STOP_ON_FAIL=true|false]
---

You are operating in Codex CLI.

Task:
- Find the most recent assistant message that contains a numbered plan (e.g. "1., 2., 3.").
- Execute the steps strictly from top to bottom, without reordering or skipping.

Rules:
- MODE=$MODE (default: run)
  - run: execute the steps.
  - dry: do not execute; only list exactly what would be run, in order.
- STOP_ON_FAIL=$STOP_ON_FAIL (default: true)
  - true: stop immediately on the first failure.
  - false: continue, but clearly mark failures.

Constraints:
- Do NOT invent commands.
- If any step is ambiguous or underspecified, ask one precise clarification question before running anything.

Reporting:
- For each step: show (1) the step number, (2) what was run, (3) success/failure.
- End with a concise summary and the next concrete action if something failed.
