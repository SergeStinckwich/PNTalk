examples
insertClasses

	| repository |
	repository := self defaultRepository.

	self compileExample1To: repository.
	self compileExample2To: repository.
	self compileAckermannTo: repository.
	self compileConferenceTo: repository.
	self compileExampleDJDTo: repository.
	self compileExampleBankModelTo: repository.
	self compileExampleBankTo: repository.
