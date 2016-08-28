repository
fullName
	| str |
	str := '(', id printString, ') >> ('.
	variables associationsDo: [:pair |
		str := str, pair key printString, '->', pair value printString, ' '.
	].
	^ str, ')'.