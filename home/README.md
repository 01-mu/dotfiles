# home

Tracked files in this directory mirror their target paths under `$HOME`.

Examples:

- `home/.zshrc` -> `~/.zshrc`
- `home/.config/git/config` -> `~/.config/git/config`
- `home/.config/Code/User/settings.json` -> `~/.config/Code/User/settings.json`

The Nix modules under `nix/modules/` decide which of these files are linked on each platform.
