{ user, lib, pkgs, ... }:
{
  home.username = user;
  home.homeDirectory = "/Users/${user}";
  home.stateVersion = "24.11";

  home.file = {
    ".zshrc".source = ../../../home/.zshrc;
    ".vimrc".source = ../../../home/.vimrc;

    ".config/git/config".source = ../../../home/.config/git/config;
    ".config/git/ignore".source = ../../../home/.config/git/ignore;
    ".config/ghq/config.yml".source = ../../../home/.config/ghq/config.yml;
    ".config/nix/nix.conf".source = ../../../home/.config/nix/nix.conf;

    ".config/Code/User/settings.json".source = ../../../home/.config/Code/User/settings.json;
    "Library/Application Support/Code/User/settings.json".source =
      ../../../home/.config/Code/User/settings.json;
  };

  home.activation.copyCodex = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    # codex/.codex keeps hand-authored Codex policy/config.
    # ~/.codex also contains runtime and Codex-managed files; keep those writable.
    mkdir -p "$HOME/.codex"
    ${pkgs.rsync}/bin/rsync -a \
      --exclude 'auth.json' \
      --exclude '.codex-global-state.json*' \
      --exclude '.personality_migration' \
      --exclude 'ambient-suggestions/' \
      --exclude 'cache/' \
      --exclude 'config.toml' \
      --exclude 'installation_id' \
      --exclude 'log/' \
      --exclude 'logs/' \
      --exclude 'logs_*.sqlite*' \
      --exclude 'models_cache.json' \
      --exclude 'rules/default.rules' \
      --exclude 'session_index.jsonl' \
      --exclude 'sessions/' \
      --exclude 'shell_snapshots/' \
      --exclude 'skills/.system/' \
      --exclude 'sqlite/' \
      --exclude 'state_*.sqlite*' \
      --exclude 'tmp/' \
      --exclude 'vendor_imports/' \
      --exclude 'version.json' \
      --exclude 'history*' \
      --exclude '*.sqlite*' \
      --exclude '*.tmp' \
      --exclude '*.lock' \
      ${../../../codex/.codex}/ "$HOME/.codex/"
    chmod -R u+w "$HOME/.codex"
  '';
}
