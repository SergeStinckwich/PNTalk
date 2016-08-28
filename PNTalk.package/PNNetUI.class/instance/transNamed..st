event handling
transNamed: aTransName

	| transList |
	transList := transMorphs select: [:m | m model name = aTransName ].
	^ transList notEmpty
		ifTrue: [ transList at: 1]
		ifFalse: [ nil ].
