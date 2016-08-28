garbage collector
allProxyReferences: aProxiesSet

	orderedContent do: [:item | 
		(item isKindOf: PNtalkObjectProxy)
			ifTrue: [ aProxiesSet add: item 	].
	].