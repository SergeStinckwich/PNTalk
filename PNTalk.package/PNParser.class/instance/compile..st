compile
compile: aSource

	| res |
	lexer := Lex new onString: aSource.

	self lex.

	[ alex isEOF ]
		whileFalse: [ res := self compileElement ].

	^ res.
