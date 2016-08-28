active processing
processBody

	| msg |
	[ status = #running ]
		whileTrue: [
			msg := self getMessage.
			self doExclusive: [ self processMessage: msg ].
			Processor yield.
"
			[ 	semaphore wait.
				self processMessage: msg. 
				semaphore signal.
			] on: Exception do: [
				semaphore signal.
				self halt.
			].
"
		].
"
	| msg |
	[ status = #running ]
		whileTrue: [ 
			msg := self getMessage.
			(status = #running) ifTrue: [ self processMessage: msg ].
		].
"