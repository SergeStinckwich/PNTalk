world simulation
stepTime

	| newTime |
	newTime := world nextTime.
	newTime isNil
		ifFalse: [
			self time: newTime.
			self componentsDo: [ :obj | obj releaseEventsForTime: newTime ].
			^ true.
		].
	^ false.