accessing
sourceCode

	| src |
	src := ''.
	collection associationsDo: [ :item | 
		(src = '') ifFalse: [ src := src, ', '].
		src := src, item value printString, '`', item key printString.
	].
	^ src.