garbage collector
allReferences: aSet proxies: aProxiesSet

	orderedContent do: [:item | 
		(item isKindOf: PNtalkObjectProxy)
			ifTrue: [ 
				aSet add: item reify.
				aProxiesSet add: item.
			].
	].