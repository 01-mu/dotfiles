# home

Tracked files in this directory mirror their target paths under `$HOME`.
Home Manager links these files out of the working tree so edits in this
repository are visible without copying files through the Nix store.

Examples:

- `home/.zshrc` -> `~/.zshrc`
- `home/.config/git/config` -> `~/.config/git/config`
- `home/.config/Code/User/settings.json` -> `~/.config/Code/User/settings.json`

The Nix modules under `nix/modules/` decide which of these files are linked on each platform.
