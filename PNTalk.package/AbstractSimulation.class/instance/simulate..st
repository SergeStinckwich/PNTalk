simple simulation
simulate: t

	stopTime := t.
	self prepareToStart.
	startStopSemaphore initSignals.	"running simulation indication"
	[ clock < stopTime ] whileTrue: [ self simulationStep ].
	startStopSemaphore signal.
	self prepareToStop.

	reportStream flush.
