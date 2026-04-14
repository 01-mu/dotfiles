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

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "zap";
    onActivation.upgrade = true;

    brews = [
      "abseil"
      "ada-url"
      "autoconf"
      "bash"
      "brotli"
      "c-ares"
      "ca-certificates"
      "cocoapods"
      "dav1d"
      "direnv"
      "ffmpeg"
      "fmt"
      "fzf"
      "gettext"
      "gh"
      "ghq"
      "git"
      "gmp"
      "gnupg"
      "gnutls"
      "hdrhistogram_c"
      "icu4c@78"
      "isl"
      "krb5"
      "lame"
      "lazydocker"
      "lazygit"
      "libassuan"
      "libevent"
      "libgcrypt"
      "libgpg-error"
      "libidn2"
      "libksba"
      "libmpc"
      "libnghttp2"
      "libnghttp3"
      "libngtcp2"
      "libtasn1"
      "libunistring"
      "libusb"
      "libuv"
      "libvpx"
      "libyaml"
      "llhttp"
      "lpeg"
      "luajit"
      "luv"
      "lz4"
      "m4"
      "mpfr"
      "ncurses"
      "nettle"
      "nkf"
      "node"
      "npth"
      "openssl@3"
      "opus"
      "p11-kit"
      "pcre2"
      "pinentry"
      "pkgconf"
      "protobuf"
      "readline"
      "ripgrep"
      "sdl2"
      "simdjson"
      "svt-av1"
      "unbound"
      "unibilium"
      "utf8proc"
      "uvwasi"
      "x264"
      "x265"
      "xz"
      "z"
      "zlib-ng-compat"
      "zoxide"
      "zstd"
    ];

    casks = [
      "android-commandlinetools"
      "brave-browser"
      "chatgpt-atlas"
      "codex"
      "codex-app"
      "coteditor"
      "discord"
      "docker-desktop"
      "font-blex-mono-nerd-font"
      "google-chrome"
      "obsidian"
      "scroll-reverser"
      "unity-hub"
      "visual-studio-code"
      "zoom"
    ];
  };
}
