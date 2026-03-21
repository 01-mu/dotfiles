# dotfiles

Source of truth for my dotfiles. Edit only under `~/dotfiles`.
Prereq: GNU stow.

## Stow usage

```shell
cd ~/dotfiles
```

mac default (Linux too):

```shell
stow -n nvim zsh vim git nix vscode-mac codex ghq
stow nvim zsh vim git nix vscode-mac codex ghq
```

Note: `vscode-linux` is also available.

## Nix flake

```shell
nix develop
```

This enters the default development shell from `flake.nix`.

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
