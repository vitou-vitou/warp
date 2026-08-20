#!/usr/bin/env bash
# Regenerate one Warp launch config per git repo under D:\vitou\projects.
# ponytail: flat single-tab configs only. Add panes/commands by hand if a repo needs them.
set -euo pipefail

ROOT=/d/vitou/projects
DEST="$APPDATA/warp/Warp/data/launch_configurations"
mkdir -p "$DEST"

n=0
for d in "$ROOT"/*/; do
  [ -d "$d/.git" ] || continue
  name=$(basename "$d")
  win="D:\\vitou\\projects\\$name"
  printf -- '---\nname: %s\nwindows:\n  - tabs:\n      - title: %s\n        layout:\n          cwd: %s\n' \
    "$name" "$name" "$win" > "$DEST/$name.yaml"
  n=$((n+1))
done
echo "wrote $n configs to $DEST"
