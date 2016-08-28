request control
serve: aSocket

	| commands c cc |
	
	socket := aSocket.

	commands := #(#getState #addClass #newSim #stepSim #startSim #stopSim #destroySim #isActiveSim).

	[
		stream := SocketStream on: aSocket.
		c := stream nextLine.
		cc := c asSymbol.
		(commands anySatisfy: [:e | e == cc ]) 
			ifTrue: [ self perform: cc ]
			ifFalse: [ stream sendCommand: 'FAILED: BAD CMD'. ^ stream flush ].
	] ensure: [
		stream close.
	]
