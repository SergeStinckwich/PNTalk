processing
finishAction

	(actions at: actionIndex) finishInThread: self variables: variables result: (result pop).
	actionIndex := actionIndex + 1.
	(actionIndex > (actions size))
		ifTrue: [ self destroy ]
		ifFalse: [ self process newEvent: self ].
