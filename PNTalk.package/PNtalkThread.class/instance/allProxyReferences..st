garbage collector
allProxyReferences: aProxiesSet

	variables valuesDo: [:item |
		(item isKindOf: PNtalkObjectProxy)
			ifTrue: [ aProxiesSet add: item 	].		
	].