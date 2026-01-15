# Agent Advisory (soft policy)

- Never read `.env` or other secrets files.
- Never print secrets to the terminal or logs.
- Prefer `.env.example` or documented config samples.
- If configuration is needed, ask the user for non-secret placeholders.

## Jujutsu workflow
- Use `jj change` proactively and keep `jj describe` up to date.
- When consolidating changes into a commit, derive the commit message from prior describe text and the change contents.
- Name bookmarks based on the same describe/commit wording.
- Treat `jj change` history as the user's decision history; do not rewrite it without explicit request.

## Release and PR policy
- For released products, never merge directly to `main`; merge progress into `dev`.
- Only open `dev` -> `main` PRs when the user explicitly instructs it.
- PR approval happens in the user's GitHub browser; do not assume approval.
- Keep PR messages formatting-safe; avoid line breaks or formatting that can collapse in GitHub UI.
