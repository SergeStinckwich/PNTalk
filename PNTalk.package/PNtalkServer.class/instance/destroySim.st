request control
destroySim

	
	| simID c sim |
	simID := c := stream nextLine.
"
	simID := [ c asNumber ] ifError: [ nil ].
	simID isNil ifTrue: [ stream sendCommand: 'FAILED: BAD ID'. ^ stream flush. ].
"	
	sim := PNtalkSimulation simulationNamed: simID.
	sim isNil ifTrue: [ stream sendCommand: 'FAILED: BAD ID'. ^ stream flush. ].

	sim stop.
	sim destroy.

	stream sendCommand: 'OK'.

"	stream nextPutAll: ss contents."
	^ stream flush.
