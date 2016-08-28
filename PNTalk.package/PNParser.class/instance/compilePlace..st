compile
compilePlace: aSource

	| res |

	lexer := Lex new onString: aSource.

	self lex.
	res := self parsePlace.

	^ res.