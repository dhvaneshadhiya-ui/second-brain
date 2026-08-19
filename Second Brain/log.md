---
type: log
title: Activity Log
created: 2026-08-18
---

# Activity Log

Append-only. Newest entries at the bottom. Every entry header follows the format
`## [YYYY-MM-DD] <op> | <title>` so the log stays greppable:

```bash
grep "^## \[" log.md | tail -5
```

---

## [2026-08-18] setup | Wiki initialized

Created the schema (`CLAUDE.md`), this log, `index.md`, and the folder structure:
`raw/{inbox,assets}`, `sources/`, `entities/`, `concepts/`, `syntheses/`, `questions/`.
Git initialized at the repo root. No sources ingested yet.

## [2026-08-18] setup | Domain layer added

Wiki scoped as multi-domain (tech, seo, personal, plus `dd-<topic>` deep dives and
`cross` for connections that span domains). Added §2.5 to `CLAUDE.md`, a `domain:`
frontmatter field, a domain-classification step in the ingest workflow, and a rule to
hunt for cross-domain connections on every ingest. Reorganized `index.md` by domain.

## [2026-08-18] ingest | LLM Wiki pattern document

Source #1, domain `system`. The founding document of this wiki, supplied directly rather
than clipped. Filed to `raw/meta/llm-wiki.md`.

Created 10 pages: source [[llm-wiki-pattern]]; concepts [[compounding-knowledge-base]],
[[retrieval-augmented-generation]], [[wiki-maintenance-burden]], [[memex]]; entities
[[obsidian]], [[qmd]]; questions [[when-does-the-index-stop-scaling]],
[[does-cross-domain-synthesis-pay-off]]; synthesis
[[why-this-wiki-is-structured-this-way]].

No contradictions — first source. Two internal tensions recorded on the source page
(human-authorship boundary; abstraction vs. unfalsifiability). Deleted Obsidian's
`Welcome.md` boilerplate. Index rebuilt with a `meta` domain section.

## [2026-08-18] ingest | How To Build A Second Brain With Claude

Source #2, domain `system`. YouTube Short by [[structure-webworks]], published 2026-06-12;
a business/SOP variant of the pattern. Filed to
`raw/meta/second-brain-with-claude-yt-short.md`.

Created 5: source [[how-to-build-a-second-brain-with-claude]]; concept
[[knowledge-base-audit]]; entities [[andrej-karpathy]] (`tech`), [[structure-webworks]]
(`seo`); synthesis [[second-brain-implementations-compared]].

Updated 5: [[llm-wiki-pattern]] (authorship corrected — see below), [[obsidian]],
[[compounding-knowledge-base]], [[wiki-maintenance-burden]],
[[why-this-wiki-is-structured-this-way]].

**Correction.** [[llm-wiki-pattern]] was filed as "anonymous author, undated." This source
credited Andrej Karpathy; the gist was fetched and verified directly — owner, title, date
(2026-04-04), and all eight section headings match the raw file. Source page corrected
with a provenance section; first demonstration of the wiki closing its own gap.

**Schema change.** Added a rule to `CLAUDE.md`: raw filenames must never collide with
wiki page filenames — hit this live, since the raw file and its source page both wanted
the same basename. Raw file renamed with a `-yt-short` suffix.

## [2026-08-18] refactor | Simplified structure

Collapsed `raw/` domain subfolders (`meta`, `tech`, `seo`, `personal`) — processed sources
now sit flat in `raw/`. They mirrored the domain field into the filesystem for no benefit
and made the vault look like it demanded filing decisions the human never actually makes.

Renamed domain `meta` → `system` (13 pages) — plainer name for "how this second brain
works."

Added to `CLAUDE.md`: domains are a frontmatter field and never a folder; and a hard rule
that the human's entire surface is drop-a-file / ask / read. Prompted by the human asking
why there were six folders in `raw/`. Correct question.

## [2026-08-18] refactor | Tag vocabulary closed

Audited tags: 36 distinct across 15 pages, 30 used exactly once, with `tool`/`tooling`
and `llm`/`llm-agents` duplicating. A swamp forming at 15 pages.

Replaced with a closed 9-value vocabulary marking **state, not topic** — `thin-sourcing`,
`needs-verification`, `contradiction`, `watching`, `stale-risk`, `actionable`, and
`primary`/`secondary`/`promotional` for source weight. Topics stay with domains, pages,
and wikilinks. 5 of 15 pages now correctly carry no tags at all.

Also recorded in `CLAUDE.md`: never ask the human to categorize or tag a drop; infer it
and state the reasoning so it can be corrected in one word.

## [2026-08-18] refactor | Domains became a list

`domain: <one>` → `domains: [<one or more>]` across all 15 pages. A source can now carry
every domain it is genuinely relevant to; the old schema forced a single primary and
silently dropped the rest, which is information loss at the exact point the wiki is
supposed to be capturing connections. Prompted by the human.

Consequence: **the `cross` domain is gone.** A page carrying 2+ domains *is* the
cross-domain case, which makes the bet in [[does-cross-domain-synthesis-pay-off]]
countable from frontmatter instead of dependent on a folder. That page rewritten
accordingly; currently 3 of 15 pages carry two domains, all of them artifacts of this
wiki examining itself.

`index.md` now lists a page once **per domain it carries**, with an *(also `x`)* marker.
`CLAUDE.md` §2.5, the frontmatter spec, ingest step 2, the index rule, and hard rule 5 all
updated — rule 5 now distinguishes one subject per page (still true) from one domain per
page (no longer true).

## [2026-08-18] refactor | Domains opened up; global pointer added

Made explicit in `CLAUDE.md` that domains are open-ended and created by the agent without
asking — `tech`/`seo`/`personal`/`system` are what exist today, not the permitted set. A
source about cooking gets `cooking`. Added one guardrail, learned from the tag swamp:
create a domain only when it is expected to accumulate, since a domain holding one page
forever is noise. Lint should propose merging domains that never grew.

Wrote `~/.claude/CLAUDE.md` — a 17-line pointer so every Claude Code session on this Mac
knows the vault exists, reads its schema before touching it, queries via `index.md`,
refuses to ingest from other directories, and never copies `personal` content out.
