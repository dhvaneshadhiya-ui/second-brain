---
type: concept
domains: [system]
title: The Wiki Maintenance Burden
created: 2026-08-18
updated: 2026-08-18
status: seed
confidence: medium
aliases: ["maintenance burden", "why wikis die"]
tags: [thin-sourcing]
sources: ["[[llm-wiki-pattern]]"]
---

# The Wiki Maintenance Burden

The reason personal and team knowledge bases are abandoned. The claim of
[[llm-wiki-pattern]]: the hard part of a wiki is not the reading or the thinking — it is
the **bookkeeping**, and bookkeeping cost grows faster than the value the wiki returns.

## The bookkeeping tax

The recurring, low-reward work that a wiki demands to stay coherent:

- Updating cross-references when a page is added or renamed
- Keeping summaries current as underlying material changes
- Noticing and recording when new information contradicts an older claim
- Maintaining consistency of structure and terminology across dozens of pages

None of it is intellectually interesting. All of it is required, and skipping it is
invisible in the short term and fatal in the long term — a wiki whose cross-references
have rotted is worse than no wiki, because it is confidently wrong.

## Why the burden compounds

Bookkeeping scales roughly with the *connections* between pages, not the page count, so
it grows superlinearly while the marginal value of the Nth page grows at best linearly.
The lines cross, and the wiki is abandoned. This is the mechanism behind the familiar
dead personal wiki and the stale team Confluence.

*(The superlinear framing is inference from the source's argument, not a claim it makes
directly — flagged as such.)*

## The LLM claim

Per [[llm-wiki-pattern]]: LLMs "don't get bored, don't forget to update a
cross-reference, and can touch 15 files in one pass." If maintenance cost falls near
zero, the crossing point never arrives and [[compounding-knowledge-base]] becomes viable.

This is the load-bearing bet of this entire wiki. It is also **unproven here** — it is
an argument, not evidence. The counter-worry: LLM maintenance is cheap in human effort
but not free in attention or tokens, and it introduces a new failure mode humans do not
have — *plausible but wrong* maintenance, applied confidently at scale. Rules 2 and 6 in
`CLAUDE.md` (never fabricate a citation; ask before restructuring) exist for this.

## Relations

- [[compounding-knowledge-base]] — what becomes possible if this burden is lifted.
- [[knowledge-base-audit]] — the operation aimed squarely at staleness, the quiet half
  of this burden.
- [[memex]] — the same problem, identified in 1945 and left unsolved.
- [[llm-wiki-pattern]] — source.

## Open questions

- What is the actual failure mode of an LLM-maintained wiki? If not abandonment, then
  what — quiet drift, over-linking, confident error?
- Does the lint pass catch enough to keep this honest, or does it need an outside check?
