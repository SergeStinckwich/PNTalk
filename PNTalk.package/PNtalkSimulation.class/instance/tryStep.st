world simulation
tryStep

	self isRunning ifTrue: [
		world isActive ifFalse: [ 
			world activity: true. 
			world test.
"			self isRunning ifTrue: [ world performSelector: #nextStep]."
			world performSelector: #nextStep.
		].
	].
