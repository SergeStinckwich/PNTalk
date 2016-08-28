garbage collector
allReferences: aSet proxies: aProxiesSet

	components do: [:c | c allReferences: aSet proxies: aProxiesSet ].
	^ aSet.