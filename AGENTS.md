# Repository Guidelines

## Project Structure & Module Organization

This repository is a dotfiles source of truth managed with `home-manager` and `nix-darwin` on macOS. The tracked config sources still live in app-specific top-level directories such as `zsh/`, `git/`, `ghq/`, `vim/`, `vscode/`, and `codex/`. Nix entrypoints live in `flake.nix` and `modules/`. Shared automation lives in `scripts/`. Platform-specific notes live in `windows/`.

## Build, Test, and Development Commands

- `./scripts/bootstrap/mac.sh` — first macOS apply via `nix-darwin`.
- `darwin-rebuild switch --flake .#01-mu` — apply the macOS system and `home-manager` config.
- `home-manager switch --flake .#01-mu` — apply the user-level config only.

There is no build system. Validate changes by reloading the target app (e.g., restart WezTerm, reopen Neovim) and confirming expected behavior.
When adding new managed files, wire them into the relevant Nix module before applying the flake.

## Coding Style & Naming Conventions

- Keep edits minimal and consistent with existing file styles.
- Lua configs generally use two-space indentation and trailing commas in tables where present.
- Prefer lowercase filenames and conventional dot-config paths (e.g., `app/.config/app/...`).

## Testing Guidelines

There are no automated tests in this repository. Do lightweight manual checks relevant to the change (e.g., run `wezterm`, open Neovim, or reload shell config) and keep commits scoped to a single, verifiable change.

## Notes

Global agent policies live under `codex/.codex/AGENTS.md`. Keep this file focused on repository-specific guidance.
