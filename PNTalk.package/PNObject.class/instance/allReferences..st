garbage collector
allReferences: aSet

	components do: [:c | c allReferences: aSet ].
	^ aSet.