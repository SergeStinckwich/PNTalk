request control
getState

	
	| simID c sim w state s |
	simID := c := stream nextLine.
"
	simID := [ c asNumber ] ifError: [ nil ].
	simID isNil ifTrue: [ stream sendCommand: 'FAILED: BAD ID'. ^ stream flush. ].
"	
	sim := PNtalkSimulation simulationNamed: simID.
	sim isNil ifTrue: [ stream sendCommand: 'FAILED: BAD ID'. ^ stream flush. ].

	w := sim world.
	state := w getStateXML.

	s := WriteStream on: ''.
	state linesDo: [:line | s nextPutAll: line].

	stream sendCommand: 'OK'.
	stream sendCommand: s contents.

"	stream nextPutAll: ss contents."
	^ stream flush.
