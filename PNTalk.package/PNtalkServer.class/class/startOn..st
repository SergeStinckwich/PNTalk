accessing
startOn: aPort

	| s stream |
	server := Socket newTCP.
	destroyed := false.
	
	[
		[
			server listenOn: aPort backlogSize: 30.
			[ destroyed ] whileFalse: [
				s := server waitForAcceptFor: 50.
				"s := server accept."
				s isNil ifFalse: [
					[ super new serve: s ] fork.
				]
			]
		] ensure: [
			self destroy.
		]
	] fork.