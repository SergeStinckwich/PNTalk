accessing
stop

	self doExclusive: [
		status := #stop.
		process notNil ifTrue: [ process terminate ].
		process := nil.
	].
"
	semaphore wait.
	status := #stop.
	process terminate.
	process := nil.
	semaphore signal.
"