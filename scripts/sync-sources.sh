#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
MANIFEST="$ROOT_DIR/sources.tsv"

if [ ! -f "$MANIFEST" ]; then
  printf '[error] manifest not found: %s\n' "$MANIFEST" >&2
  exit 1
fi

sync_repository() {
  local relative_path="$1"
  local repository_url="$2"
  local branch="$3"
  local target="$ROOT_DIR/$relative_path"
  local current_branch
  local actual_url

  if [ -e "$target" ] || [ -L "$target" ]; then
    if ! git -C "$target" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      printf '[error] target exists but is not a Git repository: %s\n' "$target" >&2
      return 1
    fi

    actual_url="$(git -C "$target" remote get-url origin 2>/dev/null || true)"
    if [ "$actual_url" != "$repository_url" ]; then
      printf '[error] origin mismatch for %s\n' "$target" >&2
      printf '        expected: %s\n' "$repository_url" >&2
      printf '        actual:   %s\n' "${actual_url:-<missing>}" >&2
      return 1
    fi

    if [ -n "$(git -C "$target" status --porcelain)" ]; then
      printf '[skip] %s has local changes\n' "$relative_path"
      return 0
    fi

    current_branch="$(git -C "$target" symbolic-ref --short -q HEAD || true)"
    git -C "$target" fetch origin "$branch"

    if [ "$current_branch" != "$branch" ]; then
      if git -C "$target" show-ref --verify --quiet "refs/heads/$branch"; then
        git -C "$target" switch "$branch"
      else
        git -C "$target" switch -c "$branch" --track "origin/$branch"
      fi
    fi

    git -C "$target" pull --ff-only origin "$branch"
    printf '[updated] %s\n' "$relative_path"
    return 0
  fi

  mkdir -p "$(dirname "$target")"
  git clone --branch "$branch" "$repository_url" "$target"
  printf '[cloned] %s\n' "$relative_path"
}

failures=0
while IFS=$'\t' read -r relative_path repository_url branch extra; do
  case "$relative_path" in
    ''|\#*) continue ;;
  esac

  if [ -z "${repository_url:-}" ] || [ -z "${branch:-}" ] || [ -n "${extra:-}" ]; then
    printf '[error] invalid manifest row: %s\n' "$relative_path" >&2
    failures=$((failures + 1))
    continue
  fi

  if ! sync_repository "$relative_path" "$repository_url" "$branch"; then
    failures=$((failures + 1))
  fi
done < "$MANIFEST"

if [ "$failures" -gt 0 ]; then
  printf '[error] %d source(s) could not be synchronized\n' "$failures" >&2
  exit 1
fi
