#!/usr/bin/env bash
# Convert library/*.pdf to searchable plain text in library/text/.
# Only converts PDFs that are new or changed since their text copy.
# Usage: scripts/pdf2text.sh            (all PDFs)
#        scripts/pdf2text.sh FILE.pdf   (specific PDFs)
set -euo pipefail
cd "$(dirname "$0")/.."
# Prefer poppler's pdftotext; fall back to macOS PDFKit (scripts/pdfkit2text.js).
if command -v pdftotext >/dev/null; then
  convert() { pdftotext -enc UTF-8 "$1" "$2"; }
else
  convert() { osascript -l JavaScript scripts/pdfkit2text.js "$1" "$2" >/dev/null; }
fi
mkdir -p library/text
shopt -s nullglob
files=("$@"); [ ${#files[@]} -eq 0 ] && files=(library/*.pdf)
n=0
for pdf in "${files[@]}"; do
  txt="library/text/$(basename "${pdf%.pdf}").txt"
  if [ ! -f "$txt" ] || [ "$pdf" -nt "$txt" ]; then
    # Form feeds mark page breaks, so page N = text after the (N-1)th \f.
    convert "$pdf" "$txt" && echo "converted: $pdf" && n=$((n+1))
  fi
done
echo "$n file(s) converted; text copies in library/text/"
