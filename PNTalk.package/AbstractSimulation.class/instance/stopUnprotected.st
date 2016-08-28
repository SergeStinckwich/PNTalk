private
stopUnprotected

	| r |
	r := false.
	startStopSemaphore isSignaled ifFalse: [
		startStopSemaphore signal.	"A signal to stop."
		idleSemaphore wait.	"Waiting for current step finishing." 
		idleSemaphore initSignals; signal. "Initialize the semaphore."
		r := true ].
	^ r



