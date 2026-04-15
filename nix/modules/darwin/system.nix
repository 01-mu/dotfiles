{ user, ... }:
{
  users.users.${user}.home = "/Users/${user}";
  system.primaryUser = user;
  system.stateVersion = 6;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.zsh.enable = true;
}
