as yet unclassified
theOnlyPrototypeObjectPointingToMe
	"... or nil"
	"Note: This is time consuming operation !!!"

	| allArrays slotArrays prototypeObjects prototypeObject |
	"searching for array of slots pointing to me"
	allArrays := (PointerFinder pointersTo: self) select: [ :p | p isKindOf: Array ]. 
	slotArrays := allArrays select: [ :q |
		prototypeObjects := (PointerFinder pointersTo: q) select: [ :r | r isKindOf: PrototypeObject ]. 
		prototypeObjects size = 1 ifTrue: [ prototypeObject :=  prototypeObjects at: 1 ].
		prototypeObjects size = 1 ].
	^ (slotArrays size = 1) ifTrue: [ prototypeObject ] ifFalse: [ nil ]

