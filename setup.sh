#!/usr/bin/env bash
# Sets up this Second Brain on a new machine.
# Run once after cloning:  ./setup.sh
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VAULT="$REPO/Second Brain"
POINTER="$HOME/.claude/CLAUDE.md"

[ -d "$VAULT" ] || { echo "error: vault not found at $VAULT"; exit 1; }

if [ -f "$POINTER" ] && ! grep -qF "$REPO" "$POINTER"; then
  cp "$POINTER" "$POINTER.bak.$(date +%Y%m%d%H%M%S)"
  echo "note: existing ~/.claude/CLAUDE.md backed up"
fi

mkdir -p "$HOME/.claude"
cat > "$POINTER" <<EOF
# Second Brain

An LLM-maintained knowledge wiki lives at \`$REPO\`.

- **Read \`$REPO/CLAUDE.md\` before touching it.** It defines the schema, page
  formats, domains, tag vocabulary, and workflows. Do not guess at them.
- **To query it:** start with the vault's \`index.md\` to locate pages, then drill in.
  Answer with citations to specific pages, and say plainly where the wiki is silent
  rather than filling gaps from general knowledge.
- **Do not ingest sources or write wiki pages from another directory.** Ingest is a
  supervised workflow that belongs in a session opened at that path. If the user wants to
  ingest something from elsewhere, tell them to open a session there.
- **Never copy \`personal\`-domain content out of the vault**, or into any outward-facing
  output, without being asked.

This is a pointer, not a standing instruction to use it. If the current task has nothing
to do with the user's accumulated knowledge, ignore this file entirely.
EOF

echo "✓ wrote $POINTER  →  $REPO"
echo
echo "Next:"
echo "  1. Open Obsidian → Open folder as vault → select:"
echo "     $VAULT"
echo "  2. Start Claude Code from:  $REPO"
echo "  3. Before working:  git pull     After ingesting:  say \"commit\""
