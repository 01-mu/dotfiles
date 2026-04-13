#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

echo "Updating Homebrew..."
brew update

formulae=(
  abseil
  ada-url
  asciinema
  autoconf
  bash
  brotli
  c-ares
  ca-certificates
  cocoapods
  dav1d
  direnv
  docker-compose
  ffmpeg
  fmt
  fzf
  gcc
  gettext
  gh
  ghq
  git
  gmp
  gnupg
  gnutls
  go
  icu4c@78
  isl
  krb5
  lazydocker
  lazygit
  libassuan
  libevent
  libgcrypt
  libgpg-error
  libidn2
  libksba
  libmpc
  libnghttp2
  libnghttp3
  libngtcp2
  libtasn1
  libunistring
  libusb
  libuv
  libvpx
  libyaml
  llhttp
  lpeg
  luajit
  luv
  lz4
  m4
  mpfr
  mysql
  ncurses
  neovim
  nettle
  nginx
  nkf
  node
  npth
  openssl@3
  opus
  p11-kit
  pcre2
  pinentry
  pkgconf
  protobuf
  readline
  ripgrep
  ruby
  ruby-build
  sdl2
  simdjson
  sqlite
  stow
  tmux
  tree-sitter
  tree-sitter-cli
  unbound
  unibilium
  utf8proc
  uvwasi
  x264
  x265
  xz
  z
  zoxide
  zlib-ng-compat
  zstd
)

casks=(
  android-commandlinetools
  brave-browser
  chatgpt-atlas
  codex
  codex-app
  coteditor
  discord
  docker
  docker-desktop
  font-blex-mono-nerd-font
  google-chrome
  microsoft-teams
  obsidian
  pgadmin4
  powershell
  scroll-reverser
  unity-hub
  visual-studio-code
  zoom
)

echo "Installing Homebrew formulae..."
brew install "${formulae[@]}"

echo "Installing Homebrew casks..."
brew install --cask "${casks[@]}"

echo "Bootstrap complete."
