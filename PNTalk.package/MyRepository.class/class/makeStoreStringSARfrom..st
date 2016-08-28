as yet unclassified
makeStoreStringSARfrom: obj
	| sar sarName |
	sar := ZipArchive new.
	sar addString: obj storeString as: 'storestring'.

	sar addString: 'MyRepository at: ', obj pathName storeString, 
		' put: (Object readFrom: (self memberNamed: ''storestring'') contents). ' as: 'install/preamble'.

	sarName := 'Root', ((obj pathName copyWithRegex: '/' matchesReplacedWith: '.') copyWithRegex: ' ' matchesReplacedWith: '_'), '.sar'.

	sar writeToFileNamed: sarName.
