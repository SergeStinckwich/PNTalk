method context
getMethodContextFor: anObject
	^ self isDomain
		ifFalse: [ (PNtalkMethodContext newForObject: anObject)  message: self; yourself ]
		ifTrue: [ | net |
			net := anObject yourClass performMessage: self forObject: anObject.
			net isNil
				ifFalse: [ net ]
				ifTrue: [ (PNtalkMethodContext newForObject: anObject) message: self; yourself ].
		 ].
