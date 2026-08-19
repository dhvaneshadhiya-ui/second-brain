---
type: entity
domains: [system]
title: Obsidian
created: 2026-08-18
updated: 2026-08-18
status: seed
confidence: high
aliases: ["Obsidian.md"]
tags: []
sources: ["[[llm-wiki-pattern]]", "[[how-to-build-a-second-brain-with-claude]]"]
---

# Obsidian

A local-first markdown editor operating over a folder of plain files (a "vault"), with
wikilinks, backlinks, a graph view, and a plugin ecosystem. In this wiki it is the
**reading layer** — the human's window onto pages the agent writes.

The framing in [[llm-wiki-pattern]]: *"Obsidian is the IDE; the LLM is the programmer;
the wiki is the codebase."* The intended working posture is agent on one side of the
screen, Obsidian on the other, browsing edits as they land.

## Why it fits this pattern

- **Plain markdown on local disk.** No database, no lock-in — the agent reads and writes
  the same files the human reads. Nothing sits between the two.
- **Backlinks.** Inbound links are computed, so orphan detection during a lint pass is
  visible in the UI, not just via grep.
- **Graph view.** Named in [[llm-wiki-pattern]] as "the best way to see the shape of your
  wiki — what's connected to what, which pages are hubs, which are orphans." It is the
  cheapest health check available: a glance shows clustering and isolation.
- **It is a git repo.** Version history, branching, and diffing come free, which matters
  when an agent can rewrite fifteen files in one pass.

## Configuration in this vault

Vault root: `Second Brain/` (nested one level inside the repo root).

| Setting | Value | Why |
|---|---|---|
| Attachment folder path | `raw/assets` | Downloaded images land where the agent can read them |
| Always update links | on | Renames do not break the graph |
| New link format | shortest | Bare wikilinks resolve by filename; requires unique filenames |
| Markdown links | off | Wikilinks, for backlink and graph support |

## Companion tooling

Mentioned in [[llm-wiki-pattern]], none installed here yet:

- **Web Clipper** — browser extension converting web articles to markdown. The primary
  intake path for sources. Pair with the *Download attachments for current file* command
  (bind a hotkey) to pull images local rather than depending on URLs that rot.
  The concrete path, per [[how-to-build-a-second-brain-with-claude]]: Obsidian → Manage
  Vaults → select the vault → Clipper icon in Chrome → *Add to Obsidian*. Clipped files
  arrive with their own YAML frontmatter (`source`, `author`, `published`) — useful
  metadata, but its author wikilinks will not resolve to wiki pages. This is why
  `raw/` is excluded from ghost-link checks during a lint pass.
- **Dataview** — queries over YAML frontmatter, generating dynamic tables. Our schema
  already writes structured frontmatter (`type`, `domain`, `status`, `confidence`,
  `sources`), so this would work immediately and could largely replace hand-maintained
  sections of [[index]].
- **Marp** — markdown slide decks, for presenting wiki content.

## Relations

- [[llm-wiki-pattern]] — source; specifies the reading-layer role.
- [[qmd]] — complements Obsidian's built-in search once the wiki outgrows it.

## Open questions

- Adopt Dataview and make [[index]] partly generated? Trades human-readability and
  greppability for guaranteed freshness. Worth revisiting around 50 pages.
