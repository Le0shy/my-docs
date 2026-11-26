# hongyu — writing hub

Personal site built with [Hugo](https://gohugo.io/) and the [OINK](https://oink.pgsty.com/) theme. English and Chinese.

## Shelves

```text
content/
├── blog/              Blog (blog shell)
│   ├── essays/        long-form writing and opinions
│   └── notes/         short thoughts and daily notes
├── kb/                Knowledge Base (docs shell, sidebar tree)
│   ├── papers/        paper reading notes  (taxonomy: venues)
│   ├── concepts/      field knowledge: storage, query processing, txns ...
│   ├── systems/       internals of specific systems
│   └── industry/      history, business, market
└── reviews/           Reviews (blog shell)
    ├── music/
    ├── film/
    └── books/
```

Taxonomies: `tags`, `categories`, `series` (multi-part posts), `venues` (SIGMOD, VLDB, ...).

## Write something

```bash
hugo new content --kind post    blog/essays/my-essay.md
hugo new content --kind post    blog/notes/2026-11-25-quick-thought.md
hugo new content --kind paper   kb/papers/c-store.md
hugo new content --kind concept kb/concepts/mvcc.md
hugo new content --kind concept kb/systems/duckdb.md
hugo new content --kind review  reviews/music/some-album.md
```

New pages start as `draft: true`; delete that line to publish.

- Chinese version of a page: same name with `.zh.md` (e.g. `c-store.zh.md`). A page only appears in the language it is written in.
- Link pages: `[MVCC]({{< relref "/kb/concepts/mvcc" >}})` — linked pages show backlinks automatically.
- Sub-folders in `kb/` (e.g. `kb/concepts/storage/`) need an `_index.md` to show up in the sidebar.

## Paper library (private)

`library/` is a separate private repo with the PDFs and AI-generated study notes. This repo ignores it. On a new machine:

```bash
git clone https://github.com/Le0shy/my-docs-library.git library
```

Drop a PDF in as `library/<slug>.pdf`, then make searchable text copies with `scripts/pdf2text.sh`. Study notes go to `library/notes/<slug>.md`; your own published note, if you write one, goes to `content/kb/papers/<slug>.md`.

## Preview and build

```bash
hugo server -D          # preview with drafts at http://localhost:1313/my-docs/
hugo --cleanDestinationDir --gc --minify --environment production \
  --printPathWarnings --panicOnWarning   # publication gate
```

Requires Git, Go 1.27+, and Hugo Extended 0.165.0+. Deployment workflows for GitHub Pages and Cloudflare Pages are in `.github/workflows/`.
