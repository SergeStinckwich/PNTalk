instance creation
performWithArguments: aParams forObject: anObject

	| method index |
	method := self newIn: anObject.

	index := 0.
	paramsList do: [ :param || arg |
		index := index + 1.
		arg := PNtalkProxy tryProxyFor: (aParams at: index).
		(method placeNamed: param) add: arg mult: 1.
	].
	
	^ method.