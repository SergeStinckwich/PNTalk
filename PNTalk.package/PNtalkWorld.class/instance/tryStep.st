executor
tryStep
	
	self shouldNotImplement.
	self isActive ifFalse: [ activity := true. self performSelector: #nextStep ].
	