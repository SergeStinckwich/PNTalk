compile
compileAction: aSource

	| res |

	lexer := Lex new onString: aSource.

	self lex.
	res := self optAction.
	
	^ res.