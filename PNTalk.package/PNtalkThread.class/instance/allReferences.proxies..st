garbage collector
allReferences: aSet proxies: aProxiesSet

	variables valuesDo: [:item |
		(item isKindOf: PNtalkObjectProxy)
			ifTrue: [ 
				aSet add: item reify.
				aProxiesSet add: item.
			].		
	].