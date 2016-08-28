garbage collector
allReferences: aSet
	
	places do: [:p | p allReferences: aSet ].
	threads do: [:t | t allReferences: aSet ].