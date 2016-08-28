printing
storeOn: aStream

	| src newSrc |
	aStream nextPutAll: '(PNCompiledClass compileClass: '''.
"	aStream nextPutAll: ('class ', self name, ' is_a ', self superClassName).
	aStream cr."
	src := self sourceCode.
	newSrc := src copyWithRegex: '''' matchesReplacedWith: ''''''.
"	aStream nextPutAll: self sourceCode."
	aStream nextPutAll: newSrc.
"	netsList do: [ :net | aStream nextPutAll: net sourceCode ]."
	netsList do: [ :net | 
		src := net sourceCode.
		newSrc := src copyWithRegex: '''' matchesReplacedWith: ''''''.
		aStream nextPutAll: newSrc.
"		aStream nextPutAll: net sourceCode "
	].
	aStream nextPutAll: ''')'.