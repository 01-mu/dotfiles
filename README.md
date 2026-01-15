# dotfiles

Source of truth for my dotfiles. Edit only under `~/dotfiles`.
Prereq: GNU stow.

## Stow usage

```shell
cd ~/dotfiles
```

mac default (Linux too):

```shell
stow -n nvim ghostty zsh vim git nix vscode-mac codex
stow nvim ghostty zsh vim git nix vscode-mac codex
```

Note: `vscode-linux` is also available.

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
