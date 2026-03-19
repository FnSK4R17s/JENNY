#!/usr/bin/env bash
set -euo pipefail

# Usage: is-jenny-summon.sh "<raw user message>"
# Exit 0 => message is exactly "jenny" (case-insensitive, surrounding whitespace ignored)
# Exit 1 => not a pure JENNY summon

msg="${1:-}"
normalized="$(printf '%s' "$msg" | tr '[:upper:]' '[:lower:]' | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')"

if [ "$normalized" = "jenny" ]; then
  exit 0
fi

exit 1
