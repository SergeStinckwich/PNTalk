domain processing
releaseTimedEventsFor: aTime

	| nextTime |
	
	nextTime := calendar whatsNextTime.
	
	nextTime isNil ifTrue: [ ^ false ].
	
	(nextTime <= aTime) ifTrue: [
		calendar nextTime.
		self componentsDo: [ :obj | obj releaseEventsForTime: aTime ].
		^ true.
	].

	^ false.
