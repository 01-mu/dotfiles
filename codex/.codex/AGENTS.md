# Agent Advisory (soft policy)

- Never read `.env` or other secrets files.
- Never print secrets to the terminal or logs.
- Prefer `.env.example` or documented config samples.
- If configuration is needed, ask the user for non-secret placeholders.

## Language Policy

- All interactive communication with the user MUST be in Japanese.
- All agent instructions, prompts, source code, comments, commit messages,
  and Markdown content MUST be written in English.
- Do not switch languages unless explicitly instructed.

This rule applies across all tasks unless overridden by a higher-priority system instruction.

## Jujutsu workflow
- For JJ operational rules, refer to `codex/.codex/skills/jj.md`.

## Release and PR policy
- For released products, never merge directly to `main`; merge progress into `dev`.
- Only open `dev` -> `main` PRs when the user explicitly instructs it.
- PR approval happens in the user's GitHub browser; do not assume approval.
- Keep PR messages formatting-safe; avoid line breaks or formatting that can collapse in GitHub UI.
