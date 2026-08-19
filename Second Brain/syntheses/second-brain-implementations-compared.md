---
type: synthesis
domains: [system]
title: Second brain implementations compared
created: 2026-08-18
updated: 2026-08-18
status: developing
confidence: medium
tags: [thin-sourcing]
sources: ["[[llm-wiki-pattern]]", "[[how-to-build-a-second-brain-with-claude]]"]
---

# Second brain implementations compared

Two implementations of the LLM Wiki pattern have been ingested, plus this wiki. This page
tracks where they agree, where they diverge, and what the divergences are actually
about.

## Current view

**The core is stable across all three; the disagreements are about intake and ceremony.**
Every implementation keeps immutable raw sources, an agent-owned wiki layer, a schema
file, an index, a log, and ingest as the central loop. Nobody has questioned that.

What varies is (a) how source material is separated on the way in, and (b) how much
human involvement the workflow assumes. Both trace to a difference in *use case* rather
than a disagreement about the pattern.

## The comparison

| | [[llm-wiki-pattern]] (Karpathy) | [[how-to-build-a-second-brain-with-claude]] (Structure Webworks) | This wiki |
|---|---|---|---|
| Date | 2026-04-04 | 2026-06-12 | 2026-08-18 |
| Top-level intake | `raw/` | `raw/` + `clippings/` | `raw/` with `inbox/` staging |
| Own vs. external material | undifferentiated | **separate top-level drawers** | undifferentiated; domain tag carries it |
| Wiki categories | loose (entities, concepts, summaries, synthesis) | single `wiki/` folder | five fixed: sources, entities, concepts, syntheses, questions |
| Domains | single, implicit | single (the business) | **explicit multi-domain** |
| Schema origin | co-evolved with the human | one pasted prompt | co-evolved (revised 3× on day one) |
| Ingest supervision | supervised preferred, batch allowed | unsupervised, plain-language | supervised by default |
| Operations | ingest, query, lint | ingest + **audit** | ingest, query, lint (audit under consideration) |
| Primary use case | personal research | business SOPs, staff turnover | multi-domain personal |

## What the divergences are actually about

**The `clippings/` split is a provenance distinction, not an organizational one.** Its
real function is separating *what we already believe* (our SOPs) from *what the world
says* (clipped articles) — which is precisely what makes [[knowledge-base-audit]]
possible as an operation. You cannot check your workflow against external knowledge if
you cannot tell which is which.

This wiki gets the same distinction from the `domain:` field and the source page's
provenance line, so a separate folder would be redundant here. **But the underlying
insight is real and we should not lose it:** if audit is ever adopted, the wiki needs a
reliable way to answer "is this page mine or the world's?" That is currently implicit.

**Setup ceremony tracks who the wiki is for.** Karpathy's audience is a person building
their own instrument, so co-evolving the schema is the point. Structure Webworks' audience
is a business owner who wants it working by lunch, so the schema is generated and never
revisited. The cost of the second is the one Karpathy names directly — a schema nobody
tuned produces a generic chatbot rather than a disciplined maintainer. This wiki follows
Karpathy, and the evidence so far supports it: `CLAUDE.md` needed three revisions in the
first session, none of which a generic prompt would have anticipated.

## Counter-evidence & uncertainty

- **Two sources is not a survey**, and they are not independent — the second is
  explicitly derivative of the first. Convergence between them is weak evidence that the
  pattern is robust, because the second author had no reason to diverge.
- **The video is promotional and thin.** Its structure may reflect what demos well in 90
  seconds rather than what its author actually runs.
- **This wiki is one day old.** Every column of the third row is a prediction, not a
  result. The multi-domain and five-category choices in particular are untested — see
  [[does-cross-domain-synthesis-pay-off]].

## What would change this view

- A third implementation that diverges on the **core** — dropping the log, or the
  immutability rule, or agent-exclusive ownership — would mean the core is a preference
  rather than a requirement.
- Adopting [[knowledge-base-audit]] here would force the own-vs-external distinction to
  become explicit, effectively conceding the `clippings/` point.
- Evidence that unsupervised ingest produces comparable quality would undercut the
  supervised default and remove the main cost of this wiki's workflow.

## Sources drawn on

- [[llm-wiki-pattern]] — the origin document.
- [[how-to-build-a-second-brain-with-claude]] — the derivative implementation.
- [[why-this-wiki-is-structured-this-way]] — this wiki's own decisions and rationale.
