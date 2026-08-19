---
type: synthesis
domains: [system]
title: Why this wiki is structured this way
created: 2026-08-18
updated: 2026-08-18
status: developing
confidence: high
tags: []
sources: ["[[llm-wiki-pattern]]", "[[how-to-build-a-second-brain-with-claude]]"]
---

# Why this wiki is structured this way

`CLAUDE.md` states the rules. This page records **why** — which decisions came from
[[llm-wiki-pattern]], which were judgment calls made in setting this wiki up, and which
are bets that could turn out wrong. Revise it when a rule changes.

## Current view

The structure is a faithful implementation of [[llm-wiki-pattern]] with **one
substantial addition**: a domain layer, because this wiki is deliberately multi-domain
where the source assumes a single subject.

## Adopted directly from the source

| Decision | Rationale |
|---|---|
| Three layers: immutable `raw/`, agent-owned wiki, co-evolved schema | Ownership boundaries are what keep the wiki trustworthy — a page whose provenance is ambiguous cannot be audited |
| Human never writes wiki pages | Stated emphatically in the source. Human-authored material is ingested as a *source* instead, preserving the citation trail |
| `index.md` content-oriented, `log.md` chronological | Two files answering different questions: *what is in here* vs *what happened when* |
| Greppable log headers `## [YYYY-MM-DD] op \| title` | Adopted verbatim, including the `grep "^## \[" log.md \| tail -5` idiom |
| Ingest / query / lint as the three operations | The complete operational surface |
| Filing good query answers back as pages | Closes the loop that normally lets chat research evaporate |
| Flag contradictions rather than overwrite | This is the property RAG cannot have; see [[compounding-knowledge-base]] |
| No search infrastructure yet | Source claims index + grep suffices to ~100 sources; see [[when-does-the-index-stop-scaling]] |
| Git, but commit only on request | Version history matters when an agent rewrites 15 files at once |

## Judgment calls not specified by the source

**Five categories: `sources`, `entities`, `concepts`, `syntheses`, `questions`.** The
source lists page kinds loosely. `questions/` as a first-class category is the notable
addition — the source treats open questions as an *output* of the lint pass, but making
them durable pages means research threads survive between sessions instead of being
regenerated. [[does-cross-domain-synthesis-pay-off]] is the immediate justification: it
is a bet that needs to be watched over months.

**Flat folders with `domain:` in frontmatter, rather than per-domain subfolders.** The
value of this pattern is the link graph; nesting `entities/tech/` and `entities/personal/`
would encourage the agent to file within a silo and never link across. The index does the
separation for *browsing*; the graph stays whole for *thinking*.

**Discuss-before-write as the ingest default.** The source presents supervised and batch
ingest as equal options and states a personal preference for supervised. Adopted as the
default because early ingests set the vocabulary and page boundaries the whole wiki
inherits — errors there are expensive to unwind. Revisit once conventions are stable.

**Explicit `confidence:` and `status:` frontmatter.** Not in the source. Added because
the honest failure mode of an LLM-maintained wiki is *confident plausible error* (see
[[wiki-maintenance-burden]]), and a page that cannot express its own uncertainty will
launder guesses into facts.

## Alternatives considered and not taken

**A separate top-level `clippings/` folder**, as in
[[how-to-build-a-second-brain-with-claude]], splitting material we already own from
material collected outside. Not adopted — the `domain:` field and each source page's
provenance line already carry that distinction, and a second intake folder would
duplicate it. But the insight behind it is sound, and it becomes load-bearing if
[[knowledge-base-audit]] is ever adopted: that operation requires knowing whether a page
states *our* position or *the world's*, which is currently implicit here rather than
structural. Full comparison at [[second-brain-implementations-compared]].

**A one-shot generated schema.** Rejected on the evidence of this session — `CLAUDE.md`
was revised three times on day one (domain layer, lint scope for `raw/`, raw-filename
collision rule), none of which a generic setup prompt would have anticipated.

## The bets

Three things could be wrong, in rough order of consequence:

1. **That maintenance cost is really near zero.** The load-bearing claim of
   [[wiki-maintenance-burden]]. If ingest quality degrades as the wiki grows, the whole
   thing reverts to an ordinary abandoned wiki — just one that took less effort to abandon.
2. **That one graph beats four.** Tracked at [[does-cross-domain-synthesis-pay-off]].
   Reversible, but only cheaply in one direction.
3. **That a hand-maintained index scales far enough.** Tracked at
   [[when-does-the-index-stop-scaling]]. Cheapest to fix — the answer is [[qmd]] or a
   search script.

## What would change this view

- A lint pass that turns up systematic drift → tighten the ingest workflow, or reduce the
  blast radius per source.
- An empty `cross` section at 20 sources → split the vault by domain.
- Ingests that routinely miss pages they should have touched → build search.
- A page going stale without lint catching it → adopt [[knowledge-base-audit]] as a
  fourth operation and make the own-vs-external distinction structural.

## Sources drawn on

- [[llm-wiki-pattern]] — the founding document; every "adopted" row traces to it.
- [[how-to-build-a-second-brain-with-claude]] — the alternative structure weighed above.
