accessing
simulationStep
	self doExclusive: [
		self dStep.
"		self dTest."
		"pri simulaci se otestuje az vse naraz"
	].