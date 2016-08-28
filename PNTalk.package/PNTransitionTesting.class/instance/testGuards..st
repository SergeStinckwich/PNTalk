processing
testGuards: aVariables

	| goal |
	guardGoals isEmpty
		ifTrue: [ | b |
			b := PNBinding new.
			b variablesAndBindings: aVariables.
			^ Result createSuccess put: b. 
		].

	goal := guardGoals at: 1.
	goal variables: aVariables.
	guardsStack put: goal.
	guardsBindings addLast: aVariables.
	^ self forwardTestGuard: guardsStack.
