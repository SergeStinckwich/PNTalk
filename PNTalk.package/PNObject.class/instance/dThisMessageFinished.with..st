domain processing
dThisMessageFinished: aMsg with: aRetVal

	| thread |
	thread := listDependencies at: aMsg.
	thread continueWith: aRetVal fromMessage: aMsg.
	listDependencies removeKey: aMsg.