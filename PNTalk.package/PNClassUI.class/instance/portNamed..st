event handling
portNamed: aTransName

	| transList |
	transList := portMorphs select: [:m | m model name = aTransName ].
	^ transList notEmpty
		ifTrue: [ transList at: 1]
		ifFalse: [ nil ].
