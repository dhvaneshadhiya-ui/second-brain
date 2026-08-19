---
type: question
domains: [system]
title: When does the index stop scaling?
created: 2026-08-18
updated: 2026-08-18
status: seed
confidence: low
tags: [watching]
sources: ["[[llm-wiki-pattern]]"]
---

# When does the index stop scaling?

[[llm-wiki-pattern]] claims a hand-maintained `index.md` catalog "works surprisingly well
at moderate scale (~100 sources, ~hundreds of pages)" and removes any need for
embedding-based retrieval below that. **Is that true for this wiki?**

## Why it matters

The answer decides whether [[qmd]] (or a hand-rolled search script) ever gets built.
Building search too early is wasted work; too late means the agent starts missing pages
it should have updated — which does not fail loudly, it just quietly degrades ingest
quality.

## Reasons our threshold may be lower

- This wiki is **multi-domain** (tech, seo, personal, deep dives). The source assumes a
  single coherent domain. A mixed index may become unreadable earlier — the domain
  sectioning in [[index]] is the hedge against this.
- Index reading is not free: every ingest and query reads it, so a bloated index taxes
  every operation.

## Reasons it may be higher

- Domain sectioning means only the relevant slice usually needs reading.
- Filenames are kebab-case and descriptive, so `grep` and glob cover a lot before real
  search is needed.

## Signals to watch

Concrete symptoms that the ceiling has been reached:

1. An ingest misses a page it obviously should have updated, discovered later.
2. A lint pass surfaces duplicate pages for the same entity under different names.
3. Reading the index becomes a meaningful share of the work in a routine query.
4. `index.md` exceeds roughly 500 lines.

**Status: watching.** Current size — 1 source, 10 pages. Revisit at 25 sources.

## Relations

- [[qmd]] — the candidate answer.
- [[index]] — the thing under test.
- [[compounding-knowledge-base]] — a related but distinct ceiling: knowing pages exist
  at all, versus finding them.
