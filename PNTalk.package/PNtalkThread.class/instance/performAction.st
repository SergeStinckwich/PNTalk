processing
performAction

self parent parent parent parent parent reportStream nextPutAll: ('fire action of ', parent name, String cr).

	result put: ((actions at: actionIndex) valueInThread: self variables: variables).
	(result get isKindOf: PNtalkMessage) ifTrue: [ result pop ].
	result isEmpty ifFalse: [ self finishAction ].