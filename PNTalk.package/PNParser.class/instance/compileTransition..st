compile
compileTransition: aSource

	| res |

	lexer := Lex new onString: aSource.

	self lex.
	res := self parseTransition.

	^ res.