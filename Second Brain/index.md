---
type: index
domains: [system]
title: Wiki Index
created: 2026-08-18
updated: 2026-08-19
---

# Wiki Index

The catalog of everything in this wiki, organized **by domain, then by category**.
Pages carry one or more domains and are listed under **each** — so a `[tech, seo]` page
appears in both sections. Start here, then drill into pages.

**Status:** 2 sources · 15 pages · 3 carrying multiple domains. See [[log]] for the
chronological record.

## Active domains

Domains are open-ended and created as needed — this is what exists today, not a fixed
set. A page carries every domain it is genuinely relevant to.

| Domain | Covers | Pages |
|---|---|---|
| `system` | How this second brain works — the pattern, the tooling, the design decisions | 15 |
| `tech` | Tech and industry research — products, companies, launches, market moves | 1 |
| `seo` | Content and SEO strategy — competitors, keywords, algorithms, performance | 2 |
| `personal` | Goals, health, psychology, habits, self-improvement | 0 |

New domains get a section below as soon as they have a page; deep dives use `dd-<topic>`.
There is no `cross` domain — a page carrying 2+ domains *is* the cross-domain case.

---

## system

### Syntheses
- [[why-this-wiki-is-structured-this-way]] — which structural decisions came from the sources, which were judgment calls, what was rejected, and the bets that could prove wrong.
- [[second-brain-implementations-compared]] — Karpathy's pattern vs. the Structure Webworks variant vs. this wiki; the core is stable, intake and ceremony diverge.

### Concepts
- [[compounding-knowledge-base]] — knowledge compiled once and maintained, rather than re-derived per query; the core idea of this wiki.
- [[retrieval-augmented-generation]] — retrieve chunks at query time and generate; the approach this wiki is defined against. Thin, one-sided sourcing so far.
- [[wiki-maintenance-burden]] — bookkeeping cost is why wikis get abandoned; the load-bearing bet is that LLMs drive it near zero.
- [[knowledge-base-audit]] — a proposed fourth operation: check a standing page against new external knowledge. Not yet adopted.
- [[memex]] — Vannevar Bush's 1945 associative-trail knowledge store; the ancestor that left maintenance unsolved.

### Entities
- [[obsidian]] — local-first markdown editor; the reading layer. Vault config, clipper workflow, companion plugins.
- [[qmd]] — local hybrid BM25/vector markdown search engine. Not installed; the escape hatch when the index stops scaling.
- [[andrej-karpathy]] *(also `tech`)* — author of the LLM Wiki pattern; attribution verified against the source gist.
- [[structure-webworks]] *(also `seo`)* — Toronto agency; author of the second-brain video.

### Questions
- [[when-does-the-index-stop-scaling]] — is the ~100-source ceiling real for a multi-domain wiki? *Watching, revisit at 25 sources.*
- [[does-cross-domain-synthesis-pay-off]] — the bet behind one graph instead of several; now measurable from the `domains:` field. *Watching, revisit at 20 sources.*

### Sources
- [[how-to-build-a-second-brain-with-claude]] *(also `seo`)* — *2026-06-12* — promotional YouTube Short; a business/SOP variant of the pattern. Supplied the missing attribution, a `clippings/` split, and the audit operation.
- [[llm-wiki-pattern]] — *2026-04-04* — the founding document: LLM-maintained persistent wikis as an alternative to query-time retrieval.

---

## tech

### Entities
- [[andrej-karpathy]] *(also `system`)* — author of the LLM Wiki pattern; attribution verified against the source gist.

---

## seo

### Entities
- [[structure-webworks]] *(also `system`)* — Toronto digital agency; ingested less as an agency than as a clean specimen of comment-gated lead-magnet content marketing.

### Sources
- [[how-to-build-a-second-brain-with-claude]] *(also `system`)* — *2026-06-12* — its promotion mechanics are the SEO-relevant part: riding a named idea early, comment-gating the one copyable asset.

---

## personal

*No pages yet.*
