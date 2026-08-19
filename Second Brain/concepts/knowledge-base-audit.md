---
type: concept
domains: [system]
title: Knowledge Base Audit
created: 2026-08-18
updated: 2026-08-18
status: seed
confidence: medium
aliases: ["the audit operation", "workflow audit", "does my workflow hold up"]
tags: [watching]
sources: ["[[how-to-build-a-second-brain-with-claude]]"]
---

# Knowledge Base Audit

A fourth wiki operation, alongside ingest, query, and lint: **take newly ingested
external knowledge and evaluate an existing page against it, then report what needs to
change.**

Framed in [[how-to-build-a-second-brain-with-claude]] as *"Does my current workflow
actually hold up?"* — the agent compares what it just learned against a standing SOP and
names the specific gaps.

## Why it is not one of the other three

| Operation | Direction | Output |
|---|---|---|
| **Ingest** | source → wiki | new and updated pages |
| **Query** | question → wiki | an answer |
| **Lint** | wiki → wiki | internal-consistency findings |
| **Audit** | source → *one* page | a verdict on that page's standing |

Lint is the near miss, and the distinction matters: lint checks the wiki against
**itself** — contradictions, orphans, stale cross-references. Audit checks one page
against **the outside world** as newly represented by a source. A wiki can be perfectly
self-consistent and entirely out of date; lint will not catch that, and audit is what
does.

It also differs from ingest in *intent*. Ingest asks "what does this source add?" and is
generous — it propagates everywhere the source touches. Audit asks "does this source
invalidate what I already do?" and is adversarial toward a single specific page.

## The general form

The source frames this narrowly around business SOPs, but it generalizes to any page
holding a **standing position** rather than a record:

- a `syntheses/` page carrying a thesis, checked against a new paper
- a personal protocol, checked against new research
- a content strategy, checked against an algorithm change
- any page whose `status:` is `stable` and whose supporting sources are old

It does not apply to source pages, which are records of what a document said and should
never be revised to reflect later knowledge.

## Open questions

- **How is this triggered?** Manually after a relevant ingest, or should the ingest
  workflow propose audit targets on its own? The second is more useful and more likely to
  produce noise.
- **What is the output?** A report in chat, an edit to the page, or a dated
  "challenged by" note on the page itself? The last preserves the most history and fits
  how contradictions are already handled during ingest.
- **Not yet adopted into `CLAUDE.md`.** One thin source is weak grounds for adding a
  fourth operation to the schema. Revisit once there is a page in this wiki old enough to
  genuinely need auditing.

## Relations

- [[how-to-build-a-second-brain-with-claude]] — source; the only one so far.
- [[llm-wiki-pattern]] — specifies the other three operations and omits this one.
- [[wiki-maintenance-burden]] — audit is the operation that catches *staleness*, the
  failure mode that kills wikis quietly rather than loudly.
- [[compounding-knowledge-base]] — auditing is how the standing synthesis stays standing.
