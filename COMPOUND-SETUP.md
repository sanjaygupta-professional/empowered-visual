# Compound Engineering Setup Guide

## Quick Start (Manual Mode)

For WSL/Ubuntu, the easiest approach is manual execution:

```bash
cd ~/empowered-visual

# After a day of work - extract learnings
./scripts/run-compound.sh review

# Let agent build something from your priorities
./scripts/run-compound.sh auto

# Or run both (full nightly loop)
./scripts/run-compound.sh full

# Check status of current tasks
./scripts/run-compound.sh status
```

## Workflow

### Daily Workflow
1. **During the day**: Work on the project normally
2. **End of day**: Update `reports/daily-YYYY-MM-DD.md` with priorities
3. **Before bed**: Run `./scripts/run-compound.sh full`
4. **Morning**: Review the PR that was created

### Report Format
Create/update `reports/daily-YYYY-MM-DD.md`:

```markdown
# Daily Report - 2026-01-30

## Priorities
1. [Highest priority - agent will work on this]
2. [Medium priority]
3. [Lower priority]

## Quality Notes
- Any issues or constraints
```

---

## Automated Mode (Cron)

### Prerequisites
```bash
# Ensure cron is running (WSL may need this)
sudo service cron start

# Make it start automatically
echo "sudo service cron start" >> ~/.bashrc
```

### Setup Cron Jobs
```bash
# Edit crontab
crontab -e

# Add these lines (adjust times as needed):
# Compound review at 10:30 PM
30 22 * * * cd ~/empowered-visual && ./scripts/daily-compound-review.sh >> logs/compound-review.log 2>&1

# Auto-compound at 11:00 PM
0 23 * * * cd ~/empowered-visual && ./scripts/compound/auto-compound.sh >> logs/auto-compound.log 2>&1
```

### WSL Considerations

**Problem**: WSL may suspend when you close the terminal or the Windows machine sleeps.

**Solutions**:

1. **Keep WSL running**:
   ```bash
   # In Windows PowerShell (as admin):
   wsl --set-default-timeout 0
   ```

2. **Use tmux/screen**:
   ```bash
   # Start a persistent session
   tmux new -s compound

   # Run the loop
   ./scripts/run-compound.sh full

   # Detach: Ctrl+B, then D
   # Reattach later: tmux attach -t compound
   ```

3. **Use Windows Task Scheduler**:
   Create a Windows scheduled task that runs:
   ```
   wsl -d Ubuntu -e bash -c "cd ~/empowered-visual && ./scripts/run-compound.sh full"
   ```

4. **Use a cloud VM** (recommended for reliable overnight runs):
   - Scaleway Mac Mini (~$0.10/hour)
   - Any Linux VPS
   - GitHub Codespaces

---

## File Structure

```
empowered-visual/
├── CLAUDE.md              # Agent instructions (grows over time)
├── compound.config.json   # Configuration
├── reports/               # Your daily priorities (input)
│   └── daily-YYYY-MM-DD.md
├── tasks/                 # Generated PRDs
│   └── prd-*.md
├── logs/                  # Execution logs (gitignored)
├── prd.json              # Current task state (gitignored)
├── progress.txt          # Iteration notes (gitignored)
└── scripts/
    ├── run-compound.sh         # Main entry point
    ├── daily-compound-review.sh
    └── compound/
        ├── auto-compound.sh
        └── loop.sh
```

---

## Monitoring

### View Logs
```bash
# Real-time compound review log
tail -f ~/empowered-visual/logs/compound-review.log

# Real-time auto-compound log
tail -f ~/empowered-visual/logs/auto-compound.log
```

### Check Task Progress
```bash
./scripts/run-compound.sh status
```

### Debug Issues
```bash
# See what Claude is doing
cat prd.json | jq .

# Check recent commits
git log --oneline -10

# See iteration notes
cat progress.txt
```

---

## Customization

### Adjust Max Iterations
Edit `compound.config.json`:
```json
{
  "maxIterations": 15  // Increase for complex tasks
}
```

### Change Quality Checks
Add tests when you have them:
```json
{
  "qualityChecks": ["npm run build", "npm test"]
}
```

### Add Notifications (Optional)
Add to end of `auto-compound.sh`:
```bash
# Slack notification (requires webhook URL)
curl -X POST -H 'Content-type: application/json' \
  --data '{"text":"Compound completed! PR ready for review."}' \
  $SLACK_WEBHOOK_URL
```

---

## Troubleshooting

### "claude: command not found"
```bash
# Check Claude Code is installed
which claude

# If not in PATH, find it
find ~ -name "claude" -type f 2>/dev/null
```

### "gh: command not found"
```bash
# Install GitHub CLI
sudo apt install gh
gh auth login
```

### Cron not running
```bash
# Check cron service
sudo service cron status

# Check cron logs
grep CRON /var/log/syslog
```

### Build fails in cron but works manually
Cron has a minimal environment. Add to your scripts:
```bash
export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
```
