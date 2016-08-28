world simulation
waitForTime: aTime

	| wt t |
	(rtFactor closeTo: 0) ifTrue: [ ^ 0 ].
	
Transcript show: 'DANGER!'; cr.
	wt := (aTime * rtFactor) truncated.
	t := Time millisecondClockValue + wt.
	rtTimer := Timer at: t.
	rtTimer wait.
	rtTimer := nil.
	^ wt.