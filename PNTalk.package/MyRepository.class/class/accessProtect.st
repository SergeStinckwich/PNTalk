as yet unclassified
accessProtect
	AccessProtect ifNil: [ AccessProtect := Semaphore forMutualExclusion ].
	^ AccessProtect