private
initialize

	self initializeSimulationControl.
	clock ifNil: [ clock := 0 ]. stopTime := Float infinity.

	reportStream := Transcript. verbose := true.
