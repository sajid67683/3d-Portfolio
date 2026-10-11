#!/bin/bash
# Installs npm dependencies at the start of Claude Code cloud sessions so
# lint and build work right away. Does nothing on local machines.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-$(dirname "$0")/../..}"

# npm install (not npm ci) so the cached container's node_modules is reused.
npm install --no-audit --no-fund
