deprecated
processResult: aResult

	aResult success ifTrue: [
		bindings := aResult pop.
		allBindings := aResult pop.
		^ true.
	].
	^ false.