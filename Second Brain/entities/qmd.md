---
type: entity
domains: [system]
title: qmd
created: 2026-08-18
updated: 2026-08-18
status: seed
confidence: medium
aliases: []
tags: [needs-verification]
sources: ["[[llm-wiki-pattern]]"]
---

# qmd

A local search engine for markdown files, recommended in [[llm-wiki-pattern]] as the
scaling escape hatch for when a hand-maintained [[index]] is no longer sufficient.
Repository: <https://github.com/tobi/qmd>.

**Not installed here.** This page exists so the option is on the map when the wiki
outgrows grep.

## Stated properties

Per [[llm-wiki-pattern]] — unverified, not independently checked:

- Hybrid **BM25 + vector** search over markdown files
- **LLM re-ranking** of results
- Fully **on-device**, no external service
- Ships both a **CLI** (the agent shells out to it) and an **MCP server** (the agent
  calls it as a native tool)

## When to adopt

The trigger from [[llm-wiki-pattern]] is roughly **~100 sources / a few hundred pages** —
the point at which the index catalog stops being enough. Tracked as
[[when-does-the-index-stop-scaling]]. Below that threshold, `index.md` plus `grep` is
explicitly claimed to be sufficient and to avoid embedding infrastructure entirely.

The source also notes a cheaper path: have the agent write a naive search script instead.
Worth trying first — the failure being solved is *finding pages*, and a corpus of a few
hundred markdown files is small enough that a lot of things work.

Note the inversion worth being aware of: adopting qmd means running
[[retrieval-augmented-generation]] over the **wiki** layer. That is not a contradiction
of this pattern — the compounding already happened at ingest; retrieval is just how the
compiled artifact gets read.

## Relations

- [[obsidian]] — built-in search this would supplement.
- [[retrieval-augmented-generation]] — what qmd does, one layer up.
- [[when-does-the-index-stop-scaling]] — the question that triggers adoption.
