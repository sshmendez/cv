#!/usr/bin/env node
// Render resume.md into dist/: a styled web page (index.html) and a PDF (resume.pdf).
// Both share styles/resume.css so the page and the printable PDF stay in sync.
//
//   node build.mjs           # build both HTML and PDF
//   node build.mjs --html    # HTML only (fast; no headless Chromium)
//   node build.mjs --pdf     # PDF only
//
// Env:
//   RESUME_SRC   source markdown (default: resume.md)
//   RESUME_PDF   pdf filename inside dist/ (default: resume.pdf)

import { readFileSync, writeFileSync, mkdirSync, copyFileSync } from "node:fs";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { marked } from "marked";

const __dirname = dirname(fileURLToPath(import.meta.url));
const args = new Set(process.argv.slice(2));
const doHtml = args.has("--html") || !args.has("--pdf");
const doPdf = args.has("--pdf") || !args.has("--html");

const SRC = process.env.RESUME_SRC || "resume.md";
const PDF_NAME = process.env.RESUME_PDF || "resume.pdf";
const DIST = join(__dirname, "dist");
const CSS = readFileSync(join(__dirname, "styles/resume.css"), "utf8");
// resolve() honors an absolute SRC (e.g. a tmp file from render.sh --full)
// while still resolving a relative SRC from the repo root.
const md = readFileSync(resolve(__dirname, SRC), "utf8");

mkdirSync(DIST, { recursive: true });

// Pull the H1 (name) for the document <title>.
const nameMatch = md.match(/^#\s+(.+)$/m);
const fullName = nameMatch ? nameMatch[1].trim() : "Resume";

if (doHtml) {
  const fragment = marked.parse(md);
  const toolbar = `
    <div class="toolbar">
      <a href="${PDF_NAME}" download>↓ Download PDF</a>
      <span>${fullName} — résumé</span>
    </div>`;
  const html = `<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>${fullName} — Résumé</title>
  <meta name="description" content="${fullName} — Staff Software Engineer. Résumé." />
  <style>${CSS}</style>
</head>
<body class="web">
  ${toolbar}
  <main class="sheet">
${fragment}
  </main>
</body>
</html>`;
  writeFileSync(join(DIST, "index.html"), html);
  // Disable Jekyll so GitHub Pages serves our files verbatim.
  writeFileSync(join(DIST, ".nojekyll"), "");
  console.log(`✓ dist/index.html`);
}

if (doPdf) {
  // md-to-pdf pulls in headless Chromium; import lazily so --html stays light.
  const { mdToPdf } = await import("md-to-pdf");
  const pdf = await mdToPdf(
    { content: md },
    {
      stylesheet: [join(__dirname, "styles/resume.css")],
      pdf_options: {
        format: "Letter",
        margin: { top: "14mm", bottom: "14mm", left: "16mm", right: "16mm" },
        printBackground: true,
      },
      launch_options: { args: ["--no-sandbox", "--disable-setuid-sandbox"] },
    }
  );
  writeFileSync(join(DIST, PDF_NAME), pdf.content);
  console.log(`✓ dist/${PDF_NAME}`);
}
