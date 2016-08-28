new accessing
methodContextID: anID ifAbsent: aBlock

	^ mContexts at: anID ifAbsent: aBlock.