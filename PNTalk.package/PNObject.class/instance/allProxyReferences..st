garbage collector
allProxyReferences: aProxiesSet

	components do: [:c | c allProxyReferences: aProxiesSet ].
	^ aProxiesSet.