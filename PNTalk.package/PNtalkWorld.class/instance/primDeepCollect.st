garbage collector
primDeepCollect

	| toRemove |
"	Smalltalk garbageCollect.
	Smalltalk garbageCollectMost."
	
	toRemove := components copy.
	self primCollectReferences: toRemove from: (toRemove removeKey: 1).

	"Aby to fungovalo i bez Smalltalk garbageCollect, pro korektni funkci se predpoklada, ze neni externi reference do PNtalku"
	"
	refs := IdentitySet new.
	toRemove do: [:obj | obj allProxyReferences: refs ].
		
	toRemove2 := toRemove select: [:obj || remove |
		remove := true.
		obj arrayOfProxies do: [:proxy | remove := remove & (refs includes: proxy) ].
		remove.	
	].
	
	toRemove2 keysDo: [:key | "
	toRemove keysDo: [:key | 
	"	garbageComponents at: key put: (components at: key)."
		components removeKey: key.		
	].

	self dTest.
"
	garbageComponents do: [:obj | obj destroy ].
	garbageComponents := Dictionary new.
"