#!/usr/bin/env bash
set -euo pipefail

# 既存の safe.directory を取得（無ければ空）
existing_dirs="$(git config --global --get-all safe.directory 2>/dev/null || true)"
add_safe_directory() {
  local dir="$1"

  if printf '%s\n' "$existing_dirs" | grep -Fxq "$dir"; then
    : # do nothing
  else
    git config --global --add safe.directory "$dir"
  fi
}


### main

# 追加したい safe.directory の一覧
SAFE_DIRS=(
  "/opt/idf"
  "/opt/idf/*"
)

for dir in "${SAFE_DIRS[@]}"; do
  add_safe_directory "$dir"
done

source /opt/esp/idf/export.sh