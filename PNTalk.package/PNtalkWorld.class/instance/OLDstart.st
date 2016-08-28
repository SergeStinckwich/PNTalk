accessing
OLDstart
	self test.
	self componentsDo: [:item | item start ].
	super start.
	parent tryStep.

Transcript show: 'Simulation "', parent name, '" started.'; cr.

"	executor firstStep."

"
	self doExclusive: [ 
		components do: [:item | item test ].
		self dStep.
	].
"