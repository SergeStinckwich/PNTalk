processing
performAction
	result put: ((actions at: actionIndex) valueInThread: self variables: variables).
	(result get isKindOf: PNtalkMessage) ifTrue: [ result pop ].
	result isEmpty ifFalse: [ self finishAction ].