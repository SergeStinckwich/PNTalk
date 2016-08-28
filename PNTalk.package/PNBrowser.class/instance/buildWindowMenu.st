as yet unclassified
buildWindowMenu

	| m |
	m := super buildWindowMenu.
	m addLine.
	self isStepping 
		ifFalse: [ m add: 'start stepping' translated action: #startStepping ]
		ifTrue: [ m add: 'stop stepping' translated action: #stopStepping ].
	^m