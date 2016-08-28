garbage collector
allProxyReferences:  aProxiesSet
	
	places do: [:p | p allProxyReferences: aProxiesSet ].
	threads do: [:t | t allProxyReferences: aProxiesSet ].