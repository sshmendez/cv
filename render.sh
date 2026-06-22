#!/bin/bash
# Local resume renderer. Wraps `npm run build` and adds the niceties that only
# make sense on your machine: a full-contact PDF (phone + personal email) for
# sending directly, macOS Finder tags, iCloud copy, and open/reveal.
#
# The PUBLIC artifacts (dist/index.html, dist/resume.pdf) are scrubbed — they use
# only the proton address + links from resume.md, and are what gets published to
# GitHub Pages. The FULL contact details live ONLY in contact.private.md (gitignored)
# and are injected on `--full`; that PDF is never committed or published.
#
# Usage:
#   ./render.sh                 build the public PDF (dist/resume.pdf) and open it
#   ./render.sh --full          build a full-contact PDF for sending directly
#   ./render.sh --full -t Sent  ...and tag it / copy to iCloud
#
# Options:
#   -f, --full         inject contact.private.md (phone + gmail) into the PDF
#   -o, --output FILE  output PDF path (default depends on mode)
#   -O, --open         open the PDF when done (default on)
#       --no-open      do not open
#   -r, --reveal       reveal in Finder
#   -t, --tag TAGS     comma-separated macOS Finder tags to apply
#   -h, --help         show this help

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

FULL=false
OUTPUT=""
OPEN_PDF=true
REVEAL=false
TAGS=""

while [[ $# -gt 0 ]]; do
  case $1 in
    -f|--full) FULL=true; shift ;;
    -o|--output) OUTPUT="$2"; shift 2 ;;
    -O|--open) OPEN_PDF=true; shift ;;
    --no-open) OPEN_PDF=false; shift ;;
    -r|--reveal|--finder) REVEAL=true; shift ;;
    -t|--tag) TAGS="$2"; shift 2 ;;
    -h|--help) sed -n '2,28p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

[ -d node_modules ] || npm install

SRC="resume.md"
if [[ "$FULL" == true ]]; then
  if [[ ! -f contact.private.md ]]; then
    echo "Error: --full needs contact.private.md (gitignored) with your full contact line." >&2
    echo "Create it with one line, e.g.:" >&2
    echo "  210-555-0100 · you@gmail.com · [LinkedIn](https://linkedin.com/in/shmendez)" >&2
    exit 1
  fi
  # Swap the public contact line (the one with the proton address) for the private one.
  SRC="$(mktemp -t resume-full).md"
  PRIVATE_LINE="$(head -n1 contact.private.md)"
  awk -v repl="$PRIVATE_LINE" '/^hypermemetic@proton\.me/ && !done {print repl; done=1; next} {print}' resume.md > "$SRC"
  [[ -z "$OUTPUT" ]] && OUTPUT="dist/resume-full.pdf"
fi

[[ -z "$OUTPUT" ]] && OUTPUT="dist/resume.pdf"
PDF_NAME="$(basename "$OUTPUT")"

echo "Rendering ${FULL:+(full contact) }$SRC -> $OUTPUT"
RESUME_SRC="$SRC" RESUME_PDF="$PDF_NAME" node build.mjs --pdf
# build.mjs writes to dist/$PDF_NAME; move if a different path was requested.
if [[ "$OUTPUT" != "dist/$PDF_NAME" ]]; then mv "dist/$PDF_NAME" "$OUTPUT"; fi
[[ "$FULL" == true ]] && rm -f "$SRC"
echo "Created: $OUTPUT"

ABS_OUTPUT="$(cd "$(dirname "$OUTPUT")" && pwd)/$(basename "$OUTPUT")"

# macOS Finder tags
if [[ -n "$TAGS" ]]; then
  IFS=',' read -ra TAG_ARRAY <<< "$TAGS"
  TAG_LIST=""
  for tag in "${TAG_ARRAY[@]}"; do
    tag=$(echo "$tag" | xargs)
    [[ -n "$TAG_LIST" ]] && TAG_LIST+=", "
    TAG_LIST+="\"$tag\""
  done
  osascript -e "
    use framework \"Foundation\"
    set theURL to current application's NSURL's fileURLWithPath:\"$ABS_OUTPUT\"
    theURL's setResourceValue:{$TAG_LIST} forKey:(current application's NSURLTagNamesKey) |error|:(missing value)
  " 2>/dev/null && echo "Tagged: $TAGS" || echo "Warning: could not apply tags"
fi

# Copy the full-contact PDF to iCloud for easy access from anywhere.
if [[ "$FULL" == true ]]; then
  ICLOUD_DIR="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Resume"
  mkdir -p "$ICLOUD_DIR"
  cp "$OUTPUT" "$ICLOUD_DIR/" && echo "Copied to iCloud: $ICLOUD_DIR/$(basename "$OUTPUT")"
fi

[[ "$OPEN_PDF" == true ]] && open "$OUTPUT"
[[ "$REVEAL" == true ]] && open -R "$OUTPUT"
echo "Done!"
