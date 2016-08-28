as yet unclassified
makeSIXXSARfrom: obj
	| sar sarName |

Cursor write showWhile: [

	sar := ZipArchive new.
	"sar addString: obj sixxString as: 'sixxstring'."
	sar addCompressedString:  (obj sixxString convertToWithConverter: (TextConverter newForEncoding: 'utf-8')) as: 'sixxstring'.

	sar addString: 'Cursor read showWhile: [ MyRepository at: ', obj pathName storeString, 
		' put: (Object readSixxFrom: ((self memberNamed: ''sixxstring'') contents convertFromWithConverter: (TextConverter newForEncoding: ''utf-8''))) ]. ' as: 'install/preamble'.

	sarName := 'Root', ((obj pathName copyWithRegex: '/' matchesReplacedWith: '.') copyWithRegex: ' ' matchesReplacedWith: '_'), '.sar'.

	sar writeToFileNamed: sarName.

]

