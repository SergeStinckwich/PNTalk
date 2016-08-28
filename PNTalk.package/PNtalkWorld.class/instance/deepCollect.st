garbage collector
deepCollect

	| t1 |
	t1 := Time millisecondClockValue.
	self doExclusive: [ self primDeepCollect ].
	^ Time millisecondClockValue - t1.
