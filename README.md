# dotfiles

This repo is the source of truth for my dotfiles. Edit files only under
`~/dotfiles`.

Prereq: install GNU stow.

## Stow usage

```shell
cd ~/dotfiles
stow -n nvim ghostty zsh vim git
stow nvim ghostty zsh vim git
```

## Codex (stow)

```shell
cd ~/dotfiles
stow -n codex
stow codex
```

## Codex safe setup

Add the wrapper to PATH (zsh example):

```shell
export PATH="$HOME/.codex/bin:$PATH"
```

Run Codex through the sandboxed wrapper:

```shell
codex-safe
```

Optional safety checks:

```shell
codex execpolicy check --pretty --rules ~/.codex/rules/00-baseline.rules -- sudo ls
sandbox-exec -f ~/.codex/sandbox/deny-secrets.sb cat .env
```

## VS Code (stow)

### macOS

```shell
cd ~/dotfiles
stow -n vscode-macos
stow vscode-macos
```

### Linux

```shell
cd ~/dotfiles
stow -n vscode-linux
stow vscode-linux
```

## Windows setup (PowerShell)

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
cd $HOME\dotfiles
.\windows\bootstrap.ps1
```

## Setup script

```shell
cd ~/dotfiles
chmod +x setup.sh
./setup.sh
```

## Scripts

### macOS bootstrap

```shell
./scripts/bootstrap/mac.sh
```
