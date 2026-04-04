# vscode

Unified VS Code Stow package for both Linux and macOS.

## Linux

- Settings path: `.config/Code/User/settings.json`
- This is the canonical tracked settings file.

## macOS

- Settings path: `Library/Application Support/Code/User/settings.json`
- This path is a symlink to `.config/Code/User/settings.json` within this package.

## Shared

- `extensions.txt` is the shared extension list.
