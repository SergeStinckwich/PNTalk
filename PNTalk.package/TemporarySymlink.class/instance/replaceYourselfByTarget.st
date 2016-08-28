as yet unclassified
replaceYourselfByTarget

	owner ifNil: [
		"PrototypeObject>sixxOn sets owner since cyclical references are not a problem there. 
		PrototypeObject>>storeOn: does not set the owner. We must search for it."
		owner := self theOnlyPrototypeObjectPointingToMe ].
	owner ifNil: [ self error: 'TemporarySymlink: Owner not known.' ].
	cachedTarget ifNil: [ cachedTarget := MyRepository at: pathName ifAbsent: [
		self error: 'TemporarySymlink: Target not known. ' ]].
	(owner isKindOf: PrototypeObject) 
		ifTrue: [
			owner slotNames, owner delegateNames do: [ :sn |
				(owner perform: sn asSymbol) == self ifTrue: [
					(owner perform: (sn, ':') asSymbol with: cachedTarget) ]]]
		ifFalse: [ self error: 'TemporarySymlink: Improper use.' ]

