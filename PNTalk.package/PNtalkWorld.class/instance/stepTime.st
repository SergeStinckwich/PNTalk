domain processing
stepTime

	| newTime |
	
	(parent rtFactor closeTo: 0) ifFalse: [ ^ true ].
	
	newTime := calendar nextTime.
	newTime isNil
		ifFalse: [
			self printToReportStream: 'step time: ', newTime printString; cr.
			self time: newTime.
			"self componentsDo: [ :obj | obj releaseEventsForTime: newTime ]."
			^ true.
		].
	^ false.