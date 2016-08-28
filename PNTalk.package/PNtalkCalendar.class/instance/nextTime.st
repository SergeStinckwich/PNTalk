accessing
nextTime

	^(cal isEmpty)
		ifTrue: [ nil ]
		ifFalse: [ cal removeFirst at: 1. ].