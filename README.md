# Second Brain

A personal knowledge base maintained by an LLM agent, implementing the
[LLM Wiki pattern](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f).

Raw sources are immutable. The agent owns the wiki layer — reading sources, writing and
revising pages, cross-referencing, flagging contradictions, and keeping the index and log
current. The human curates sources, asks questions, and directs emphasis.

**`CLAUDE.md` is the schema** — page formats, domains, tag vocabulary, and the ingest,
query, and lint workflows. Read it before touching the wiki.

```
CLAUDE.md              the schema and operating manual
setup.sh               one-time setup on a new machine
Second Brain/          the Obsidian vault
├── index.md           catalog, by domain then category
├── log.md             append-only activity record
├── raw/inbox/         drop sources here — the only folder you touch
├── raw/               processed sources, immutable
└── sources/ entities/ concepts/ syntheses/ questions/
```

## Set up on a new machine

```bash
git clone https://github.com/dhvaneshadhiya-ui/second-brain.git "Second Brain"
cd "Second Brain"
./setup.sh
```

`setup.sh` writes `~/.claude/CLAUDE.md` with the correct local path, so every Claude Code
session on that machine knows the vault exists. Then open `Second Brain/Second Brain/` as
a vault in Obsidian, and start Claude Code from the repo root.

## Daily use

| | |
|---|---|
| Add a source | Drop any file in `raw/inbox/`, say **"ingest this"** |
| Ask something | **"what do we know about X?"** — answers cite wiki pages |
| Health check | **"lint the wiki"** |
| Save your work | **"commit"** |

Pull before you start on a second machine; push when you finish. Git sync is manual —
Obsidian Sync handles continuous cross-device reading if you want both.
