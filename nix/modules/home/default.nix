{ user, ... }:
{
  home.username = user;
  home.homeDirectory = "/Users/${user}";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.file = {
    ".zshrc".source = ../../../home/.zshrc;
    ".vimrc".source = ../../../home/.vimrc;
    ".codex".source = ../../../codex/.codex;

    ".config/git/config".source = ../../../home/.config/git/config;
    ".config/git/ignore".source = ../../../home/.config/git/ignore;
    ".config/ghq/config.yml".source = ../../../home/.config/ghq/config.yml;
    ".config/nix/nix.conf".source = ../../../home/.config/nix/nix.conf;

    ".config/Code/User/settings.json".source = ../../../home/.config/Code/User/settings.json;
    "Library/Application Support/Code/User/settings.json".source =
      ../../../home/.config/Code/User/settings.json;
  };
}
