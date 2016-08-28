processing
perform

	self process removeEvent: self.
	actionIndex = 0 ifTrue: [ ^ self destroy ].
	result isEmpty
		ifTrue: [ self performAction ]
		ifFalse: [ self finishAction ].