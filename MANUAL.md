# Second Brain — Manual

Everything about how this system works, what each part does, and what it asks of you.
`CLAUDE.md` is the schema the agent follows; this is the human-facing explanation.

---

## 1. What this is

A knowledge base where an LLM reads your sources and **compiles** them into a wiki of
interlinked markdown pages — then keeps those pages current as more sources arrive.

The difference from everything else you've tried:

| | What happens | What accumulates |
|---|---|---|
| Bookmarks | Saved, never reopened | Nothing |
| Notes app | You write, rarely reread | A pile |
| ChatGPT file upload | Answers once from chunks | Nothing — thrown away after each answer |
| **This** | Agent reads, writes pages, links them, flags conflicts | **Everything, permanently** |

When you ask a question here, you aren't asking an agent to read twenty articles. You're
asking it to read pages that already know — where the cross-references are drawn, the
contradictions are flagged, and the synthesis already reflects everything ingested.

---

## 2. Who does what

**You** — find sources, drop them in `raw/inbox/`, say what you want, steer emphasis
during ingest, ask questions, read the results. That's the entire job.

**Claude** — reads sources in full, decides what they're about, writes and revises every
wiki page, maintains cross-references, flags contradictions between sources, updates the
index and log, commits to git when asked. Claude owns the wiki layer completely.

**Obsidian** — displays it. Graph view, backlinks, tag pane, search, and cross-device
reading via Obsidian Sync. Obsidian never changes anything on its own.

**Git** — records every version. Makes it safe for an agent to rewrite fifteen files in
one pass, because you can always see exactly what changed and undo it.

You never file, name, categorize, or tag anything. If any part of this starts asking you
to, that's a design failure — say so and it gets absorbed into the agent's work.

---

## 3. The three layers

**Raw sources** (`raw/`) — immutable. The agent reads them and never edits them. Your
source of truth.

**The wiki** (`sources/ entities/ concepts/ syntheses/ questions/`) — written entirely by
the agent. Continuously revised.

**The schema** (`CLAUDE.md`) — how the agent behaves. Co-evolved by both of you. It has
already been revised six times; that's the system working, not churn.

---

## 4. Where everything lives

```
second-brain/                  <- Claude opens this (repo root)
├── CLAUDE.md                  the schema — how the agent behaves
├── MANUAL.md                  this file
├── README.md                  short intro, setup on a new machine
├── setup.sh                   one-time setup on a new machine
└── Second Brain/              <- Obsidian opens this (the vault)
    ├── index.md               catalog, by domain then category
    ├── log.md                 append-only record of everything that happened
    ├── raw/
    │   ├── inbox/             YOU DROP FILES HERE. The only folder you touch.
    │   ├── assets/            images, downloaded by Obsidian
    │   └── *.md, *.pdf        processed sources, flat, never edited
    ├── sources/               one page per ingested source
    ├── entities/              people, companies, products, tools, places
    ├── concepts/              ideas, mechanisms, themes, patterns
    ├── syntheses/             cross-source analysis and evolving positions
    └── questions/             open threads being tracked over time
```

The **outer** folder (`second-brain`) is the git repo — Claude opens that. The **inner**
folder (`Second Brain`) is the Obsidian vault — Obsidian opens that. Renamed 2026-08-18
because two identically-named nested folders was a trap.

---

## 5. The five page types

**`sources/`** — one page per thing you ingested. Summary, key takeaways, notable
details, connections, contradictions, open questions. A permanent record of what that
source said. Never revised to reflect later knowledge.

**`entities/`** — a person, company, product, tool, place. Facts accumulate here across
many sources, each claim cited to the source it came from.

**`concepts/`** — an idea, mechanism, or pattern. Where understanding compounds most:
each new source deepens or challenges what's written.

**`syntheses/`** — the payoff pages. A position built from multiple sources: current
view, evidence, counter-evidence, and what would change the view. These get revised as
sources accumulate.

**`questions/`** — open threads. Things the wiki can't answer yet, with what would settle
them. Stops research questions from evaporating between sessions.

Every page carries frontmatter: `type`, `domains`, `created`, `updated`, `status`,
`confidence`, and `sources` — the citation trail that makes the wiki auditable.

---

## 6. Domains

Every page carries a `domains:` **list** — every domain it's genuinely relevant to, not
just its main subject.

```yaml
domains: [tech, seo]     # an article on AI search and publishers
domains: [personal]      # a piece on sleep and focus
```

Domains are **open-ended**. Today: `tech`, `seo`, `personal`, `system`. Drop something
about cooking and `cooking` gets created. A client project gets its own slug. Deep dives
use `dd-<topic>`.

**You never assign these.** The agent infers them from the content and tells you what it
chose during the discuss step. Correct it in one word if it's wrong.

One discipline: a domain is created when it's expected to *accumulate*. A domain holding
one page forever is noise. One-offs sit in the nearest honest domain.

A page carrying two or more domains **is** the cross-domain case — which is the whole
reason everything lives in one wiki instead of several.

---

## 7. Tags

Tags mark **state, not topic**. Topics are handled by domains, pages, and links — tagging
them again is duplication that rots. Most pages carry no tags; that's correct.

| Tag | Means | What it drives |
|---|---|---|
| `thin-sourcing` | Rests on one source, or non-independent ones | Find more before trusting it |
| `needs-verification` | A claim here should be checked against a primary | A verification pass |
| `contradiction` | Unresolved conflict between sources | Resolve or find a tiebreaker |
| `watching` | An open bet with a revisit trigger | Check when it fires |
| `stale-risk` | Standing claim whose sources are aging | An audit pass |
| `actionable` | Something you could *do*, not just know | Surface it |
| `primary` | The thing itself — original document or data | Weight heavily |
| `secondary` | Reports on something else | Chase the primary |
| `promotional` | Selling something; claims unargued | Treat as assertion, not evidence |

Tags are removed when resolved. They're a work queue, not labels.

In Obsidian's tag pane, `#watching` is your review queue and `#needs-verification` is a
reading list the wiki generated for you.

---

## 8. What you say to it

| You say | What happens |
|---|---|
| **"ingest this"** | Reads the source, reports what's in it, waits for your direction, then writes and propagates across every page it touches |
| **"what do we know about X?"** | Reads the index, drills into pages, answers with citations to specific pages — and says where the wiki is silent |
| **"lint the wiki"** | Health check: contradictions, stale claims, orphan pages, broken links, missing pages, thin citations, index drift, gaps worth researching |
| **"does page X still hold up?"** | Checks a standing page against newer knowledge |
| **"commit"** | Snapshots to git and pushes to the private remote |

Query is the one people underuse. A good answer gets filed back as a page, so your
questions compound the same way your reading does.

---

## 9. An ingest, step by step

1. **You drop a file** in `raw/inbox/` — any format, any topic, no naming rules — and say
   *"ingest this."*
2. **The agent reads it in full.** Text first, then any images that matter.
3. **It assigns domains** and says which and why.
4. **It stops and reports**: what this source is, the 3–6 things that matter, which
   existing pages it touches, anything that contradicts what the wiki already holds, and
   any connection into another domain.
5. **You steer.** What to emphasize, what to ignore, what deserves its own page. This is
   the step that makes the wiki yours rather than generic.
6. **It writes.** Source page, then propagates — updating entities, concepts, syntheses,
   creating new pages where warranted, flagging contradictions on *both* sides.
7. **It updates** `index.md` and appends to `log.md` in the same pass.
8. **It reports** every file touched.

A single source commonly touches 8–15 pages. That's normal.

---

## 10. Getting sources in

**Obsidian Web Clipper** (browser extension) — clip an article, save to the vault, then
hit your *Download attachments for current file* hotkey to pull images local.

**Drag any file** into `raw/inbox/` — PDF, transcript, screenshot, spreadsheet, export.

**Paste a URL** in chat and the agent fetches it.

**Your own notes** — the most valuable material in here and the part no external tool
has. Don't paste them in as wiki pages; drop them as sources so they carry a citation
trail like anything else.

---

## 11. Reading it in Obsidian

**Graph view** — the shape of your knowledge. Hubs are what you know well; isolated dots
are orphans; clusters are where real expertise is forming.

**Backlinks** — at the bottom of every page: everything that references it. This is where
unexpected connections surface.

**Tag pane** — `#watching`, `#needs-verification`, `#thin-sourcing` as live work queues.

**Search** — plain text across everything, raw sources included.

Read while the agent works. Watching pages update in real time is the point of having
both windows open.

---

## 12. Git — the safety net

An agent that rewrites fifteen files in one pass is only safe because every version is
recorded.

```bash
git diff HEAD~1              # exactly what changed in the last ingest
git log --oneline            # every session
git checkout -- <file>       # undo a change to one page
git revert HEAD              # undo an entire ingest
```

Say **"commit"** after an ingest you're happy with. It snapshots and pushes to the private
repo `dhvaneshadhiya-ui/second-brain`.

`git diff` after an ingest is the single best habit here — it shows precisely what the
agent did to your wiki, in a form you can reject.

---

## 13. Two machines

```bash
git clone https://github.com/dhvaneshadhiya-ui/second-brain.git
cd second-brain
./setup.sh
```

`setup.sh` writes `~/.claude/CLAUDE.md` with that machine's correct path, so every Claude
session there knows the vault exists. Then open the inner folder as an Obsidian vault, and
open the outer folder in Claude.

**Git sync is manual** — `git pull` before you start, say *"commit"* when you finish. If
you want continuous cross-device reading, Obsidian Sync handles that separately and the
two coexist fine.

| | Reads | Writes |
|---|---|---|
| Claude desktop app | yes | yes |
| Claude Code CLI | yes | yes |
| Obsidian, any device with Sync | you read it | no |
| claude.ai web or mobile | **no** | **no** |

Ingest and query from the desktop app; read on your phone through Obsidian.

---

## 14. How this actually helps

**You stop losing things.** The article you read three months ago is a page with the
numbers intact and the source cited.

**Contradictions surface.** When source #14 breaks source #6's claim, it gets flagged on
both pages *at ingest time* — while the agent is actually looking at both. Neither of you
would catch it six weeks later.

**Questions get cheap.** "What do we know about X?" reads a compiled page instead of
re-reading twenty articles. The expensive work happened once.

**Positions become traceable.** A synthesis page shows the current view, the evidence, the
counter-evidence, and what would change it. When you disagree with your past self, the
reasoning is on the page.

**Cross-domain connections appear.** A tech shift that opens a content opportunity. A
research finding that bears on a personal goal. These are exactly the connections you'd
never file manually, because they never sit in the same folder or the same frame of mind.

**It compounds.** Ingest #1 touched 4 pages. Ingest #20 will touch 15 — every new source
gets evaluated against everything already there. The opposite of a notes folder, which
gets *less* useful per note as it grows.

---

## 15. When not to use it

- One-off lookups you'll never revisit — just ask, don't ingest
- Breaking news with no lasting relevance
- Anything you need answered once and then forgotten

The test: **will I have this question again, in a different form?** If no, skip it.
Ingest costs real minutes. Not everything deserves filing.

---

## 16. How this fails

**Scattering.** Five sources across five unrelated topics produces a nice-looking folder
that does nothing. Compounding needs density — sources that touch each other. Fifteen
sources on one subject is genuinely useful; fifteen sources on fifteen subjects is a
filing cabinet.

**Confident error.** An agent can be plausibly wrong at scale, and it writes fluently
either way. That's what `#thin-sourcing`, `#needs-verification`, `confidence:` fields, and
lint exist for. Don't trust a page because it reads well — check its `sources:` line.

**Abandonment.** If you stop feeding it, it's a folder of aging markdown. The system
removes the *maintenance* burden, not the *curation* one. Finding good sources is still
yours.

**Structure creep.** Anything that starts asking you to categorize or file is a failure —
say so and it gets removed.

---

## 17. Getting to critical mass

Pick **one** domain and go deep. Not two.

1. Feed it **5–8 sources on one topic**, one at a time. Mixed types are good — articles,
   competitor pages, a report, your own notes.
2. Then ask something hard. Not "summarize" — *"where do these sources disagree?"* or
   *"what does this imply for how we do X?"* Honest expectation: thin until roughly source
   6–8, then it clicks.
3. Then **lint it**. The wiki starts telling you what it's missing and what to go find —
   that's the loop closing, where it directs your reading instead of just absorbing it.
4. Around **20 sources**, settle the open bets below.

---

## 18. Open bets

Three things being tracked, each a page tagged `watching`:

**Does one wiki beat several?** Everything lives in one graph on the bet that cross-domain
connections are worth it. Measurable: count pages carrying 2+ domains. Currently 3 of 15,
all artifacts of the wiki examining itself. Revisit at 20 sources.

**Does the index keep scaling?** A hand-maintained `index.md` is claimed to work to ~100
sources. Signals it's breaking: an ingest misses a page it should have updated, duplicate
pages appear, or the index passes ~500 lines. Then we add search.

**Is maintenance really near-zero?** The load-bearing assumption. If ingest quality
degrades as the wiki grows, this reverts to an ordinary abandoned wiki.

---

## 19. Quick reference

```
Drop a file        raw/inbox/  →  say "ingest this"
Ask something      "what do we know about X?"
Health check       "lint the wiki"
Save               "commit"

Claude opens       Second Brain/            (outer, repo)
Obsidian opens     Second Brain/Second Brain/   (inner, vault)

New machine        git clone → cd → ./setup.sh
See what changed   git diff HEAD~1
Undo an ingest     git revert HEAD
```

**Your entire job:** drop files in `raw/inbox/`, say what you want, read the results.
Everything else belongs to the agent.
