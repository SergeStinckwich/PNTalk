compile
compileClass: aSource

	| res |
self halt.
	lexer := Lex new onString: aSource.

	self lex.
	res := self parseNet.

	^ res.