# dotfiles

Source of truth for my dotfiles. Edit only in this repository checkout, typically under `$(ghq root)/github.com/01-mu/dotfiles`.
macOS is managed with `nix-darwin` plus `home-manager`.
Prereq: Nix with flakes enabled.

## Apply on macOS

```shell
cd "$(ghq root)/github.com/01-mu/dotfiles"
```

First switch:

```shell
./scripts/bootstrap/mac.sh
```

Later switches:

```shell
darwin-rebuild switch --flake .#01-mu
```

`home-manager` is wired through the Darwin configuration, so one switch applies both system settings and user dotfiles. The tracked source files remain in the existing package directories such as `zsh/`, `vim/`, `git/`, `ghq/`, `vscode/`, and `codex/`.

Archived packages live under `archive/` and are not part of the active configuration:
`archive/nvim`, `archive/wezterm`, `archive/tmux`.

## ghq

```shell
ghq get https://github.com/OWNER/REPO
ghq list
```

This repo manages the `ghq` config too. The root is `~/ghq`, so GitHub repositories are stored under `~/ghq/github.com/OWNER/REPO`.

Clone with `ghq get`, then move to a repo under `$(ghq root)`.

## Codex

### Safe wrapper

```shell
export PATH="$HOME/.codex/bin:$PATH"
```

```shell
codex-safe
```

Optional checks:

```shell
codex execpolicy check --pretty --rules ~/.codex/rules/policy-deny.rules -- sudo ls
sandbox-exec -f ~/.codex/sandbox/deny-secrets.sb cat .env
```

## mac bootstrap

```shell
./scripts/bootstrap/mac.sh
```

Windows: see `windows/README.md`.
