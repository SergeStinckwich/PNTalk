garbage collector
allReferences: aSet proxies: aProxiesSet
	
	places do: [:p | p allReferences: aSet proxies: aProxiesSet ].
	threads do: [:t | t allReferences: aSet proxies: aProxiesSet ].