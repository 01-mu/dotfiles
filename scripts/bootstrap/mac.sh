#!/usr/bin/env bash
set -euo pipefail

flake_ref="${1:-.#01-mu}"

if ! command -v nix >/dev/null 2>&1; then
  echo "Nix is required. Install Nix with flakes enabled first." >&2
  exit 1
fi

if command -v darwin-rebuild >/dev/null 2>&1; then
  sudo darwin-rebuild switch --flake "$flake_ref"
else
  sudo nix run github:LnL7/nix-darwin -- switch --flake "$flake_ref"
fi
