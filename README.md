# dotfiles

This repo is the source of truth. `$HOME` is generated via GNU stow.
Edit files under `~/dotfiles` only.

## stow usage

```shell
cd ~/dotfiles
stow -n nvim ghostty zsh vim git
stow nvim ghostty zsh vim git
```

## Windows setup (PowerShell)

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
cd $HOME\dotfiles
.\windows\bootstrap.ps1
```

## setup script

```shell
cd ~/dotfiles
chmod +x setup.sh
./setup.sh
```

## scripts

### macOS bootstrap

```shell
./scripts/bootstrap/mac.sh
```

### Codex prompts (stow to ~/.codex)

```shell
./scripts/agents/link.sh
```
