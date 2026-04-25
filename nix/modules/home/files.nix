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
    # codex/.codex is the version-controlled source of truth.
    # ~/.codex is a writable runtime copy used by Codex.
    mkdir -p "$HOME/.codex"
    ${pkgs.rsync}/bin/rsync -a \
      --exclude 'auth.json' \
      --exclude 'cache/' \
      --exclude 'logs/' \
      --exclude 'sessions/' \
      --exclude 'history*' \
      --exclude '*.tmp' \
      --exclude '*.lock' \
      ${../../../codex/.codex}/ "$HOME/.codex/"
    chmod -R u+w "$HOME/.codex"
  '';
}
