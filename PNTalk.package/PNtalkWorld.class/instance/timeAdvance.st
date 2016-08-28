DEVS
timeAdvance

	| runnableObjects |
	runnableObjects := self getExecutableObjects.
	runnableObjects isEmpty
		ifTrue: [  | t |
			timeSuspend ifTrue: [ ^ Float infinity ].
			t := calendar whatsNextTime. 
			t isNil 
				ifTrue: [ ^ Float infinity ]
				ifFalse: [ ^ t - self time ].
		]
		ifFalse: [ ^ 0 ]. 
