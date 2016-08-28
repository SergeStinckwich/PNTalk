processing
forwardTestGuard: aStack

	| goal position goalsSize listV |
	goal := aStack get.
	position := goal position.
	goalsSize := guardGoals size.

	goal test
		ifTrue: [
			guardsBindings addLast: (goal allBindings).
			position := position + 1.
			(position <= goalsSize)
				ifTrue: [ 
					listV := goal bindVariables.
					aStack put: ((guardGoals at: position) variables: listV).
					^ self forwardTestGuard: aStack.
				 ]
				ifFalse: [ | b v gb |
					aStack setSuccess. 
					b := PNBinding new. 
					v := goal bindVariables.
					b variables: v.
					gb := guardsBindings copy.
					gb removeFirst. gb addFirst: v.
					b bindings: gb.
					guardsBindings removeLast.
					^ Result createSuccess put: b.
"
					^ Result createSuccess put: (goal bindVariables); put: guardsBindings copy."
"					^ Result createSuccess put: goal."
				].
		] 
		ifFalse: [
			aStack pop.
			guardsBindings removeLast.
			^ self backwardTestGuard: aStack.
		].