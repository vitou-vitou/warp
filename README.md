# warp-backup

Backup of local Warp/agent config.

## Restore

```bash
git clone -b vitou/feature/init <repo-url> warp-backup
bash warp-backup/restore.sh
```

Then restart Warp.

## Restore paths (Windows)

- `launch_configurations/` → `%APPDATA%\warp\Warp\data\launch_configurations\`
- `config/settings.toml` → `%LOCALAPPDATA%\warp\Warp\config\settings.toml`
- `skills-agents/` → `%USERPROFILE%\.agents\skills\`
- `skills-cursor/` → `%USERPROFILE%\.cursor\skills\`

## gen-launch-configs.sh

Regenerates one launch config per git repo under `D:\vitou\projects`.
Rerun after cloning new repos.
