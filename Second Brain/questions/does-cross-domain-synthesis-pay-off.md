---
type: question
domains: [system]
title: Does cross-domain synthesis pay off?
created: 2026-08-18
updated: 2026-08-18
status: seed
confidence: low
tags: [watching]
sources: []
---

# Does cross-domain synthesis pay off?

This wiki holds several unrelated domains — `tech`, `seo`, `personal`, `system`, and deep
dives — in **one** graph rather than several separate wikis. The entire justification is that valuable
connections form *between* domains: a technology shift that opens a content opportunity,
a research finding that bears on a personal goal, a competitor move that validates a
thesis.

**If that does not happen, the design is wrong** and this should be split into separate
vaults.

Note this is not a claim from [[llm-wiki-pattern]] — the source treats each application
of the pattern as single-domain. It is a bet made in setting up *this* wiki, so it needs
its own evidence.

## The case for one wiki

- Cross-domain connections are exactly the connections a human would never file manually,
  because they never sit in the same folder or the same frame of mind. This is where an
  agent that reads everything has a real edge.
- Splitting is cheap and reversible later; merging separate vaults after the fact and
  recovering lost links is not.

## The case against

- Domains dilute each other. A personal journal entry and a competitor teardown share no
  vocabulary, and an agent hunting for connections between them may produce **strained
  links** — the failure mode where everything connects to everything and the graph stops
  being informative.
- Mixed-domain indexes get harder to read faster, and multi-domain pages are listed under
  each domain they carry, which compounds it. See [[when-does-the-index-stop-scaling]].

## How this gets decided

Since domains became a **list** (2026-08-18), this is directly countable — a page carrying
two or more domains *is* a cross-domain page, so the evidence is in the frontmatter rather
than in a folder:

```bash
grep -h "^domains:" */*.md | grep "," | wc -l    # multi-domain pages
grep -c "^domains:" */*.md | wc -l               # total pages
```

- **Pays off** — by ~20 sources a meaningful share of pages carry 2+ domains, *and* at
  least one connection was non-obvious enough that it would not have been noticed without
  the wiki.
- **Does not pay off** — nearly every page carries exactly one domain, or the second
  domain is technically defensible and practically useless.

The second failure is the dangerous one because it looks like success. A page earns a
second domain only if someone working in that domain would actually want it. Shared
vocabulary is not relevance.

**Status: watching.** Currently 3 of 15 pages carry 2 domains — but all 3 are artifacts of
this wiki examining itself, which is not evidence of anything. The real test starts when
sources arrive that have nothing to do with second brains. Revisit at 20 sources.

## Relations

- [[index]] — where the evidence accumulates.
- [[why-this-wiki-is-structured-this-way]] — the decision this question tests.
