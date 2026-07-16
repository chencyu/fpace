#!/bin/sh
# Usage: ./validate-cli.sh <path-to-skill-directory>
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
pip install -e "$SCRIPT_DIR/../references/agentskills/skills-ref" --quiet 2>/dev/null
skills-ref validate "$1"
