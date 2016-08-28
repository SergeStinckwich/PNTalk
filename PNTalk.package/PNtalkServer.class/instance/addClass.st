request control
addClass

	| repoName repo clsDef cls |
	"repos := stream nextLine. zatim ne, bude natvrdo"
	repo := self getRepo.
	repo isNil ifTrue: [ stream sendCommand: 'FAILED: REPO ACCESS'. ^ stream flush. ].

	clsDef := stream nextLine.

"	cls := [ PNCompiledClass compileClass: clsDef ] ifError: [ stream sendCommand: 'FAILED: COMPILER'. ^ stream flush ].
	repo addComponent: cls named: (cls name)."
	
	[ PNCompiledClass compileModel: clsDef inSpace: repo ] ifError: [ stream sendCommand: 'FAILED: COMPILER'. ^ stream flush ].

	stream sendCommand: 'OK'.

	^ stream flush.
