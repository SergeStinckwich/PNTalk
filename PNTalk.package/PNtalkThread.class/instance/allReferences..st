garbage collector
allReferences: aSet

	variables valuesDo: [:item |
		(item isKindOf: PNtalkObjectProxy)
			ifTrue: [ aSet add: item reify ].		
	].