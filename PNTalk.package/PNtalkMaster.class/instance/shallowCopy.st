copying
shallowCopy

	| o |
	o := super shallowCopy.
	
	o instVarNamed: 'status' put: status.
	o instVarNamed: 'inputQueue' put: inputQueue copy.
	o instVarNamed: 'listProcesses' put: listProcesses.
	o instVarNamed: 'listInvocatedMethods' put: listInvocatedMethods.

	o instVarNamed: 'semaphore' put: Semaphore new signal.
	
	^ o.