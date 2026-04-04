# dotfiles

Source of truth for my dotfiles. Edit only under `~/dotfiles`.
Prereq: GNU stow.

## Stow usage

```shell
cd ~/dotfiles
```

mac default (Linux too):

```shell
stow -n zsh vim git vscode codex ghq
stow zsh vim git vscode codex ghq
```

Archived packages live under `archive/` and are not part of the active Stow set:
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
