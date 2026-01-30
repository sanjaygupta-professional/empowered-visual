#!/bin/bash
# scripts/compound/loop.sh
# Runs agent iteratively until all tasks pass
# Adapted for Ubuntu/WSL

set -e

PROJECT_DIR="$HOME/empowered-visual"
MAX_ITERATIONS=${1:-15}
ITERATION=0

cd "$PROJECT_DIR"

echo "=== Starting Compound Loop (max $MAX_ITERATIONS iterations) ==="

# Check if prd.json exists
if [ ! -f "prd.json" ]; then
    echo "ERROR: prd.json not found. Run auto-compound.sh first."
    exit 1
fi

while [ $ITERATION -lt $MAX_ITERATIONS ]; do
    ITERATION=$((ITERATION + 1))
    echo ""
    echo "=== Iteration $ITERATION of $MAX_ITERATIONS ==="
    echo "Time: $(date '+%Y-%m-%d %H:%M:%S')"

    # Check if all tasks are done (works without jq)
    REMAINING=$(grep -c '"passes": false' prd.json 2>/dev/null || echo "0")

    if [ "$REMAINING" -eq 0 ]; then
        echo "✅ All tasks complete!"
        exit 0
    fi

    echo "Tasks remaining: $REMAINING"

    # Get next task info for logging (works without jq)
    NEXT_TASK=$(python3 -c "
import json
with open('prd.json') as f:
    data = json.load(f)
for story in data.get('userStories', []):
    if not story.get('passes'):
        print(story.get('title', 'Unknown'))
        break
" 2>/dev/null || echo "Next task")
    echo "Working on: $NEXT_TASK"

    # Run agent on next task
    claude -p "Read prd.json and CLAUDE.md (if it exists).

Find the next task where passes: false.

For that task:
1. Implement ONLY that specific task
2. Follow patterns documented in CLAUDE.md
3. Run quality check: npm run build
4. If the build passes AND the acceptance criteria are met:
   - Commit your changes with a clear message
   - Update prd.json to mark the task as passes: true
5. If something fails, document what went wrong in progress.txt

Important:
- Focus on ONE task at a time
- Test your changes before marking complete
- Don't move to the next task until current one passes" --dangerously-skip-permissions

    # Small delay between iterations
    sleep 2
done

echo ""
echo "⚠️ Max iterations ($MAX_ITERATIONS) reached"
echo "Check prd.json for remaining tasks"
exit 1
