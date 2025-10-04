#!/usr/bin/env bash
set -euo pipefail

REPO="${HOME}/dotfiles"
NVIM_SRC="${REPO}/nvim/.config/nvim"
NVIM_DEST="${HOME}/.config/nvim"

echo "[1/4] Ensure base dirs"
mkdir -p "${HOME}/.config" "${REPO}/nvim/.config"

echo "[2/4] Backup or unlink existing ~/.config/nvim"
if [ -L "${NVIM_DEST}" ]; then
  unlink "${NVIM_DEST}" || true
elif [ -d "${NVIM_DEST}" ]; then
  mv "${NVIM_DEST}" "${NVIM_DEST}.backup.$(date +%Y%m%d-%H%M%S)"
fi

echo "[3/4] Stow 'nvim'"
cd "${REPO}"
stow -v -R nvim

echo "[4/4] Headless Neovim bootstrap"
nvim --headless "+Lazy! sync" "+TSUpdateSync" +qa || true

echo "All set. (~/.config/nvim -> ${NVIM_SRC})"

