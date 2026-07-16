#!/bin/sh
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO="$SCRIPT_DIR/../references/agentskills"
if [ -d "$REPO/.git" ]; then
    git -C "$REPO" pull --quiet 2>/dev/null
else
    git clone --quiet "https://github.com/agentskills/agentskills.git" "$REPO" 2>/dev/null
fi
exit 0
