as yet unclassified
fullName
	^ self name, ' [', (self isRunning ifTrue: ['R'] ifFalse: ['S']) , ']'