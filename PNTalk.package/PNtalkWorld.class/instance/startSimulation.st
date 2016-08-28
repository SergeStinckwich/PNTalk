accessing
startSimulation
	"Spusteni simulace. Predpoklad: objekt je spusten (viz start)"

	self isRunning ifTrue: [
"		self isActive ifFalse: [ "
			self printToReportStream: 'Start simulation in the world ', self id printString.
			self activity: true. 
			self test.
			startTime := Time millisecondClockValue.
			self performSelector: #nextStep. 
"		]."
	].

