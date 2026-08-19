# Second Brain manual

This explains how the whole thing works and what you do with it. No technical background
needed. The other file, `CLAUDE.md`, is written for the AI and you can ignore it.

---

## 1. What this is

You read a lot. Articles, reports, competitor pages, your own notes. Most of it fades.
You bookmark something, and three months later you half remember that someone made a good
point about a topic, but not who, not the numbers, and not whether the newer thing you
read afterwards contradicted it.

This system fixes that by having an AI read your sources for you and write up what it
learned as a set of connected notes. Not a summary you file away and forget. A living set
of pages that get corrected and expanded every time you add something new.

The important part is that the work of understanding happens once. After that, the pages
already know.

Here is how that compares to what you probably do now:

| What you do now | What happens | What builds up |
|---|---|---|
| Bookmark it | Saved, never opened again | Nothing |
| Write a note | You write it, rarely reread it | A pile of notes |
| Upload files to ChatGPT | Answers your question, then forgets | Nothing |
| This | AI reads it, writes pages, links them, notes where sources clash | Everything, and it stays |

When you ask a question here, you are not asking an AI to go read twenty articles. You are
asking it to read pages it already wrote, where the connections are drawn and the
disagreements are already noted.

---

## 2. Who does what

There are four parts and each one has a clear job.

**You** find sources and drop them in a folder called `inbox`. You say what you want. When
the AI asks what to focus on, you tell it. You ask questions. You read the results. That
is the whole job.

**Claude** reads every source properly, works out what it is about, writes all the pages,
keeps the links between them accurate, notices when a new source contradicts an old one,
and updates the index and the log. It writes everything. You write nothing.

**Obsidian** is the app you read it in. It shows the pages, the links between them, and a
map of how everything connects. It never changes anything by itself.

**Git** keeps a copy of every version. That is what makes it safe for an AI to rewrite
fifteen pages at once, because you can always see what changed and undo it.

You never file, name, sort, or label anything. If any part of this starts asking you to,
something has gone wrong with the design and you should say so.

---

## 3. The three parts of the system

**Your sources** live in a folder called `raw`. Nothing ever edits them. They stay exactly
as you dropped them, forever.

**The wiki** is the set of pages the AI writes. Five folders, explained in section 5.

**The instructions** live in `CLAUDE.md`. That file tells the AI how to behave: how to
write a page, when to make a new one, what to do when sources disagree. You and the AI
change it together when something is not working. It has already been rewritten six times
in a day, which is the point rather than a problem.

---

## 4. Where everything lives

```
second-brain/                  <- open this one in Claude
├── CLAUDE.md                  instructions for the AI
├── MANUAL.md                  this file
├── README.md                  short intro
├── setup.sh                   run once on a new computer
└── Second Brain/              <- open this one in Obsidian
    ├── index.md               list of every page, grouped by topic
    ├── log.md                 diary of everything that has happened
    ├── raw/
    │   ├── inbox/             YOU PUT FILES HERE. The only folder you touch.
    │   ├── assets/            pictures, saved automatically by Obsidian
    │   └── your files         sources after they have been read
    ├── sources/               one page per thing you fed it
    ├── entities/              people, companies, products, tools, places
    ├── concepts/              ideas and how things work
    ├── syntheses/             what the AI concluded across many sources
    └── questions/             things it cannot answer yet
```

Two folders are involved and they have almost the same name. The outer one,
`second-brain`, is the project. Open that in Claude. The inner one, `Second Brain`, is
what Obsidian reads. Open that in Obsidian.

---

## 5. The five kinds of pages

Think of it like a filing system that fills itself in.

`sources` holds one page for each thing you fed it. What it said, what mattered, what was
worth remembering. These are a record, so they never get rewritten later.

`entities` holds pages about specific things. A company, a person, a product, a tool.
Facts pile up here from lots of different sources, and each fact says where it came from.

`concepts` holds ideas and explanations of how something works. These grow the most,
because every new source either deepens the explanation or challenges it.

`syntheses` is where the value is. These pages say what the AI actually concludes when it
weighs everything you have fed it. What it currently thinks, what the evidence is, what
argues against it, and what would change its mind.

`questions` holds things nobody can answer yet, along with what it would take to answer
them. This stops good questions from disappearing between sessions.

Every page starts with a few lines of information about itself: when it was made, when it
was last changed, how confident it is, and which sources back it up. That last one matters
most. It is how you check whether to believe a page.

---

## 6. Topics

Every page is labelled with one or more topics. Right now the topics are tech, seo,
personal, and system, but that list is not fixed. Feed it something about cooking and a
cooking topic appears. Start a client project and that gets its own.

A page can carry several topics at once, which is the whole reason everything lives
together instead of in separate folders. An article about AI search and how it affects
publishers is genuinely about both tech and SEO. Filing it under one loses the reason the
other would ever want it.

You never assign these. The AI works it out from the content and tells you what it chose
before it writes anything. If it is wrong, you say so in one word.

One rule keeps this from getting silly. A new topic only gets created when it looks like
it will grow. A topic holding one page forever is just clutter, so one off sources go into
the closest topic that already exists.

---

## 7. Labels

There is a second, smaller set of labels, and these are about the state of a page rather
than its subject. Most pages have none at all, which is correct.

| Label | What it means | What you do about it |
|---|---|---|
| `thin-sourcing` | Only one source backs this up | Find more before trusting it |
| `needs-verification` | A specific claim here should be checked | Go check it |
| `contradiction` | Two sources disagree and it is unresolved | Find something that settles it |
| `watching` | An open bet with a date to revisit | Check when that date arrives |
| `stale-risk` | The sources behind this are getting old | Time for a review |
| `actionable` | There is something here you could actually do | Read it |
| `primary` | The original document or the real data | Trust it more |
| `secondary` | Somebody reporting on something else | Go find the original |
| `promotional` | Somebody selling something | Treat claims as sales talk |

Labels get removed once they are dealt with. They are a to do list, not a filing system.

In Obsidian there is a panel showing all of these. `watching` becomes your review list.
`needs-verification` becomes a reading list the system wrote for you.

---

## 8. What you actually say to it

Five phrases run everything.

**"ingest this"** after you drop a file. It reads the source, tells you what is in it,
waits for you, then writes everything up.

**"what do we know about X?"** It reads the relevant pages and answers, telling you which
page each part came from and where its knowledge runs out.

**"lint the wiki"** is a health check. It looks for pages that contradict each other, old
claims that newer sources have overtaken, pages nothing links to, and gaps worth filling.

**"does page X still hold up?"** checks one page against everything learned since.

**"commit"** saves a snapshot and backs it up.

Most people never use the second one properly, which is a shame, because a good answer can
be saved as a new page and then it counts as knowledge too.

---

## 9. What happens when you feed it something

1. You drop a file in `inbox` and say "ingest this". Any file type, any subject, and the
   name does not matter.
2. It reads the whole thing. Text first, then any pictures worth looking at.
3. It works out the topics and tells you what it picked and why.
4. **It stops and reports back.** What the source is, the handful of things that actually
   matter in it, which existing pages it affects, and anything that contradicts what you
   already have.
5. You steer. What to focus on, what to skip, what deserves its own page. This step is
   what makes the result yours instead of generic.
6. It writes. The source page first, then it goes through every related page and updates
   them, and notes any disagreement on both sides rather than picking a winner.
7. It updates the index and the log.
8. It tells you every file it changed.

One source usually affects between eight and fifteen pages. That sounds like a lot. It is
normal, and it is most of the value.

---

## 10. Getting things in

Four ways, and none of them need you to organize anything.

Obsidian has a browser extension called Web Clipper. Click it on any article and the
article is saved into the system.

Drag any file into `inbox`. A PDF, a transcript, a screenshot, a spreadsheet.

Paste a link into the chat and it will go and read it.

Write your own notes and drop those in. This is the most valuable material you have and
nothing else you use has access to it. Do not paste your notes in as wiki pages though.
Feed them as sources, so the AI can quote them and check other things against them later.

---

## 11. Reading it in Obsidian

The map view is the quickest way to see the shape of what you know. Big clusters are
subjects you have real depth in. Lonely dots are things you read once and never followed
up. It is unflattering and useful.

At the bottom of every page is a list of everything that links to it. That is where
connections you did not expect show up.

There is a search box that covers everything, including your original files.

The best way to work is with the chat on one side and Obsidian on the other, so you can
watch pages change as they are written.

---

## 12. Undoing things

Every version of every page is saved automatically. This matters because an AI can rewrite
fifteen pages in a few seconds, and you want a way back.

```bash
git diff HEAD~1              # show exactly what changed last time
git log --oneline            # list every session
git checkout -- <file>       # undo changes to one page
git revert HEAD              # undo an entire session
```

If typing commands is not your thing, just ask. "What changed in the last session?" and
"undo that" both work.

Say "commit" when you are happy with a session. That saves everything and copies it to
your private backup online.

The single best habit here is checking what changed after each session. It takes ten
seconds and it is how you catch the AI writing something confident and wrong.

---

## 13. Using it on a second computer

```bash
git clone https://github.com/dhvaneshadhiya-ui/second-brain.git
cd second-brain
./setup.sh
```

That last line sets up the new computer so Claude knows where everything is. Then open the
inner folder in Obsidian and the outer folder in Claude, same as before.

### Updating a computer that already has it

Open the `second-brain` folder in Claude and say:

> update my second brain

That is all you do. Claude fetches the latest version and refreshes the settings on that
machine.

The refresh step matters and it is easy to miss if you ever do this by hand. The small file
that tells Claude where your second brain lives sits outside the project, because it holds a
file path unique to each computer. New versions never reach it automatically. Without the
refresh, that machine keeps following instructions that were changed somewhere else, which
is exactly what would have happened today when we removed the rule about where you can add
sources from.

If you did work on that computer and never saved it, Claude will tell you and save it first.
Nothing gets lost. Neither computer is allowed to overwrite the other.

### Keeping them in step

One thing to remember: the copies do not sync by themselves. Say "commit" when you finish
on one computer, and ask for the latest before you start on the other. If you want your
notes to appear on your phone automatically, Obsidian has its own sync service for that,
and the two work fine together.

| Where | Can read it | Can add to it |
|---|---|---|
| Claude, in the second brain folder | yes | yes |
| Claude, in any other folder on this computer | yes | yes |
| Obsidian on any device | yes | no |
| claude.ai in a browser or on your phone | no | no |

You can ask it things from any folder on your computer, and you can feed it from anywhere
too. If you find something good while working on an unrelated project, say "ingest this"
and it will do the whole job properly rather than a rushed version. It should also warn you
that a real one takes ten or twenty minutes and offer to park the file for later if you are
in the middle of something.

---

## 14. What you get out of it

You stop losing things. The article from three months ago is a page with the numbers still
in it and a note saying where they came from.

Disagreements between sources get caught. When one source breaks another one's claim, it
gets written on both pages at the moment the AI has both in front of it. Neither of you
would spot that six weeks later.

Questions get cheap. Asking what you know about something reads one page instead of
rereading twenty articles.

Your conclusions become checkable. A synthesis page shows what it thinks, what backs that
up, what argues against it, and what would change it. When you disagree with your past
self, the reasoning is right there.

Connections appear between things you would never have filed together. Something you read
about tech opens up an idea for content. A study you read for personal reasons turns out to
matter for work. Those links never occur to anyone, because the two things never sit in the
same folder or the same mood.

And it gets better as it grows. The first source affected four pages. The twentieth will
affect fifteen, because there is more for it to connect to. A folder of notes gets worse as
it grows. This gets better.

---

## 15. What people use it for

Same system, pointed at different things.

### Following a subject you cover

Feed it launch coverage, spec sheets, reviews, and your own opinions after using something.
You end up with pages on the companies, the products, and the arguments, plus a page saying
what you currently think about where it is all going.

The question it makes easy: how has the pitch for this changed over the last eighteen
months, and who moved first? That is answerable because each shift was written down as it
happened rather than remembered.

### Watching competitors and search

Feed it competitor teardowns, search result screenshots, algorithm update coverage, your
own traffic exports, industry post mortems. You get pages on each competitor, on how the
mechanisms work, and one page arguing what actually drives your traffic, which gets
rewritten as evidence arrives.

The question it makes easy: where do my sources disagree about what is causing this? The
disagreements were logged when they appeared, so you are reading a record rather than
rebuilding one.

### Going deep on one thing

A subject you will read about for months gets its own topic. Papers, reports, long
interviews, original documents.

The question it makes easy: what is the strongest argument against what I currently think?
That section exists on the page because it was written while the evidence was fresh.

### Yourself

Articles about sleep, focus, or training. Podcast notes. Protocols you tried. Your own
notes on what worked and what did not.

Your own experience becomes evidence sitting next to published research, and the system can
tell you when a popular claim rests on one weak study. These pages go into your private
online backup along with everything else. That was decided, and individual files can still
be kept out if you ask.

### A client or a project

Briefs, call notes, decisions and the reasons behind them, constraints. Six weeks later,
"why did we rule that out?" has a real answer with a date on it.

### Reading a book

Feed it your notes chapter by chapter. By the end you have a companion guide to the book,
built as you read rather than reconstructed afterwards.

---

## 16. What it looks like in practice

### A page

Here is the top of a real page from your system:

```markdown
---
type: concept
domains: [system]
title: Retrieval-Augmented Generation (RAG)
created: 2026-08-18
updated: 2026-08-18
status: seed
confidence: medium
aliases: ["RAG"]
tags: [thin-sourcing, needs-verification]
sources: ["[[llm-wiki-pattern]]"]
---
```

Read that before you read the page itself. It says confidence is medium, only one source
backs it, and somebody should check the claims. The page then says so in plain words too:

> This page currently reflects a single source, which describes the topic specifically as
> a foil for its own argument. It is a fair but deliberately unflattering description.

That is the habit that stops a fluent AI turning a one sided claim into something that
reads like settled fact.

### Feeding it something

**You:** (drop a competitor teardown in the inbox) ingest this

**Claude:**

> Topics: seo and tech. Mostly an SEO teardown, but half of it is about how the product
> changed, so both apply.
>
> Three things matter here. They switched from long guides to short comparison pages in
> Q2, and the traffic chart on page three shows exactly when. They claim a 40% increase,
> but that window overlaps a known algorithm update, so it is unclear what caused what.
> Their internal linking changed at the same time.
>
> This affects three pages, two of which do not exist yet. It also argues against what
> your traffic page currently says.
>
> One conflict: an earlier source argued comparison pages were losing ground. Both cannot
> be right. It might depend on the industry. I would write down both positions rather than
> pick one.
>
> Want me to write it up, or focus somewhere else?

**You:** write it, but don't take the 40% at face value

**Claude:** (writes six pages, marks that claim as needing verification, records the
conflict on both sides, updates the index and the log, lists every file it changed)

The pause before it writes is the important bit. That is where you add what you know, and
where the result stops being a generic summary.

### Asking it something

**You:** what do we know about how AI search affects publisher traffic?

**Claude:**

> Three pages cover this. The mechanism page says click throughs fall hardest on
> informational searches, based on two sources. The numbers page has figures from two
> sources that disagree by a wide margin, and both were published by companies selling
> something.
>
> Your traffic page currently argues the damage is concentrated in top of funnel content,
> and it says outright what would change that view: any sign of decline in comparison or
> review pages.
>
> Worth knowing: none of this comes from an original source. No first party data, no
> statement from Google. It is all secondhand reporting, and I would fix that before making
> a decision on it.

Two things there that a normal chatbot will not do. It named the pages so you can go and
read them yourself. And it told you where its knowledge is weak instead of papering over
the gap.

### A health check

**You:** lint the wiki

**Claude:**

> Two contradictions. Two pages make opposite claims about ideal length and neither one
> mentions the other. I suggest writing the conflict on both and looking for something that
> settles it.
>
> One page has gone stale. The algorithm updates page has not been touched since March and
> two sources since then affect it.
>
> One page is orphaned. Nothing links to the keyword cannibalization page. Either it
> belongs under the traffic page or it was created too early.
>
> One gap worth filling. This nearly answers whether content freshness affects rankings,
> but there is no original source behind it. Worth finding real data or a proper study.
>
> Shall I fix these?

This is the point where the system starts telling you what to read next instead of just
absorbing what you give it.

### How a disagreement gets recorded

Nothing is deleted. The old claim stays, the new one goes next to it, and the date says
which came later:

```markdown
## Contradictions & tensions

**Extended by [[how-to-build-a-second-brain-with-claude]] (2026-06-12)**
on three points: it supplied the missing attribution; it splits intake
into `raw/` + `clippings/` where this document keeps one `raw/`; and it
adds a fourth operation this document does not describe.
```

No system that reads your files fresh each time can do that, because there is nowhere for
the note to live.

---

## 17. Getting real value out of it

The last two sections cover what it becomes and what it looks like. This one is about what
you do, because the system compounds by itself but the value does not.

### 17.1 Ask the right kind of question

Most people ask a knowledge base the same thing they would ask a chatbot. "Summarize this
topic." You will get something a chatbot would have done better.

The questions worth asking are the ones that need work already done: comparing sources,
noting where they clash, tracking what is missing. Nobody can do that on the spot.

| Ask this | Why it works |
|---|---|
| Where do my sources disagree about this? | The clashes were written down when both sources were in view |
| What would change my mind about this? | Conclusion pages have a section saying exactly that |
| What do I not know yet, that I would need in order to decide? | Gaps are tracked as real pages |
| What did I think about this in March, and what changed it? | Every page records when it changed, and old versions are kept |
| What connects these two things? | The links cross between subjects, which nothing else in your life does |
| What is the weakest claim on this page? | Confidence and sourcing are written down |
| Which of my open questions could this new source answer? | Open questions survive between sessions |

The pattern is that you should ask it to weigh things up, to find disagreement, and to tell
you what is missing. Do not ask it to remember things. A search box already does that.

### 17.2 Feed it things you disagree with

What you feed it decides what it can do. Three habits matter more than volume.

Feed it the source that argues against you. A system full of things you already believe is
just your own opinion with footnotes. The disagreement machinery only works when there is
something to disagree with.

Write down what you currently think and feed that in. Five minutes of rough notes. It
becomes quotable, and everything you add afterwards gets measured against it. Almost nobody
does this because it feels like writing a note rather than building something.

Feed the original rather than the coverage. A company's own report beats three articles
about that report.

### 17.3 Use it to make things

The system is not the work. It is what you make the work from, and this is where the time
comes back:

- Ask for an article outline based on what you know, with every thin section flagged. You
  get the outline and the fact checking list together.
- Ask what contrarian angle your sources actually support. Grounded in evidence rather than
  a hot take, with citations you can defend.
- Ask for a comparison table of competitors built from the pages you already have.
- Ask it to argue against something using only what is in the system.
- Ask what you have already published that your newer sources now contradict. That one is
  hard to do any other way, and it is worth the most.

Everything comes with a note saying where it came from. That is the difference between
something you can stand behind and something you have to check all over again.

### 17.4 Let it choose your reading

This is the part most people miss. Normally you find things to read, then read them. Here
it goes the other way. The health check tells you something is missing, you go and find
that specific thing, you feed it in, and you run the check again.

It gives you a better reading list than you would write yourself, because it knows exactly
where its own knowledge is thin. Run it when you are not sure what to work on.

### 17.5 Save the good answers

When you get an answer worth keeping, say "save that". It becomes a page and counts as
knowledge from then on.

Skip this and you will redo the same thinking in three months without realising you already
did it once. A chat history is not a knowledge base.

### 17.6 A rhythm that works

| When | Ask |
|---|---|
| Before writing anything | What do we know about this, and where are we thin? |
| Before deciding anything | What would change my mind? |
| Just after reading something good | Feed it in while your reaction is fresh |
| Weekly, or when you are stuck | Run the health check, then go find what it says is missing |
| After a good answer | "save that" |
| End of a session | "commit" |

### 17.7 How to tell if it is working

Once you have fed it twenty things about one subject, ask it something you genuinely do not
know and would otherwise spend an hour researching.

If the answer saves you that hour and you would happily defend it to someone else, it
works. If it reads like a competent summary you could have got anywhere, then either you
have not fed it enough, you have spread it too thin across unrelated subjects, or you are
asking it to remember rather than to think. All three are fixable.

---

## 18. When not to bother

Skip it for things you will never look at twice. One off questions, news that will not
matter next month, anything you need to know once and then forget.

The test is whether you will have this question again in some other form. If not, just ask
and move on. Feeding it costs real minutes and not everything earns them.

---

## 19. How this goes wrong

The most likely failure is spreading it too thin. Five sources on five unrelated subjects
gives you a tidy looking folder that does nothing useful. The whole thing depends on
sources touching each other. Fifteen sources on one subject is genuinely useful. Fifteen
sources on fifteen subjects is a filing cabinet.

The second is confident nonsense. An AI can be wrong at scale and it writes just as
smoothly when it is. That is what the confidence labels and the health check are for. Never
trust a page because it reads well. Look at what is backing it.

The third is that you stop feeding it. Then it is just a folder of ageing notes. This
removes the work of maintaining a knowledge base, not the work of finding good things to
put in it.

The fourth is structure creeping back in. If you ever find yourself sorting or labelling
something, say so and it gets removed.

---

## 20. Getting it useful quickly

Pick one subject. Not two.

Feed it five to eight things about that one subject, one at a time. Mix them up: articles,
competitor pages, a report, your own notes.

Then ask it something difficult. Not "summarize this" but something like "where do these
sources disagree" or "what does this mean for how we do things". Be prepared for it to feel
thin until around the sixth or seventh source. Then it clicks.

Then run the health check and let it tell you what to go and find.

Around twenty sources, the open questions below become answerable.

---

## 21. Things we are still not sure about

Three bets are being tracked, each one written up as a page.

Whether keeping everything together beats splitting it up. The bet is that connections
between unrelated subjects are worth the mess. You can measure it by counting pages that
carry more than one topic. Right now three out of fifteen do, and all three are the system
describing itself, so that proves nothing yet.

Whether a hand written index keeps working as this grows. It is supposed to hold up to
around a hundred sources. The warning signs are the AI missing a page it should have
updated, duplicate pages appearing under slightly different names, or the index getting too
long to scan.

Whether the upkeep really is close to free. Everything rests on that. If the quality of
each session drops as the system grows, this becomes an ordinary abandoned wiki that just
took less effort to abandon.

---

## 22. The short version

```
Add something      put a file in inbox, say "ingest this"
Ask something      "what do we know about X?"
Health check       "lint the wiki"
Save               "commit"

Claude opens       second-brain
Obsidian opens     second-brain/Second Brain

New computer       clone, then run setup.sh
See what changed   "what changed last session?"
Undo               "undo that"
```

Your job: put files in one folder, say what you want, read what comes back. Everything else
belongs to the AI.
