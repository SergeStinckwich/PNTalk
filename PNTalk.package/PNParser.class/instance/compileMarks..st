compile
compileMarks: aSource

	| res |

	lexer := Lex new onString: aSource.

	self lex.
	alex isEOF 
		ifFalse: [ res := self multiset ].

	^ res.