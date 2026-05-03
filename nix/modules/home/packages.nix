{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    aider-chat
    fzf
    gh
    ghq
    git
    ripgrep
  ];

  services.ollama.enable = true;

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
  programs.home-manager.enable = true;
  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;
  programs.zsh.enable = true;
  programs.zsh.dotDir = config.home.homeDirectory;
  programs.zsh.enableCompletion = false;
  programs.zsh.initContent = lib.mkOrder 850 (builtins.readFile ../../../home/.zshrc);
}
