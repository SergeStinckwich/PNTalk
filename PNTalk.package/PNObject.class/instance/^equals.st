testing
= aProxy
	^ (aProxy isKindOf: PNtalkProxy)
		ifTrue: [ super = aProxy reify ]
		ifFalse: [ super = aProxy ].