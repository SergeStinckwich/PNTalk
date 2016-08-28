compile
compileArc: aSource type: aType to: aTrans

	| res |

	lexer := Lex new onString: aSource.

	self lex.
	res := self optbas: aType.
	
	(aType = #cond)
		ifTrue: [ ^ aTrans conds: res ].
	(aType = #precond)
		ifTrue: [ ^ aTrans preconds: res ].
	(aType = #postcond)
		ifTrue: [ ^ aTrans postconds: res ].
	
	^ res.