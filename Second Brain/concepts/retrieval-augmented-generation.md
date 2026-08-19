---
type: concept
domains: [system]
title: Retrieval-Augmented Generation (RAG)
created: 2026-08-18
updated: 2026-08-18
status: seed
confidence: medium
aliases: ["RAG", "retrieval augmented generation"]
tags: [thin-sourcing, needs-verification]
sources: ["[[llm-wiki-pattern]]"]
---

# Retrieval-Augmented Generation (RAG)

A pattern in which documents are indexed ahead of time, relevant chunks are retrieved at
query time, and an LLM generates an answer from those chunks. It is the default shape of
most LLM-plus-documents products.

> **Scope note:** this page currently reflects a single source — [[llm-wiki-pattern]] —
> which describes RAG specifically as a **foil** for its own proposal. It is a fair but
> deliberately unflattering characterization. Treat this page as thin until a source that
> argues *for* RAG is ingested. `confidence: medium` for that reason.

## How it is characterized in the wiki so far

- Documents are uploaded; the LLM retrieves relevant chunks per query and answers from
  them (per [[llm-wiki-pattern]]).
- Named examples of products working this way: NotebookLM, ChatGPT file uploads, "most
  RAG systems."
- Usually built on embedding-based vector search infrastructure.

## The stated limitation

**Nothing accumulates.** The LLM "is rediscovering knowledge from scratch on every
question." A question requiring synthesis across five documents forces the model to
locate and reassemble the relevant fragments every single time, and that work is
discarded once the answer is returned.

The specific losses, per [[llm-wiki-pattern]]: no persistent cross-references, no record
of where sources contradict one another, no standing synthesis. [[compounding-knowledge-base]]
is proposed as the alternative that keeps all three.

## Where RAG is the right choice

Not stated in the source, but implied by the cost structure (see
[[compounding-knowledge-base]]): RAG is cheap at ingest and expensive per query, which
makes it correct for large corpora queried shallowly or once — and wrong for a small
corpus queried repeatedly over months. The two are not strictly rivals; a mature wiki may
well want retrieval *over the wiki itself*, which is what [[qmd]] provides.

## Relations

- [[compounding-knowledge-base]] — the proposed alternative.
- [[qmd]] — retrieval applied to the wiki layer rather than the raw layer.
- [[llm-wiki-pattern]] — the source of this framing.

## Open questions

- Is the "rediscovering from scratch" critique still accurate for RAG systems with
  persistent memory or caching layers? Needs a source that is not arguing against RAG.
- Where is the crossover point in corpus size and query frequency between the two
  approaches?
