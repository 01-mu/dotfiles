# Agent Advisory (soft policy)

- Never read `.env` or other secrets files.
- Never print secrets to the terminal or logs.
- Prefer `.env.example` or documented config samples.
- If configuration is needed, ask the user for non-secret placeholders.

## Jujutsu workflow
- For JJ operational rules, refer to `codex/.codex/skills/jj.md`.

## Release and PR policy
- For released products, never merge directly to `main`; merge progress into `dev`.
- Only open `dev` -> `main` PRs when the user explicitly instructs it.
- PR approval happens in the user's GitHub browser; do not assume approval.
- Keep PR messages formatting-safe; avoid line breaks or formatting that can collapse in GitHub UI.
