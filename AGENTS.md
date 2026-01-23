# Repository Guidelines

## Project Structure & Module Organization

This repository is a dotfiles source of truth designed for GNU Stow. Each top-level directory is a Stow package for an app or tool (e.g., `nvim/`, `zsh/`, `git/`, `wezterm/`, `vscode-mac/`, `tmux/`). App-specific config files live under those package roots (often in `.config/...`). Shared automation lives in `scripts/`. Platform-specific notes live in `windows/`. The `vscode-linux/` and `vscode-mac/` packages provide OS-specific settings; pick the one that matches the host.

## Build, Test, and Development Commands

- `stow -n nvim ghostty zsh vim git nix vscode-mac codex` — dry-run to preview links.
- `stow nvim ghostty zsh vim git nix vscode-mac codex` — apply symlinks into `$HOME`.
- `./scripts/bootstrap/mac.sh` — macOS bootstrap helper.

There is no build system. Validate changes by reloading the target app (e.g., restart WezTerm, reopen Neovim) and confirming expected behavior.
When adding new files or packages, run Stow (after a dry-run) so the symlinks are actually applied.

## Coding Style & Naming Conventions

- Keep edits minimal and consistent with existing file styles.
- Lua configs generally use two-space indentation and trailing commas in tables where present.
- Prefer lowercase filenames and conventional dot-config paths (e.g., `app/.config/app/...`).

## Testing Guidelines

There are no automated tests in this repository. Do lightweight manual checks relevant to the change (e.g., run `wezterm`, open Neovim, or reload shell config) and keep commits scoped to a single, verifiable change.

## Notes

Global agent policies live under `codex/.codex/AGENTS.md`. Keep this file focused on repository-specific guidance.
