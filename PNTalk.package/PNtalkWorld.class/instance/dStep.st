domain processing
dStep

	| t |

	t := self timeAdvance.
	
"	Transcript show: t printString, String cr."
	
	(t = Float infinity) ifTrue: [ self printToReportStream: 'Simulation ', self id asString, ' suspended'. ^ activity := false ].
	
	(parent rtFactor closeTo: 0) 
		ifTrue: [ 
			self time: (self time + t). 
			self releaseTimedEvents. "nemusi byt, je i v intStep, ale urychli to uvolneni udalosti (v intStep uz se neprovede)"
			activity := true 
		]
		ifFalse: [
			"rtFactor > 0"
			"musi se doresit, jak posunovat cas"
			activity := false.
		].

	self intStep.
