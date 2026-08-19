---
type: concept
domains: [system]
title: Memex
created: 2026-08-18
updated: 2026-08-18
status: seed
confidence: medium
aliases: ["Vannevar Bush's Memex", "As We May Think"]
tags: [needs-verification]
sources: ["[[llm-wiki-pattern]]"]
---

# Memex

Vannevar Bush's 1945 proposal for a personal, curated knowledge store in which documents
are linked by **associative trails** — with the connections between documents treated as
being as valuable as the documents themselves.

[[llm-wiki-pattern]] names it as the direct intellectual ancestor of this pattern.

## Why it is the right ancestor

The distinction drawn in [[llm-wiki-pattern]]: Bush's vision was **closer to this pattern
than to what the web actually became**. The Memex was private, actively curated, and
personal. The web is public, largely uncurated, and general. A personal LLM-maintained
wiki recovers the properties the web discarded.

## The unsolved part

Bush specified the trails but not **who maintains them**. Associative trails have to be
laid down deliberately and kept current as the collection grows — precisely the
[[wiki-maintenance-burden]] that causes wikis to be abandoned. This is the gap the LLM is
claimed to fill, and it is the reason the pattern is only now practical rather than
having been obvious for eighty years.

## Relations

- [[wiki-maintenance-burden]] — the gap Bush left open.
- [[compounding-knowledge-base]] — the modern instantiation.
- [[llm-wiki-pattern]] — source of this framing.

## Open questions

- Bush's original essay ("As We May Think", *The Atlantic*, 1945) has not been ingested —
  everything here is secondhand via [[llm-wiki-pattern]]. Worth reading directly; it is
  short, public domain, and likely to sharpen the trail-maintenance point.
