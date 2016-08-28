accessing
test
	self doExclusive: [ 
		components do: [:item | item test ].
	].