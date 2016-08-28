copying
copy

	| aCopy |
	self safelyDo: [
		aCopy := self shallowCopy postCopy initializeSimulationControl ].
	^aCopy