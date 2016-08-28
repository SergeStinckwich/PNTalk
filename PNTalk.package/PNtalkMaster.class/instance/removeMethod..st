active processing
removeMethod: aMethod

	listInvocatedMethods rehash.
	listProcesses rehash.
	listInvocatedMethods removeKey: (aMethod message) ifAbsent: [nil].
	listProcesses remove: aMethod.