private
startUnprotected

	| r |
	r := true.
	startStopSemaphore isSignaled ifTrue: [ "Simulation has been requested to stop recently."
		idleSemaphore wait.		"Ensure that the simulation really does not run."
		startStopSemaphore initSignals.	"Not signaled means the simulation may run."
		process := [ [ self processBody. ] ensure: [ idleSemaphore signal ] ] 
						forkAt: Processor userBackgroundPriority.
		r := false ].
	^ r
