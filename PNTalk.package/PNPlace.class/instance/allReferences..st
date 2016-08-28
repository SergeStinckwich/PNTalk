garbage collector
allReferences: aSet

	orderedContent do: [:item | 
		(item isKindOf: PNtalkObjectProxy)
			ifTrue: [ aSet add: item reify ].
	].