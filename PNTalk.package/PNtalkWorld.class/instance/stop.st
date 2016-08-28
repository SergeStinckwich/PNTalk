accessing
stop
	super stop.
"	self componentsDo: [:item | item stop ]."

Transcript show: 'Simulation "', parent name, '" stopped.'; cr.
