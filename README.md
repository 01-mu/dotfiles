# dotfiles

Source of truth for my dotfiles. Edit only under `~/dotfiles`.
Prereq: GNU stow.

## Stow usage

```shell
cd ~/dotfiles
stow -n nvim ghostty zsh vim git nix
stow nvim ghostty zsh vim git nix
```

## Codex

```shell
cd ~/dotfiles
stow -n codex
stow codex
```

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

## VS Code (mac / Linux)

```shell
cd ~/dotfiles
stow -n vscode-mac
stow vscode-mac
stow -n vscode-linux
stow vscode-linux
```

## Windows

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
cd $HOME\dotfiles
.\windows\bootstrap.ps1
```

## Setup

```shell
cd ~/dotfiles
chmod +x scripts/setup.sh
./scripts/setup.sh
```

## mac bootstrap

```shell
./scripts/bootstrap/mac.sh
```
