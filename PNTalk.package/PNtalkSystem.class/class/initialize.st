class initialization
initialize
	super initialize.
	PNtalkMessage IDGenerator: PNtalkIDGenerator new.
	PNtalkMethodContext IDGenerator: PNtalkIDGenerator new.
"
	repository := PNCompiledClass defaultRepository.
	PNCompiledClass insertClasses.
"
"	
	PNtalkSimulation default.
"
"	PNCompiledClass new name: 'PN'; yourNameSpace: repository."
"	self systemAlert.
	self welcome.
"
