#!/bin/bash
# scripts/run-compound.sh
# Manual runner for compound engineering
# Use this instead of cron for WSL (more reliable)

set -e

PROJECT_DIR="$HOME/empowered-visual"
cd "$PROJECT_DIR"

echo "╔═══════════════════════════════════════════════════════════╗"
echo "║         COMPOUND ENGINEERING - empowered-visual           ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

case "${1:-menu}" in
    review)
        echo "🔍 Running Compound Review (extracts learnings from today's work)..."
        ./scripts/daily-compound-review.sh
        ;;
    auto)
        echo "🚀 Running Auto-Compound (picks priority, implements, creates PR)..."
        ./scripts/compound/auto-compound.sh
        ;;
    full)
        echo "🌙 Running Full Nightly Loop (review + auto)..."
        echo ""
        echo "Step 1/2: Compound Review"
        ./scripts/daily-compound-review.sh
        echo ""
        echo "Step 2/2: Auto-Compound"
        ./scripts/compound/auto-compound.sh
        ;;
    loop)
        echo "🔄 Running Execution Loop on existing prd.json..."
        ./scripts/compound/loop.sh "${2:-15}"
        ;;
    status)
        echo "📊 Current Status:"
        echo ""
        echo "Branch: $(git branch --show-current)"
        echo ""
        if [ -f "prd.json" ]; then
            echo "Tasks:"
            # Parse without jq - extract titles and passes status
            python3 -c "
import json
with open('prd.json') as f:
    data = json.load(f)
for story in data.get('userStories', []):
    status = '✅' if story.get('passes') else '⬜'
    print(f'  {status} {story.get(\"title\", \"Unknown\")}')
" 2>/dev/null || echo "  (install python3 to see task details)"
        else
            echo "No prd.json found"
        fi
        echo ""
        echo "Recent commits:"
        git log --oneline -5
        ;;
    *)
        echo "Usage: ./scripts/run-compound.sh [command]"
        echo ""
        echo "Commands:"
        echo "  review  - Extract learnings from today's work, update CLAUDE.md"
        echo "  auto    - Full pipeline: report → PRD → implementation → PR"
        echo "  full    - Run both review and auto (nightly loop)"
        echo "  loop    - Continue execution loop on existing prd.json"
        echo "  status  - Show current task status"
        echo ""
        echo "Examples:"
        echo "  ./scripts/run-compound.sh review    # Run after a day of work"
        echo "  ./scripts/run-compound.sh auto      # Let agent build something overnight"
        echo "  ./scripts/run-compound.sh full      # Both (typical nightly run)"
        ;;
esac
