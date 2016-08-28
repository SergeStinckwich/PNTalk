garbage collector
lightCollect

	| t1 |
	t1 := Time millisecondClockValue.
	self doExclusive: [ self primLightCollect ].
	^ Time millisecondClockValue - t1.
	
