{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fzf
    gh
    ghq
    git
    ripgrep
    zoxide
  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
  programs.home-manager.enable = true;
}
