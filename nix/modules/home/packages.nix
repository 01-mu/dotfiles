{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aider-chat
    fzf
    gh
    ghq
    git
    ripgrep
    zoxide
  ];

  services.ollama.enable = true;

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
  programs.home-manager.enable = true;
}
