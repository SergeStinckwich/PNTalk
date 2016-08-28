compile
compileMethod: aSource

	| res |

	lexer := Lex new onString: aSource.

	self lex.
	res := self parseNet.

	^ res.