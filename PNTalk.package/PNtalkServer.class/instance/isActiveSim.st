request control
isActiveSim

	
	| simID c sim act |
	simID := c := stream nextLine.
"
	simID := [ c asNumber ] ifError: [ nil ].
	simID isNil ifTrue: [ stream sendCommand: 'FAILED: BAD ID'. ^ stream flush. ].
"	
	sim := PNtalkSimulation simulationNamed: simID.
	sim isNil ifTrue: [ stream sendCommand: 'FAILED: BAD ID'. ^ stream flush. ].

	act := sim isActive.

	stream sendCommand: act asString.

"	stream nextPutAll: ss contents."
	^ stream flush.
