as yet unclassified
latexCompileAndView
	"Requires UNIX, LaTeX, xpdf, wmctrl. Log goes to Transcript."

	| latexCommand viewCommand viewerStartCommand viewerTestCommand |

	self exportTo: (FileDirectory on: ('/tmp/LaTeXDocumentTMP.DOCUMENT/' copyReplaceTokens: 'DOCUMENT' with: self name asByteString)).

	latexCommand := 'rm -f /tmp/LaTeXDocumentTMP.DOCUMENT/DOCUMENT.log /tmp/LaTeXDocumentTMP.DOCUMENT/DOCUMENT.dvi /tmp/LaTeXDocumentTMP.DOCUMENT/DOCUMENT.ps /tmp/LaTeXDocumentTMP.DOCUMENT/DOCUMENT.pdf ; ',
		'cd /tmp/LaTeXDocumentTMP.DOCUMENT ; ',
	"	'recode utf8..latin2 DOCUMENT.tex ; ',	"
		'latex --interaction=nonstopmode DOCUMENT.tex ; ',	
		'dvips -Ppdf -q DOCUMENT.dvi -o DOCUMENT.ps ; ',
		'ps2pdf DOCUMENT.ps DOCUMENT.pdf'.
	latexCommand := latexCommand copyReplaceTokens: 'DOCUMENT' with: self name asByteString.

	viewerStartCommand := 'xpdf -remote .DOCUMENT. /tmp/LaTeXDocumentTMP.DOCUMENT/DOCUMENT.pdf'.
	viewerStartCommand := viewerStartCommand copyReplaceTokens: 'DOCUMENT' with: self name asByteString.
	viewCommand := 'wmctrl -a DOCUMENT; xpdf -remote .DOCUMENT. -reload'.
	viewCommand := viewCommand copyReplaceTokens: 'DOCUMENT' with: self name asByteString.

"
	viewerStartCommand := 'xdvi /tmp/TeXTMP.dvi'.
	viewCommand := 'wmctrl -a TeXTMP; killall -SIGUSR1 xdvi.bin'.
"
	viewerTestCommand := 'wmctrl -l | grep DOCUMENT'.
	viewerTestCommand := viewerTestCommand copyReplaceTokens: 'DOCUMENT' with: self name asByteString.

	Transcript show: (PipeableOSProcess command: latexCommand) output asString withSqueakLineEndings.
	(PipeableOSProcess command: viewerTestCommand) output size > 0 ifTrue: [
		OSProcess command: viewCommand ]
	ifFalse: [
		OSProcess command: viewerStartCommand ].

	"see also TeXTMP.log"


