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
  asciinema
  autoconf
  ca-certificates
  cocoapods
  docker-compose
  fzf
  gcc
  gettext
  gh
  git
  gmp
  go
  icu4c@78
  isl
  krb5
  lazydocker
  libevent
  libiconv
  libmpc
  libunistring
  libuv
  libyaml
  lpeg
  luajit
  luv
  lz4
  m4
  mise
  mpfr
  mysql
  ncurses
  neovim
  nginx
  nkf
  openssl@3
  pcre2
  pkgconf
  postgresql@14
  protobuf
  readline
  ruby
  ruby-build
  tmux
  tree-sitter@0.25
  unibilium
  usage
  utf8proc
  xz
  z
  zlib
  zstd
)

casks=(
  brave-browser
  coteditor
  dbeaver-community
  discord
  docker
  docker-desktop
  google-chrome
  iterm2
  mono-mdk-for-visual-studio
  obsidian
  pgadmin4
  powershell
  scroll-reverser
  visual-studio-code
  zoom
)

echo "Installing Homebrew formulae..."
brew install "${formulae[@]}"

echo "Installing Homebrew casks..."
brew install --cask "${casks[@]}"

echo "Configuring mise globals (latest at setup time)..."
mise use -g java@latest
mise use -g node@latest
mise use -g pnpm@latest
mise use -g python@latest
mise use -g rust@stable
mise use -g zoxide@latest

echo "Installing extra mise tool versions..."
mise install flutter@3.32.6-stable terraform@1.6.0 npm@11.5.2

echo "Bootstrap complete."
