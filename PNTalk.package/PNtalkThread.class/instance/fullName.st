repository
fullName
	| str |
	str := '(', id printString, '), index: ', actionIndex printString, ', ('.
	variables associationsDo: [:pair |
		str := str, pair key printString, '->', pair value printString, ', '.
	].
	^ str, ')'.