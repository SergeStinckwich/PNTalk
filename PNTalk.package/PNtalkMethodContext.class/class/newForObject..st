instance creation
newForObject: anObject
	^super new forObject: anObject; id: self nextID.