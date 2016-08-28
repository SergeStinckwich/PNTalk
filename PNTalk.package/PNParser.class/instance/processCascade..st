smalltalk post-parsing
processCascade: statement

	| action ret receiver |
	ret := self processStatement: (statement receiver).
	receiver := (ret isKindOf: PNCompiledAction)
		ifTrue: [ 
			PNCompiledArgument new fromQueue.
			ret assgnToQueue.
		]
		ifFalse: [ret ].

	(statement instVarNamed: 'messages') do: [:stm |
		"vysledkem musi byt vzdy akce!!!!"
		action := self processStatement: stm.
		action receiver: receiver.
	].
	^ action.