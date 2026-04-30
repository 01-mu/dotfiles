{ config, user, lib, pkgs, ... }:
let
  dotfilesRoot = "${config.home.homeDirectory}/ghq/github.com/01-mu/dotfiles";
  outOfStore = relativePath:
    config.lib.file.mkOutOfStoreSymlink "${dotfilesRoot}/${relativePath}";
  codexSource = "${dotfilesRoot}/codex/.codex";
  codexRsyncExcludes = [
    "auth.json"
    ".codex-global-state.json*"
    ".personality_migration"
    "ambient-suggestions/"
    "cache/"
    "config.toml"
    "installation_id"
    "log/"
    "logs/"
    "logs_*.sqlite*"
    "memories/"
    "models_cache.json"
    "plugins/cache/"
    "rules/default.rules"
    "session_index.jsonl"
    "sessions/"
    "shell_snapshots/"
    "skills/.system/"
    "sqlite/"
    "state_*.sqlite*"
    "tmp/"
    "vendor_imports/"
    "version.json"
    "history*"
    "*.sqlite*"
    "*.tmp"
    "*.lock"
  ];
  codexRsyncExcludeArgs =
    lib.concatMapStringsSep " \\\n      " (pattern: "--exclude ${lib.escapeShellArg pattern}")
      codexRsyncExcludes;
in
{
  home.username = user;
  home.homeDirectory = "/Users/${user}";
  home.stateVersion = "24.11";

  home.file = {
    ".zshrc".source = outOfStore "home/.zshrc";
    ".vimrc".source = outOfStore "home/.vimrc";

    ".config/git/config".source = outOfStore "home/.config/git/config";
    ".config/git/ignore".source = outOfStore "home/.config/git/ignore";
    ".config/ghq/config.yml".source = outOfStore "home/.config/ghq/config.yml";
    ".config/nix/nix.conf".source = outOfStore "home/.config/nix/nix.conf";

    ".config/Code/User/settings.json".source =
      outOfStore "home/.config/Code/User/settings.json";
    "Library/Application Support/Code/User/settings.json".source =
      outOfStore "home/.config/Code/User/settings.json";
  };

  home.activation.syncCodex = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    # ~/.codex contains runtime files, caches, and secrets. Sync only the
    # repository-managed policy/config files and keep the target writable.
    if [[ ! -d ${lib.escapeShellArg codexSource} ]]; then
      echo "Codex source directory is missing: ${lib.escapeShellArg codexSource}" >&2
      exit 1
    fi

    mkdir -p "$HOME/.codex"
    ${pkgs.rsync}/bin/rsync -a --chmod=Du+w,Fu+w \
      ${codexRsyncExcludeArgs} \
      ${lib.escapeShellArg "${codexSource}/"} "$HOME/.codex/"
  '';
}
