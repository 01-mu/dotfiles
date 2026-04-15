{ ... }:
{
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "zap";
    onActivation.upgrade = true;

    # Homebrew is reserved for GUI apps and a few macOS-specific exceptions.
    brews = [ ];

    casks = [
      "chatgpt-atlas"
      "discord"
      "docker-desktop"
      "google-chrome"
      "obsidian"
      "unity-hub"
      "visual-studio-code"
      "zoom"
    ];
  };
}
