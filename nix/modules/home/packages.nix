{ pkgs, ... }:
{
  home.packages = with pkgs; [
    direnv
    fzf
    gh
    ghq
    git
    ripgrep
    zoxide
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.home-manager.enable = true;
}
