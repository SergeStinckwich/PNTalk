simple simulation
doSteps: n

	self prepareToStart.
	startStopSemaphore initSignals.	"running simulation indication"
	n timesRepeat: [ self simulationStep ].
	startStopSemaphore signal.
	self prepareToStop.

	reportStream flush.
