#!/usr/bin/env bash
set -euo pipefail

has_cmd() { command -v "$1" >/dev/null 2>&1; }

set_git_alias() {
  local key="$1"
  local val="$2"

  local cur
  cur="$(git config --global --get "alias.${key}" 2>/dev/null || true)"

  if [[ "$cur" == "$val" ]]; then
    echo "ok  : g ${key} -> ${val}"
  else
    git config --global "alias.${key}" "$val"
    echo "set : g ${key} -> ${val}"
  fi
}

main() {
  has_cmd git || { echo "git not found"; exit 1; }

  # --- status / add ---
  set_git_alias s   "status"
  set_git_alias a   "add"
  set_git_alias aa  "add ."
  set_git_alias ap  "add -p"

  # --- commit ---
  set_git_alias c   "commit"
  set_git_alias cm  "commit -m"
  set_git_alias ca  "commit --amend"
  set_git_alias can "commit --amend --no-edit"

  # --- switch / branch ---
  set_git_alias sw  "switch"
  set_git_alias swc "switch -c"
  set_git_alias b   "branch"
  set_git_alias bd  "branch -d"
  set_git_alias cur "branch --show-current"

  # --- diff / log ---
  set_git_alias d   "diff"
  set_git_alias dc  "diff --cached"
  set_git_alias lg  "log --oneline --decorate --graph --all"

  # --- safety ---
  set_git_alias undo "reset --soft HEAD~1"
  set_git_alias refl "reflog"
}

main "$@"
