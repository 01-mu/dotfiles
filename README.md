# dotfiles

Source of truth for my dotfiles. Edit only under `~/dotfiles`.
Prereq: GNU stow.

## Stow usage

```shell
cd ~/dotfiles
```

Core:

```shell
stow -n nvim ghostty zsh vim git nix
stow nvim ghostty zsh vim git nix
```

Codex:

```shell
stow -n codex
stow codex
```

VS Code (mac / Linux):

```shell
stow -n vscode-mac
stow vscode-mac
stow -n vscode-linux
stow vscode-linux
```

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
