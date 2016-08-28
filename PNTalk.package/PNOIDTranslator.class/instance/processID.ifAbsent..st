new accessing
processID: anID ifAbsent: aBlock

	^ processes at: anID ifAbsent: aBlock.