accessing
bindVariables

	self isBoolean ifTrue: [ ^ variables copy ].
	^ super bindVariables.