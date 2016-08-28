new accessing
processElementID: anID ifAbsent: aBlock

	^ processElements at: anID ifAbsent: aBlock.