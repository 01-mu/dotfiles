{ user, ... }:
{
  home.username = user;
  home.homeDirectory = "/Users/${user}";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.file = {
    ".zshrc".source = ../../zsh/.zshrc;
    ".vimrc".source = ../../vim/.vimrc;
    ".codex".source = ../../codex/.codex;

    ".config/git/config".source = ../../git/.config/git/config;
    ".config/git/ignore".source = ../../git/.config/git/ignore;
    ".config/ghq/config.yml".source = ../../ghq/.config/ghq/config.yml;
    ".config/nix/nix.conf".source = ../../nix/.config/nix/nix.conf;

    ".config/Code/User/settings.json".source = ../../vscode/.config/Code/User/settings.json;
    "Library/Application Support/Code/User/settings.json".source =
      ../../vscode/.config/Code/User/settings.json;
  };
}
