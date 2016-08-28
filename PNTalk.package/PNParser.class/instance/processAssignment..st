smalltalk post-parsing
processAssignment: statement

	| action |
	action := self processStatement: (statement value).
	(action isKindOf: PNCompiledAction)
		ifFalse: [ | a |	
			a := PNCompiledAssgnLeaf new.
			actionsCollection addLast: a.
			a receiver: action.
			action := a.			
		].
	action assgn: (statement variable name).
	^ action.