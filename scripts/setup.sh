#!/usr/bin/env bash
set -euo pipefail

REPO="${HOME}/dotfiles"
PACKAGES=(nvim ghostty)

if ! command -v stow >/dev/null 2>&1; then
  echo "stow not found. Install it first and re-run."
  exit 1
fi

echo "[1/1] Stow packages: ${PACKAGES[*]}"
cd "${REPO}"
stow -v -R "${PACKAGES[@]}"

echo "All set. Symlinks are managed by stow."
