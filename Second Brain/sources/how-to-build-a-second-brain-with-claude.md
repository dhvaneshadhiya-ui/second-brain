---
type: source
domains: [system, seo]
title: "How To Build A Second Brain With Claude"
created: 2026-08-18
updated: 2026-08-18
confidence: medium
aliases: ["Structure Webworks second brain video"]
tags: [secondary, promotional]
sources: []
---

# How To Build A Second Brain With Claude

> **Source:** [[structure-webworks]] · YouTube Short, published 2026-06-12 · [[second-brain-with-claude-yt-short|raw file]] · <https://www.youtube.com/watch?v=s0ulILUmosw>
> **Ingested:** 2026-08-18

## Summary

A 90-second promotional YouTube Short demonstrating a business-oriented implementation
of the LLM Wiki pattern using Claude Code and [[obsidian]]. It explicitly credits
[[andrej-karpathy]] as the pattern's originator — the fact that resolved the authorship
gap in [[llm-wiki-pattern]]. Its framing is institutional: ingest your company SOPs so
the agent understands how the business runs, then audit those SOPs against new external
knowledge as it arrives.

**Quality caveat:** this is marketing collateral with a lead-magnet call to action
("Comment 'Prompt' below"), not an argued piece. The transcript is thin and no claim in
it is defended. Ingested for three specific contributions — the attribution, the folder
variant, and the audit operation — not as an authority. Hence `confidence: medium`.

## Key takeaways

- **Attribution.** Credits the pattern to [[andrej-karpathy]] via
  <https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f>. **Independently
  verified 2026-08-18** — see the correction noted on [[llm-wiki-pattern]].
- **A three-drawer folder model:** `raw` / `clippings` / `wiki`. The distinguishing move
  is that **`clippings` is a top-level peer of `raw`**, separating material the business
  already owns from material collected from outside.
- **A fourth operation.** After ingesting an external source, ask *"does my current
  workflow actually hold up?"* — the agent compares new knowledge against an existing
  page and reports what needs to change. See [[knowledge-base-audit]]; this is not
  reducible to ingest, query, or lint.
- **Institutional memory as the value proposition:** "No more losing processes when
  employees leave." The wiki as continuity across staff turnover.
- **Setup is a single pasted prompt.** The agent scaffolds the whole structure
  unattended — a deliberately lower-ceremony onboarding than the collaborative
  schema-building [[llm-wiki-pattern]] describes.

## Notable details

- Timeline: Karpathy's gist is dated 2026-04-04; this video published 2026-06-12. Roughly
  two months from pattern publication to a productized agency demo.
- The clipping path is concrete: Obsidian → Manage Vaults → select the Second Brain
  folder → Clipper icon in Chrome → Add to Obsidian → lands in `clippings`. Confirms the
  intake workflow described on [[obsidian]].
- Ingest is invoked in plain language — "ingest your company's workflow", "ingest this
  article" — with no per-source ceremony. Consistent with the batch-leaning, low
  supervision end of the spectrum [[llm-wiki-pattern]] leaves open.
- Hashtags name `claudefable5` and `claudeai2026`, dating the production to the current
  model generation.

## Connections

Directly derivative of [[llm-wiki-pattern]] and self-describes as such. The two are
compared in [[second-brain-implementations-compared]], which also positions our own
structure against both.

Its single original contribution is [[knowledge-base-audit]]. Its practical value
otherwise is as evidence that the pattern reproduces outside its author's hands — one
data point against the concern in [[wiki-maintenance-burden]] that this works only for
the person who invented it.

## Contradictions & tensions

- **Corrects [[llm-wiki-pattern]] on authorship.** Our source page recorded "anonymous
  author, undated" because the document was supplied without provenance. This source
  named Karpathy; verification confirmed it and supplied a date of 2026-04-04. The
  source page has been updated and the correction noted there. Not a conflict between
  sources — a gap one source filled for another, which is the mechanism
  [[compounding-knowledge-base]] exists to capture.
- **Disagrees on setup ceremony.** [[llm-wiki-pattern]] insists the schema is co-evolved
  between human and agent and is "what makes the LLM a disciplined wiki maintainer."
  This source delivers it as a one-shot pasted prompt. The tension is real: a
  generated-and-never-revisited schema is exactly the generic-chatbot outcome Karpathy
  warns against. Our practice follows Karpathy — `CLAUDE.md` has already been revised
  three times in one session.
- **Separate `clippings/` vs. unified `raw/`.** A genuine structural disagreement, not a
  correction. Argued in [[second-brain-implementations-compared]].

## Open questions

- The audit operation is asserted to work, never demonstrated beyond one sentence. What
  does it actually take to do well? Tracked on [[knowledge-base-audit]].
- Does the business/SOP use case need conventions a personal wiki does not — page
  ownership, review dates, approval state? Unanswerable from this source.
