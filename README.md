# Second Brain

A personal knowledge base maintained by an LLM agent, implementing the
[LLM Wiki pattern](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f).

Raw sources are immutable. The agent owns the wiki layer — reading sources, writing and
revising pages, cross-referencing, flagging contradictions, and keeping the index and log
current. The human curates sources, asks questions, and directs emphasis.

**`MANUAL.md` explains how to use it** — what each part does, what you do, what the agent
does, and how it helps. Start there.

**`CLAUDE.md` is the schema** — page formats, domains, tag vocabulary, and the ingest,
query, and lint workflows. The agent reads this; you generally don't need to.

```
second-brain/          <- Claude opens this (repo root)
├── CLAUDE.md          the schema — how the agent behaves
├── MANUAL.md          how to use this — start here
├── setup.sh           one-time setup on a new machine
└── Second Brain/      <- Obsidian opens this (the vault)
├── index.md           catalog, by domain then category
├── log.md             append-only activity record
├── raw/inbox/         drop sources here — the only folder you touch
├── raw/               processed sources, immutable
└── sources/ entities/ concepts/ syntheses/ questions/
```

## Set up on a new machine

```bash
git clone https://github.com/dhvaneshadhiya-ui/second-brain.git
cd second-brain
./setup.sh
```

`setup.sh` writes `~/.claude/CLAUDE.md` with the correct local path, so every Claude Code
session on that machine knows the vault exists. Then open the inner `Second Brain/` folder
as a vault in Obsidian, and open `second-brain/` in Claude.

## Update a machine that already has it

Open this folder in Claude and say **"update my second brain"**. Claude pulls the latest and
re-runs `setup.sh`, which refreshes `~/.claude/CLAUDE.md` — that file lives outside the repo
because it holds a machine-specific path, so it never updates via pull.

## Daily use

| | |
|---|---|
| Add a source | Drop any file in `raw/inbox/`, say **"ingest this"** |
| Ask something | **"what do we know about X?"** — answers cite wiki pages |
| Health check | **"lint the wiki"** |
| Save your work | **"commit"** |

Pull before you start on a second machine; push when you finish. Git sync is manual —
Obsidian Sync handles continuous cross-device reading if you want both.
