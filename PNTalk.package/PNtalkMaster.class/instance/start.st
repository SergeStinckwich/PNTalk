accessing
start

	process isNil ifTrue: [
		status := #running.
		process := [
			self processBody.
		] fork.
"		] forkAt: (self class priority)."
	].