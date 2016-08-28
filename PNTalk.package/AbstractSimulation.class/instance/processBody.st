private
processBody

	self prepareToStart.
	[ startStopSemaphore isSignaled ] whileFalse: [ 	
		clock < stopTime 	"clock = stopTime = Float infinity ---> stop non rt sim"
			ifTrue: [ self simulationStep. Processor yield ]
			ifFalse: [ startStopSemaphore signal ] ].
	self prepareToStop.
