accessing
time: aTime

	(time closeTo: aTime) ifFalse: [ changedTime := true ].
	time := aTime.
	