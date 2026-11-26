# CLAUDE.md

Personal writing hub: a Hugo site using the OINK theme (a Hugo module), English + Chinese, deployed to GitHub Pages on every push to `main`. The README has the structure and commands; this file holds the rules agents follow.

## Sections

- `content/blog/` — essays and notes (blog shell).
- `content/kb/` — knowledge base on database systems, data management and cloud warehouses (docs shell): `papers/`, `concepts/`, `systems/`, `industry/`.
- `content/reviews/` — music, film, books (blog shell).

Start new pages from templates: `hugo new content --kind post|paper|concept|review <path>.md`. Chinese versions sit beside the English one as `<name>.zh.md`; a page appears only in the language it is written in.

## Who writes what

- `content/` is the user's own writing. It is published. Help with it when asked: check facts against the papers, suggest edits, draw diagrams, fix structure. Don't write it in the user's voice unless they ask, and never fill `content/` with generated paper summaries.
- `library/notes/<slug>.md` holds AI-generated **study notes**: private reading aids made from a paper, for the user to learn from and draw on when they write. When asked to "read", "summarize" or "make notes on" a paper, write it here, not in `content/`.

## Paper library

- `library/` is a separate **private** Git repo (`Le0shy/my-docs-library`), ignored by this public repo. It holds the PDFs (`<slug>.pdf`) and `notes/`. Commit and push there only when the user asks, and never copy its notes or PDFs into this repo.
- File names match: `library/<slug>.pdf` ↔ `library/notes/<slug>.md` ↔ the user's own `content/kb/papers/<slug>.md`, if they write one. The `paper.pdf` front-matter field names the PDF.
- `scripts/pdf2text.sh` writes text copies to `library/text/<slug>.txt`. Form feeds (`\f`) separate pages, so page N is the text after the (N−1)th `\f`. Run it after adding PDFs.
- Read efficiently: search `library/text/` with grep first and read only the matching passages; read the whole paper only when writing its first note; open specific PDF pages (Read with `pages`) for figures and tables, which do not survive text conversion.
- For questions about a topic, start from `library/notes/` and the user's pages in `content/kb/`, then go to the papers.
- A new paper's first full read produces its study note. Later questions use the note plus targeted searches, not a re-read.

## Accuracy rules for the knowledge base

- Ground every factual claim about a paper in its PDF. Cite the location inline, e.g. "(§3.2, p. 4)" or "(Fig. 5)".
- If the PDF is not in `library/`, say so and ask for it; do not fill in paper details, numbers or quotes from memory. Mark anything unverified with `<!-- TODO: verify -->`.
- Paraphrase. Quote at most a short sentence when the exact wording matters; the site is public, so never paste long passages, tables or figures from papers.
- Opinions on the site (critiques, reviews, essays) are the user's. In study notes, label your own critique as suggestions for them to react to.

## Writing conventions

- New pages stay `draft: true`; only the user decides to publish by removing it.
- Link related pages with `[text]({{< relref "/kb/concepts/<slug>" >}})` — papers ↔ concepts ↔ systems. Backlinks render automatically. Never link a published page to a draft (the production build fails).
- Headings carry explicit IDs: `## Key ideas {#key-ideas}`.
- Tags are lowercase-kebab (`query-optimization`); paper venues go in `venues: [SIGMOD]`.
- Diagrams: prefer code blocks the theme renders — ```` ```mermaid ````, ```` ```math ````, ```` ```echarts ````, ```` ```markmap ````. For anything richer, put an SVG next to the page (turn `foo.md` into `foo/index.md` + `foo/diagram.svg`).

## Checks before finishing

```bash
hugo -D --panicOnWarning -d /tmp/hugo-check          # with drafts
hugo --environment production --panicOnWarning --printPathWarnings -d /tmp/hugo-check
```

Commit or push only when the user asks; pushing to `main` publishes the site.
