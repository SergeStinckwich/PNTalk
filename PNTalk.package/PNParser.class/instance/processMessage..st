smalltalk post-parsing
processMessage: statement

	| action ret |
	action := PNCompiledAction new.

	ret := self processStatement: (statement receiver).
	(ret isKindOf: PNCompiledAction)
		ifFalse: [ action receiver: ret ]
		ifTrue: [ 
			action receiver: (PNCompiledArgument new fromQueue).
			ret assgnToQueue.
		].

	action selector: (statement selector key).

	statement arguments do: [:stm |
		ret := self processStatement: stm.
		(ret isKindOf: PNCompiledAction)
			ifTrue: [ 
				action addArgument: (PNCompiledArgument new fromQueue).
				ret assgnToQueue.
			]
			ifFalse: [ action addArgument: ret ].
	].

	actionsCollection addLast: action.
	^ action.