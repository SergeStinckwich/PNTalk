accessing
whatsNextTime

	^ cal isEmpty 
		ifTrue: [ nil ]
		ifFalse: [ (cal at: 1) at: 1 ].
