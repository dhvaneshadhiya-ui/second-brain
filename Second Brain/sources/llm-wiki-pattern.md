---
type: source
domains: [system]
title: "LLM Wiki: A Pattern for Building Personal Knowledge Bases Using LLMs"
created: 2026-08-18
updated: 2026-08-18
confidence: high
aliases: ["LLM Wiki", "the pattern document"]
tags: [primary]
sources: []  # founding source; cites nothing internal
---

# LLM Wiki: A Pattern for Building Personal Knowledge Bases Using LLMs

> **Source:** [[andrej-karpathy]], gist `llm-wiki.md`, published 2026-04-04 · [[llm-wiki|raw file]] · <https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f>
> **Ingested:** 2026-08-18 — the founding source of this wiki
> **Attribution corrected 2026-08-18** — see *Provenance* below.

## Summary

A design document describing a pattern in which an LLM agent incrementally builds and
maintains a persistent markdown wiki that sits between a human and their raw source
documents. It positions itself explicitly against [[retrieval-augmented-generation]]:
rather than retrieving chunks at query time and re-deriving understanding on every
question, the LLM compiles knowledge once into interlinked pages and thereafter keeps
those pages current. The document is deliberately abstract — it specifies the pattern
(three layers, three operations, two bookkeeping files) and leaves directory structure,
page formats, and tooling to be worked out between each human and their agent.

This is the source that defines this wiki. `CLAUDE.md` is our instantiation of it.

## Provenance

Supplied to this wiki without attribution and originally recorded as *"anonymous author,
undated."* [[how-to-build-a-second-brain-with-claude]] credited [[andrej-karpathy]]; the
gist was then fetched and confirmed directly on 2026-08-18 — owner, title (`llm-wiki.md`),
creation date (2026-04-04), and all eight section headings match this raw file. The
attribution is verified, not inherited from the video.

Worth noting as the first demonstration that this wiki does what it claims: a gap in one
page was closed by a later source, permanently, rather than being re-derived per query.

## Key takeaways

- **The wiki is a compounding artifact, not an index.** Cross-references, flagged
  contradictions, and synthesis are all *already present* when a question arrives,
  rather than being reconstructed per query. See [[compounding-knowledge-base]].
- **Three layers with strict ownership.** Raw sources are immutable and human-curated;
  the wiki is written *exclusively* by the LLM; the schema document is co-evolved by
  both. The document is emphatic that the human should never (or rarely) write wiki
  pages themselves.
- **The schema file is what makes it work.** It is "what makes the LLM a disciplined
  wiki maintainer rather than a generic chatbot" — the load-bearing configuration, not
  documentation.
- **Three operations: ingest, query, lint.** Ingest is the main loop; query answers
  against the wiki with citations; lint is a periodic health check for contradictions,
  stale claims, orphans, and gaps.
- **Query results should be filed back.** A good answer is itself an artifact worth
  keeping — explorations compound in the wiki just as ingested sources do. This closes
  the loop that makes chat-based research normally evaporate.
- **The bottleneck it solves is bookkeeping, not thinking.** See
  [[wiki-maintenance-burden]] — the argument for why LLM-maintained wikis survive where
  human-maintained ones are abandoned.
- **The pattern is domain-agnostic.** Listed applications span personal tracking,
  research, book companions, team/business wikis, competitive analysis, due diligence,
  trip planning, and hobby deep-dives. The business/team case is taken up in earnest by
  [[how-to-build-a-second-brain-with-claude]].

## Notable details

- **Scale claim:** a plain `index.md` catalog "works surprisingly well at moderate
  scale (~100 sources, ~hundreds of pages)" and avoids embedding-based RAG
  infrastructure entirely. Beyond that, add search — [[qmd]] is the named option. See
  [[when-does-the-index-stop-scaling]].
- **Ingest blast radius:** "a single source might touch 10-15 wiki pages." Used here as
  the calibration for whether an ingest is propagating properly or being lazy.
- **Log format:** entry headers prefixed `## [YYYY-MM-DD] ingest | Title` so the log
  stays greppable with `grep "^## \[" log.md | tail -5`. Adopted verbatim in [[log]].
- **The working setup:** agent on one side, [[obsidian]] on the other, browsing edits
  in real time. The document's framing: "Obsidian is the IDE; the LLM is the
  programmer; the wiki is the codebase."
- **Ingest cadence is a preference, not a rule.** The author prefers one source at a
  time with supervision, but notes batch ingest with less supervision is viable. Our
  schema takes the supervised default.
- **Image handling caveat:** LLMs cannot read markdown with inline images in one pass;
  the workaround is to read text first, then view referenced images in a second pass.
  Encoded in our ingest workflow step 1.
- **Lineage:** explicitly related to Vannevar Bush's [[memex]] (1945).
- **Named tooling:** Obsidian Web Clipper, Dataview, Marp, matplotlib, [[qmd]], git.

## Connections

This source is the origin of every structural decision in this wiki — see
[[why-this-wiki-is-structured-this-way]] for the mapping from its claims to our
`CLAUDE.md` rules, including where we deviated.

Its central contrast with [[retrieval-augmented-generation]] is the load-bearing
argument; [[compounding-knowledge-base]] is the alternative it proposes. Its
justification rests on [[wiki-maintenance-burden]]. Its intellectual ancestor is
[[memex]]. Its assumed reading environment is [[obsidian]]; its named scaling escape
hatch is [[qmd]].

## Contradictions & tensions

**Extended by [[how-to-build-a-second-brain-with-claude]] (2026-06-12)** on three points:
it supplied the missing attribution (above); it splits intake into `raw/` + `clippings/`
where this document keeps one `raw/`; and it adds a fourth operation,
[[knowledge-base-audit]], that this document does not describe. Compared in
[[second-brain-implementations-compared]]. None of these contradict the document — they
fill space it deliberately left open.

Two internal tensions worth tracking:

- **"Never write the wiki yourself" vs. co-evolving the schema.** The human is barred
  from the wiki layer but required in the schema layer. The boundary is clear in
  principle and likely to blur in practice, particularly for personal journal-type
  material where the human *is* the primary source. Our resolution: such material is
  ingested as a source into `raw/`, never pasted in as a page.
- **Abstraction as a feature vs. an unfalsifiable claim.** The document declines to
  specify an implementation, which makes the pattern portable but also means none of
  its claims (the ~100-source index ceiling, the 10-15 page blast radius) come with
  evidence. Treated here as hypotheses to test against our own experience, not as
  findings.

## Open questions

- [[when-does-the-index-stop-scaling]] — is the ~100-source claim real for us?
- [[knowledge-base-audit]] — should the three operations be four?
- [[does-cross-domain-synthesis-pay-off]] — our own bet, not the document's.
- Query-output formats (Marp decks, matplotlib charts, canvases) are mentioned but
  unbuilt here. Worth revisiting once there is enough in the wiki to present.
