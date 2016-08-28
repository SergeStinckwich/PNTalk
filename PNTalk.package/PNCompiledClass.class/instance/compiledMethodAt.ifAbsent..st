browser
compiledMethodAt: aSelector ifAbsent: aBlock

	^ netsList at: aSelector ifAbsent: [
		(objectNet name = aSelector) 
			ifTrue: [ objectNet ]
			ifFalse: [ aBlock value ].
	].