private
lightProcess

	lP := true.
	lightProcess := [
		[ lP ] whileTrue: [ | t |
			self primLightCollect.
			t := Time millisecondClockValue + 250.
			lightTimer := Timer at: t.
			lightTimer wait.
		].
	] forkAt: PNtalkGarbageCollector priority.