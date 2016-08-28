request control
newSim

	| repo clsName cls sim |
	repo := self getRepo.
	repo isNil ifTrue: [ stream sendCommand: 'FAILED: REPO ACCESS'. ^ stream flush. ].
	
	clsName := stream nextLine.

	cls := repo componentNamed: clsName.
	cls isNil ifTrue: [ stream sendCommand: 'FAILED: BAD CLASS NAME'. ^ stream flush. ].

	sim := PNtalkSimulation create.
	cls newIn: sim world.

	stream sendCommand: 'OK'.
	stream sendCommand: sim name.

"	stream nextPutAll: ss contents."
	^ stream flush.
