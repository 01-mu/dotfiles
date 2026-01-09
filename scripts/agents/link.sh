#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STOW_DIR="${DOTFILES_ROOT}/agents"
TARGET="${HOME}/.codex"

if ! command -v stow >/dev/null 2>&1; then
  echo "stow not found. Install it first and re-run."
  exit 1
fi

if [ ! -d "${STOW_DIR}/codex" ]; then
  echo "skip: package not found: ${STOW_DIR}/codex"
  exit 0
fi

mkdir -p "${TARGET}"
stow -v -R -t "${TARGET}" -d "${STOW_DIR}" codex

echo "done."
