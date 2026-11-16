#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

link_path() {
  local source="$1"
  local destination="$2"
  local existing_target

  mkdir -p "$(dirname "$destination")"

  if [ -L "$destination" ]; then
    existing_target="$(readlink "$destination")"
    if [ "$existing_target" = "$source" ]; then
      printf '[ok] %s -> %s\n' "$destination" "$source"
      return 0
    fi
    rm "$destination"
  elif [ -e "$destination" ]; then
    printf '[error] destination exists and is not the expected symlink: %s\n' "$destination" >&2
    return 1
  fi

  ln -s "$source" "$destination"
  printf '[linked] %s -> %s\n' "$destination" "$source"
}

link_if_directory_exists() {
  local source="$1"
  local destination="$2"

  if [ -d "$source" ]; then
    link_path "$source" "$destination"
  else
    printf '[skip] source directory not present: %s\n' "$source"
  fi
}

AGENTS_SOURCE="$ROOT_DIR/AGENTS.global.md"
if [ ! -f "$AGENTS_SOURCE" ]; then
  printf '[error] source file not found: %s\n' "$AGENTS_SOURCE" >&2
  exit 1
fi

link_path "$AGENTS_SOURCE" "$HOME/.agents/AGENTS.md"
link_path "$AGENTS_SOURCE" "$HOME/.claude/AGENTS.md"

WAZA_SKILLS_DIR="$ROOT_DIR/agent/waza/skills"
if [ ! -d "$WAZA_SKILLS_DIR" ]; then
  printf '[error] Waza repository not found: %s\n' "$WAZA_SKILLS_DIR" >&2
  exit 1
fi

for skill_dir in "$WAZA_SKILLS_DIR"/*; do
  if [ -f "$skill_dir/SKILL.md" ]; then
    skill_name="$(basename "$skill_dir")"
    link_path "$skill_dir" "$HOME/.agents/skills/$skill_name"
    link_path "$skill_dir" "$HOME/.claude/skills/$skill_name"
  fi
done

link_if_directory_exists \
  "$ROOT_DIR/doc/kami/plugins/kami/skills/kami" \
  "$HOME/.agents/skills/kami"

link_if_directory_exists \
  "$ROOT_DIR/cloud/quarkclouddrive" \
  "$HOME/.agents/skills/quarkclouddrive"
