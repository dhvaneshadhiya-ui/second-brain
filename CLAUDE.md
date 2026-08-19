# LLM Wiki — Schema & Operating Manual

This repository is a **personal knowledge base maintained by an LLM**. You (the agent)
own the wiki layer entirely. The human curates sources, asks questions, and directs
emphasis. You do the reading, summarizing, cross-referencing, filing, and bookkeeping.

Read this file at the start of every session. Update it when we agree a convention
has changed — it is co-evolved, not frozen.

---

## 1. The three layers

| Layer | Path | Who writes it | Mutability |
|---|---|---|---|
| **Raw sources** | `Second Brain/raw/` | The human (drops files in) | **Immutable — never edit, never delete** |
| **The wiki** | `Second Brain/{sources,entities,concepts,syntheses,questions}/` | You, the agent | Continuously revised |
| **The schema** | `CLAUDE.md` (this file) | Both, by agreement | Rarely |

The Obsidian vault root is `Second Brain/` (nested one level inside the repo root).
**All wiki paths below are vault-relative.** The repo root holds only `CLAUDE.md`,
`.gitignore`, and the vault.

---

## 2. Directory map

```
Second Brain/                 <- Obsidian vault root
├── index.md                  <- content catalog; the map of the wiki
├── log.md                    <- chronological, append-only activity record
├── raw/
│   ├── inbox/                <- the human drops anything here; the ONLY folder they touch
│   ├── assets/               <- images and attachments (Obsidian attachment folder)
│   └── *.md, *.pdf, ...      <- processed sources, flat. No subfolders.
├── sources/                  <- one page per ingested source
├── entities/                 <- people, orgs, products, places, tools
├── concepts/                 <- ideas, mechanisms, themes, patterns
├── syntheses/                <- cross-source analyses, comparisons, evolving theses
└── questions/                <- open questions and research threads
```

### Naming
- Filenames: `kebab-case.md`. No dates or numbers in the name unless the name needs
  them (`ios-26-release.md` is fine; `2026-08-18-notes.md` is not).
- **Filenames must be unique across the whole vault** so bare `[[wikilinks]]` resolve
  unambiguously.
- Source pages mirror the source: `sources/how-llms-compress-knowledge.md`.
- **A raw filename must never equal a wiki page filename.** They live in one Obsidian
  namespace, so a collision makes bare `[[wikilinks]]` resolve to the wrong file. When
  filing a raw source whose natural name matches its source page, give the raw file a
  distinguishing suffix (`-yt-short`, `-transcript`, `-pdf`).
- Entity pages use the canonical name, not an alias: `entities/anthropic.md`, and note
  aliases in frontmatter so future ingests don't create a duplicate.

---

## 2.5 Domains

This wiki is multi-domain. Every page carries a **`domains:` list — one or more values.**
Domains keep browsing legible without fragmenting the graph: the folder structure stays
flat so cross-domain links form naturally, and `index.md` is organized **by domain first,
then category**.

**A page belongs to every domain it is genuinely relevant to, not just its main subject.**
An article on AI search and its effect on publishers is `[tech, seo]` — filing it under
one loses the reason the other would ever want it. Be honest rather than generous: add a
domain when someone working in that domain would want this page, not merely when the
words overlap.

**Domains are open-ended.** The list below is what exists today, not a fixed set:

| `domain:` | Covers | Typical entities | Typical syntheses |
|---|---|---|---|
| `tech` | Tech and industry research — products, companies, launches, market moves | companies, products, people | evolving theses on where a market is heading |
| `seo` | Content and SEO strategy — competitors, keywords, algorithm changes, performance | competitor sites, formats, platforms | what actually drives traffic, and why |
| `personal` | Goals, health, psychology, habits, self-improvement | people, practices, protocols | a structured, evolving picture of the human |
| `system` | How this second brain works — the pattern, tooling, design decisions | tools, authors | comparisons of approaches |

**Create new domains freely and without asking.** A source about cooking gets `cooking`;
one about a legal matter gets `legal`; a client project gets its own slug. Never distort a
source to fit an existing domain, and never ask the human to name or approve one — infer
it, create it, and state what you did. Add it to this table and to `index.md` in the same
pass.

**Deep dives** use the prefix `dd-<topic>` (e.g. `dd-vision-pro`) — for a subject that will
absorb many sources over weeks and deserves its own standing thesis.

The one discipline: **create a domain when you expect it to accumulate**, not for a single
stray source. Domains are for browsing a body of related pages; a domain holding one page
forever is noise, and the same sprawl that ruins tags ruins domains. A one-off sits in the
nearest honest domain instead. During a lint pass, propose merging domains that never grew
and splitting any that got too broad to scan.

**Domains are a frontmatter field, never a folder.** They exist to organize `index.md`
for reading. The human never files anything by domain and must never be asked to — they
drop sources in `raw/inbox/` and that is the entirety of their filing burden. Do not
mirror domains into the filesystem.

### Cross-domain connections are the payoff
A single-domain wiki is just organized notes. The value here is what crosses domains — a
tech shift that opens an SEO opportunity, a research finding that bears on a personal
goal, a competitor's move that validates a thesis. **On every ingest, explicitly look for
relevance to the other domains and surface it**, even when the source sits squarely in one.

There is no separate `cross` domain: **a page carrying two or more domains is the
cross-domain case**, and that is measurable — count pages with `len(domains) > 1`. When a
connection is substantive enough to need explaining rather than just labelling, that is
when it earns its own `syntheses/` page carrying both domains.

### Privacy
`personal` pages may hold sensitive material.

**Decided 2026-08-18:** the whole vault, `personal` included, is backed up to the private
repo `dhvaneshadhiya-ui/second-brain`. That remote is in scope and needs no confirmation.

**Everywhere else is out of scope.** Do not publish, share, paste, or send `personal`
content anywhere beyond the vault and that remote without being asked — no artifacts, no
external services, no other repos, no summaries into unrelated outputs. Flag it if a
request would do so incidentally rather than silently complying.

If the human says a specific source should not leave this disk, gitignore that file and
its wiki pages, and note it here.

---

## 3. Page format

Every wiki page opens with YAML frontmatter, then an H1, then the body.

```yaml
---
type: source | entity | concept | synthesis | question
domains: [tech]                           # a LIST — one or more; see §2.5
title: Human Readable Title
created: YYYY-MM-DD
updated: YYYY-MM-DD
status: seed | developing | stable        # non-source pages
confidence: high | medium | low           # pages making contestable claims
aliases: []                               # other names this thing goes by
tags: []
sources: []                               # [[wikilinks]] to source pages backing this
---
```

`created` is set once. `updated` is bumped on every edit. `sources` is the citation
trail — it is what makes the wiki auditable, so keep it accurate.

### Template — source page
```markdown
# <Title>

> **Source:** <author / publication>, <date> · [[<raw-filename>|raw file]] · <URL if any>
> **Ingested:** YYYY-MM-DD

## Summary
Three to six sentences. What this source is and what it argues.

## Key takeaways
- Substantive, specific claims. Not topic labels.

## Notable details
Numbers, quotes, definitions, and specifics worth retrieving later.

## Connections
How this relates to what the wiki already holds. Wikilink generously.

## Contradictions & tensions
Where this source disagrees with existing pages. Name both sides and both sources.
Omit the section only if there genuinely are none.

## Open questions
What this raises that the wiki cannot yet answer. Feed these into `questions/`.
```

### Template — entity / concept page
```markdown
# <Name>

One-paragraph definition that stands on its own.

## <Thematic sections — vary by subject>
Claims, each traceable to a source. Cite inline: `(per [[source-page]])`.

## Relations
- [[other-page]] — how they relate, in a clause.

## Open questions
```

### Template — synthesis page
```markdown
# <Question or thesis>

## Current view
The best answer the wiki can give today, stated plainly.

## Evidence
Grouped by claim, each with citations.

## Counter-evidence & uncertainty
## What would change this view
## Sources drawn on
```

### Tags: a closed vocabulary, for state — never for topics

**Topics are handled by domains, pages, and wikilinks. Tags are not for topics.** A tag
like `#knowledge-management` on seven pages tells you nothing you could not get by
opening the domain section of [[index]], and topical tags sprawl until the tag pane is
noise. Do not invent them.

Tags mark **the exceptions that need action**. Most pages should carry none — an empty
`tags: []` is the normal, correct state. Only these values are permitted:

| Tag | Meaning | What it drives |
|---|---|---|
| `thin-sourcing` | Rests on one source, or on sources that are not independent | Find more sources before trusting it |
| `needs-verification` | Contains a specific claim that should be checked against a primary source | A verification pass |
| `contradiction` | Records a conflict between sources that is not yet resolved | Resolve, or find a tiebreaking source |
| `watching` | An open bet with a stated revisit trigger | Check when the trigger fires |
| `stale-risk` | Standing claim whose supporting sources are aging | A [[knowledge-base-audit]] pass |
| `actionable` | Contains something the human could actually do, not just know | Surface it to them |
| `primary` | *(source pages)* The thing itself — original document, raw data | Weight heavily |
| `secondary` | *(source pages)* Reports on or interprets something else | Weight less; chase the primary |
| `promotional` | *(source pages)* Selling something; claims are unargued | Treat claims as assertions, not evidence |

Adding a tag to this table requires the same test each existing one passes: **it answers
"what do I need to do about this page?"** If it only answers "what is this page about,"
it is a topic — leave it out.

Remove a tag when its condition is resolved. `needs-verification` disappears when the
claim is verified; the verification itself gets recorded on the page.

### Writing rules
- **Cite everything contestable.** A claim with no traceable source is a liability.
- Distinguish *what a source claims* from *what is established*. Use "X argues…" for
  the former.
- Prefer specifics over abstraction. "Retention rose from 31% to 44% over six months"
  beats "retention improved significantly."
- Never invent detail to fill a template section. Drop the section instead.
- Wikilink on first mention of any entity or concept that has (or deserves) a page.
- Keep prose dense. This is a reference, not an essay.

---

## 4. Workflow: INGEST

Trigger: human drops a file into `raw/inbox/` and says "ingest this" (or pastes a URL).

**Never ask the human to categorize, tag, or file what they drop.** Classification is
inferred from the content — that is the agent's work (§2.5, hard rule 7). If they
volunteer a hint ("this is for the CrestWall project", a word in the filename, a note at
the top of the file), treat it as authoritative and stop guessing. If they don't, infer
it and state your reasoning in step 2 so they can correct it in one word.

**Default mode is one-at-a-time and conversational.** Batch only when explicitly asked.

1. **Read the source in full.** If it references local images in `raw/assets/`, read
   the text first, then view the images that matter in a second pass.
2. **Assign domains** (§2.5) — *all* that apply, not just the obvious one. Say which and
   why. Listing the first is easy; the value is in noticing the second.
3. **Discuss before writing.** Report back: what this source is, the 3–6 things that
   matter in it, which existing pages it touches, anything that contradicts what the
   wiki already holds, and **any connection into a different domain**.
   **Wait for direction on emphasis before writing pages.**
4. **File the raw file** out of `raw/inbox/` into `raw/`, unchanged. Flat — no subfolders.
5. **Write the source page** in `sources/`.
6. **Propagate.** Update every entity, concept, and synthesis page the source touches.
   Create new pages for entities and concepts that now warrant one (rule of thumb: it
   appears in two or more sources, or it is load-bearing in one).
7. **Flag contradictions explicitly** on both pages involved. Never silently overwrite
   an older claim — supersede it in place and say what superseded it and when.
8. **Update `index.md`** with every page created, and revise one-line summaries of
   pages materially changed.
9. **Append to `log.md`.**
10. **Report** the touched-file list to the human.

A single source commonly touches 8–15 pages. That is normal and expected.

## 4.5 Workflow: UPDATE

Trigger: "update my second brain", "pull the latest", "get the newest version", or opening
a session on a machine that has been idle for a while.

The human does not run commands. Run these and report what changed:

1. `git pull` in the repo root. If it refuses because of local work, commit that first,
   then pull. Never discard their work to make a pull succeed.
2. `./setup.sh` — **always, even when the pull changed nothing visible.** It regenerates
   `~/.claude/CLAUDE.md`, which lives outside the repo because it holds a machine-specific
   path and therefore never arrives via pull. Skipping this leaves the machine following
   schema rules that were deleted elsewhere.
3. Report what actually changed: new pages, schema changes, anything affecting how they
   work.

## 5. Workflow: QUERY

1. Read `index.md` first to locate relevant pages, then drill into them. Grep the
   vault for terms the index may not surface.
2. Answer with **inline citations to wiki pages**, and note where the wiki is thin
   or silent rather than filling the gap from general knowledge. If you do draw on
   knowledge outside the wiki, say so explicitly.
3. **Offer to file good answers back into the wiki** as a `syntheses/` or `questions/`
   page. Explorations should compound, not evaporate into chat history.
4. Output format follows the question — prose, a comparison table, a checklist. Ask
   before generating anything heavier (deck, chart).

## 6. Workflow: LINT

Trigger: "lint the wiki". Read broadly, then report — do not fix silently.

Check for:
- **Contradictions** between pages that no page acknowledges.
- **Stale claims** superseded by newer sources but never revised.
- **Orphans** — pages with no inbound links.
- **Ghosts** — `[[wikilinks]]` pointing at pages that do not exist.
- **Missing pages** — concepts referenced repeatedly across sources with no page.
- **Thin citations** — contestable claims with an empty `sources:` list.
- **Index drift** — pages missing from `index.md`, or summaries that no longer match.
- **Gaps** — questions the wiki almost answers; suggest specific sources to find.

**Exclude `raw/` from ghost-link and orphan checks.** Clipped sources carry their own
frontmatter wikilinks (author names, tags) that point at pages which will never exist.
Those are artifacts of the clipper, not wiki defects.

Report findings grouped by severity with a proposed fix for each. Apply on approval.
Log the pass in `log.md`.

---

## 7. index.md and log.md

**`index.md` is content-oriented** — the catalog. It is organized **by domain, then by
category**, as `- [[page-name]] — one-line summary`. A page appears **once per domain it
carries**, so a `[tech, seo]` page is listed under both. That repetition is the point: it
is a finding aid, not a database, and someone scanning `seo` should see everything
relevant to SEO regardless of what a page is *mainly* about. Sources additionally carry
their date. Update it on every ingest, in the same pass. An index that lags the wiki is
worse than no index.

**`log.md` is chronological** — append-only, newest at the bottom. Never rewrite history.
Every entry starts with a fixed-format header so the log stays greppable:

```
## [YYYY-MM-DD] <ingest|query|lint|refactor> | <short title>
```

so that `grep "^## \[" log.md | tail -5` shows recent activity. Under the header: two
to four lines on what happened and which pages were touched.

---

## 8. Hard rules

1. **Never modify or delete anything in `raw/`.** Moving a file between `raw/` folders
   is allowed; changing its contents is not.
2. **Never fabricate a citation.** If unsure which source a claim came from, mark it
   `confidence: low` and flag it.
3. **The human does not write the wiki.** If they hand you a note, ingest it as a
   source rather than pasting it in as a page.
4. **Update the index in the same pass as the pages.** Not later.
5. **One subject per page, but as many domains as genuinely apply.** These are different
   things. A page covering two unrelated *subjects* should be split. A page on one
   subject that matters to two *domains* is correct and desirable — give it both.
6. **Ask before restructuring** — renaming categories, mass-moving pages, changing the
   frontmatter schema.
7. **Keep the human's surface area minimal.** Their entire interface is: drop a file in
   `raw/inbox/`, say what they want, read pages in Obsidian. Any structure that asks them
   to categorize, name, or file something is a design failure — absorb it into the agent's
   work or delete it.
8. **Commit only when asked.** Git is set up; the human decides when to snapshot.

## 9. Tooling

- Obsidian is the reader: graph view for shape, backlinks for connections.
- Attachments go to `raw/assets/` (Obsidian → Settings → Files and links → Attachment
  folder path).
- Search is `grep` over the vault plus `index.md`. If the wiki outgrows that (~100+
  sources), consider adding [qmd](https://github.com/tobi/qmd) and note it here.
