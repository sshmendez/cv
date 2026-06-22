# cv

Canonical source for my résumé, plus the tooling that turns markdown into a PDF
and a published web page.

**Live:** https://sshmendez.github.io/cv/ · **PDF:** https://sshmendez.github.io/cv/resume.pdf

## How it works

```
resume.md            ── the canonical résumé (single source of truth)
styles/resume.css    ── shared styling for the web page and the PDF
build.mjs            ── renders resume.md → dist/index.html + dist/resume.pdf
render.sh            ── local wrapper: full-contact PDF, Finder tags, iCloud, open
.github/workflows/   ── on push to main, build and deploy the page to GitHub Pages
```

`resume.md` and the published artifacts are **scrubbed** — they expose only my
proton address and profile links, no phone or personal email.

## Edit & preview

```bash
npm install            # first time (pulls headless Chromium for the PDF)
npm run build:html     # fast: dist/index.html only
open dist/index.html
npm run build          # both HTML and PDF
```

Push to `main` and the GitHub Action rebuilds and redeploys the live page + PDF.

## Sending a full-contact PDF

The public PDF has no phone number or personal email. To produce a copy with the
full contact line for sending directly to a recruiter:

1. Create `contact.private.md` (gitignored) with a single line, e.g.
   `210-555-0100 · you@gmail.com · [LinkedIn](https://linkedin.com/in/shmendez)`
2. `./render.sh --full` — writes `dist/resume-full.pdf` (gitignored), copies it to
   iCloud, and opens it. This artifact is never committed or published.

## Targeted variants

Alternate, role-targeted résumés live in `variants/`. Render one with:

```bash
RESUME_SRC=variants/fullstack-svelte-go.md npm run build:pdf
```
