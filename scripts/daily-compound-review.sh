#!/bin/bash
# scripts/daily-compound-review.sh
# Runs BEFORE auto-compound.sh to update CLAUDE.md with learnings
# Adapted for Ubuntu/WSL

set -e

# Configuration
PROJECT_DIR="$HOME/empowered-visual"
LOG_FILE="$PROJECT_DIR/logs/compound-review-$(date +%Y-%m-%d).log"

# Logging function
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "=== Starting Daily Compound Review ==="

cd "$PROJECT_DIR"

# Ensure we're on main and up to date
log "Checking out main branch..."
git checkout main
git pull origin main

# Check if claude CLI is available
if ! command -v claude &> /dev/null; then
    log "ERROR: claude CLI not found. Please install Claude Code."
    exit 1
fi

log "Running compound review with Claude..."

# Run Claude to review recent work and update CLAUDE.md
claude -p "You are running a nightly compound review.

Your task:
1. Look at git log for the last 24 hours: git log --since='24 hours ago' --oneline
2. For each commit, understand what was changed
3. Extract any learnings, patterns, or gotchas discovered
4. Update CLAUDE.md with new patterns under '## Patterns Discovered' section
5. Update CLAUDE.md with any gotchas under '## Gotchas' section
6. If you made changes to CLAUDE.md, commit with message 'chore: compound learnings from $(date +%Y-%m-%d)'
7. Push to origin main

Be selective - only add truly useful patterns, not obvious things.
If no meaningful learnings, just report 'No new learnings to compound today.'" --dangerously-skip-permissions 2>&1 | tee -a "$LOG_FILE"

log "=== Compound Review Complete ==="
