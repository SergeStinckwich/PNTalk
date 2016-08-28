private
initializeSimulationControl

	startStopSemaphore := Semaphore new.
	startStopSemaphore signal.							"means that simulator has been requested to stop"
	idleSemaphore := Semaphore new.
	idleSemaphore signal.								"means that simulator is stopped"
	accessProtect := Semaphore forMutualExclusion.		"thread safe start/stop etc."
	process := nil.
