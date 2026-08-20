#!/usr/bin/env bash
# Restore Warp/agent config on a new Windows machine (run from repo root, git-bash).
# ponytail: Windows-only paths. Add macOS/Linux branches if you ever need them.
set -euo pipefail

cd "$(dirname "$0")"

LC="$APPDATA/warp/Warp/data/launch_configurations"
CFG="$LOCALAPPDATA/warp/Warp/config"

mkdir -p "$LC" "$CFG" ~/.agents/skills ~/.cursor/skills

cp -r skills-agents/. ~/.agents/skills/
cp -r skills-cursor/. ~/.cursor/skills/
cp config/settings.toml "$CFG/settings.toml"

# Launch configs hardcode D:\vitou\projects. Regenerate instead if this machine differs.
if [ -d /d/vitou/projects ]; then
  cp launch_configurations/*.yaml "$LC/"
  echo "copied launch configs"
else
  echo "SKIPPED launch configs: /d/vitou/projects not found."
  echo "Edit ROOT in gen-launch-configs.sh, then run it."
fi

echo "done. restart Warp."
