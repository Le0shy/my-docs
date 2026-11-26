// Fallback PDF-to-text using macOS PDFKit (no poppler needed).
// Usage: osascript -l JavaScript scripts/pdfkit2text.js IN.pdf OUT.txt
// Pages are separated by form feeds, like pdftotext.
ObjC.import('PDFKit');
function run(argv) {
  const doc = $.PDFDocument.alloc.initWithURL($.NSURL.fileURLWithPath(argv[0]));
  if (doc.isNil()) throw new Error('cannot open ' + argv[0]);
  const parts = [];
  for (let i = 0; i < doc.pageCount; i++) parts.push(ObjC.unwrap(doc.pageAtIndex(i).string) || '');
  $(parts.join('\f')).writeToFileAtomicallyEncodingError(argv[1], true, $.NSUTF8StringEncoding, null);
  return doc.pageCount + ' pages';
}
