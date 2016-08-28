domain processing
suspendSimulationFor: aTime

	rtTimer isNil ifFalse: [ rtTimer terminate ].
	
	rtTimer := [ | t rt |
		t := self time.
		rt := Time millisecondClockValue.
		rtTimer := Delay forMilliseconds: aTime.
		self activity: false.
		rtTimer wait.
		self activity: true.
		self time: (t + Time millisecondsSince: rt).
		rtTimer := nil.
		self performSelector: #nextStep.
	] fork.
	