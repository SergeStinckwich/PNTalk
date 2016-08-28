new accessing
messageID: anID ifAbsent: aBlock

	^ messages at: anID ifAbsent: aBlock.