domain processing
OLDstepTime

	| newTime |
	newTime := calendar nextTime.
	newTime isNil
		ifFalse: [
			parent waitForTime: newTime. "new"
	Transcript show: newTime printString; cr.
			self time: newTime.
			self componentsDo: [ :obj | obj releaseEventsForTime: newTime ].
			^ true.
		].
	^ false.