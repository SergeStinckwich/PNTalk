testing
testAckermann

	| sim ackClass ack1 res |
	sim := PNtalkSimulation newNamed: 'Testing'.
	
	ackClass := MyRepository objectWithPathName: '/PNtalk classes/Ackermann'.
	ack1 :=  ackClass newIn: (sim world).
	
	sim start.
	
	[ res := ack1 x: 2 y: 3. 	Transcript show: 'RESULT: ', res asString. ] fork.


	
	sim stop.
	sim destroy.