# Agent Advisory (soft policy)

- Never read `.env` or other secrets files.
- Never print secrets to the terminal or logs.
- Prefer `.env.example` or documented config samples.
- If configuration is needed, ask the user for non-secret placeholders.
