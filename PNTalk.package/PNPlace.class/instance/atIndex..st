accessing
atIndex: anIndex
	| key |
	key := orderedContent at: anIndex.
	^ content associationAt: key.
