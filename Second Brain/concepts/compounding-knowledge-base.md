---
type: concept
domains: [system]
title: Compounding Knowledge Base
created: 2026-08-18
updated: 2026-08-18
status: seed
confidence: medium
aliases: ["compiled wiki", "persistent wiki", "compounding artifact"]
tags: []
sources: ["[[llm-wiki-pattern]]"]
---

# Compounding Knowledge Base

A knowledge store in which understanding is **compiled once and then maintained**,
rather than re-derived on each query. New material is not merely indexed for later
retrieval — it is read, integrated into existing pages, cross-referenced against prior
claims, and used to revise or challenge the standing synthesis. The artifact gets
richer with every source added and every question asked.

This is the central idea of [[llm-wiki-pattern]] and the reason this wiki exists.

## The compounding mechanism

Three things accumulate that a query-time retrieval system never keeps:

1. **Cross-references.** Connections between sources are made once, at ingest, and
   persist. A question that spans five documents does not need to rediscover how they
   relate — the links are already drawn.
2. **Resolved contradictions.** When a new source disagrees with an existing claim, the
   disagreement is recorded on both pages at ingest time, with dates and sources. The
   tension is visible thereafter instead of silently averaging out in a generated answer.
3. **Standing synthesis.** Pages hold a current best view that already reflects
   everything read. Answering a question means reading a conclusion, not rebuilding one.

The contrast case is [[retrieval-augmented-generation]], where none of these persist.

## Cost structure

The trade is **front-loaded cost for cheap reads**. Ingest is expensive — one source
plausibly touching 10–15 pages (per [[llm-wiki-pattern]]) — and query is cheap, because
the work is already done. RAG inverts this: ingest is nearly free, and every query pays
full price for synthesis that is thrown away immediately after.

This only pays off when the same body of knowledge is queried repeatedly over time. For
a one-off question against documents you will never revisit, RAG is the correct tool and
this pattern is waste.

## Keeping the compiled artifact current

Compiling once is only half of it — a compiled artifact that is never rechecked becomes
confidently stale. Ingest keeps pages current as sources arrive, but nothing
systematically asks whether a standing page has been *invalidated*. That is the gap
[[knowledge-base-audit]] fills.

**Worked example, 2026-08-18.** [[llm-wiki-pattern]] was filed with its author unknown.
Two sources later that gap was closed and the page corrected in place, with the
correction dated and the verification recorded. Any future question about the pattern's
origin reads a settled answer. Under [[retrieval-augmented-generation]] the same question
would re-search the corpus every time and return whatever the chunks happened to support.
Small, but it is the mechanism in miniature.

## What makes it viable now

The compounding only holds if maintenance actually happens on every ingest. Historically
it did not — see [[wiki-maintenance-burden]]. The claim of [[llm-wiki-pattern]] is that
an LLM drives maintenance cost near enough to zero that the artifact stays current.

## Relations

- [[retrieval-augmented-generation]] — the approach this is defined against.
- [[wiki-maintenance-burden]] — why this failed before LLMs; the enabling condition.
- [[memex]] — the 1945 antecedent, with the same gap unfilled.
- [[llm-wiki-pattern]] — the source that names and specifies this.

## Open questions

- At what corpus size does integration quality degrade — when the agent can no longer
  hold enough of the wiki in view to know what a new source *should* touch? Related to
  [[when-does-the-index-stop-scaling]], but distinct: that one is about *finding* pages,
  this one is about *knowing they exist to update*.
- Does compounding survive contradictory sources at volume, or does the wiki converge on
  whichever claim was ingested most recently?
