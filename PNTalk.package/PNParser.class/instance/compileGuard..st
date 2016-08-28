compile
compileGuard: aSource

	| res |

	lexer := Lex new onString: aSource.

	self lex.
	res := self optGuard.
	
	^ res.