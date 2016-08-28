repository
fullName
	| str |
	str := '(p)', name, '('.
	content associationsDo: [ :pair |
		str := str, pair value printString, '->', pair key printString.
	].
	^ str, ')'.