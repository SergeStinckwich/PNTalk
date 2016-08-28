garbage collector
primCollectReferences: toCheck from: anObj

	| objs |
	toCheck isEmpty ifTrue: [ ^ self ].
	
	objs := IdentitySet new.
	anObj allReferences: objs.
	objs do: [:obj |
		(toCheck includes: obj)
			ifTrue: [
				toCheck removeKey: obj id.
				self primCollectReferences: toCheck from: obj.
			].
	].