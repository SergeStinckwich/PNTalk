accessing
messageWithOldID: anOld 
	^ messages at: anOld ifAbsent: [nil].