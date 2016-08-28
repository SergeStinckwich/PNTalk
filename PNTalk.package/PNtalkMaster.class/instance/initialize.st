initialize-release
initialize
	super initialize.
	status := #created.
	inputQueue := SharedQueue new.
	semaphore := Semaphore new signal.
	listInvocatedMethods := Dictionary new.
	listProcesses := OrderedCollection new.
"
	listDependencies := Dictionary new.
"