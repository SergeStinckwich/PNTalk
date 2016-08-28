compile
compileModel: aSource
	"JEN DOCASNE. MUSI SE PREJMENOVAT NA compile: A UPRAVIT VSECHNA VOLANI compile:"

	| res |
	lexer := Lex new onString: aSource.
	res := OrderedCollection new.

	self lex.

	[ alex isEOF ]
		whileFalse: [ res addLast: (self compileElement) ].

	^ res.
