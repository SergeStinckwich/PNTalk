executor
firstStep
	self shouldNotImplement.
	self test.
	self doExclusive: [ self nextStep ].