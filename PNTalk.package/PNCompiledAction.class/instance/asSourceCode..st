browser
asSourceCode: anElement

	(anElement isString and: [ anElement isSymbol not ])
		ifTrue: [ ^ '''', anElement asString, '''' ].
"		ifTrue: [ ^ '''''', anElement asString, '''''' ]."
	^ anElement printString.
"	^ anElement asString."
	"anElement asString printString"	
