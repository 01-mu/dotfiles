#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

link_dir () {
  local src="$1"
  local dst="$2"

  if [ ! -d "$src" ]; then
    echo "skip: source not found: $src"
    return
  fi

  mkdir -p "$(dirname "$dst")"

  if [ -L "$dst" ] || [ -e "$dst" ]; then
    rm -rf "$dst"
  fi

  ln -s "$src" "$dst"
  echo "linked: $dst -> $src"
}

# ---- Codex ----
link_dir "$DOTFILES_ROOT/agents/codex/prompts" "$HOME/.codex/prompts"
# 将来使うときのために残しておく
# link_dir "$DOTFILES_ROOT/codex/skills"  "$HOME/.codex/skills"

echo "done."
