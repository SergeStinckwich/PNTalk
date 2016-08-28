comparing
confrontWithList: aSecondList atIndex: index variables: aVariables

	| obj1 obj2 result item |
	(index > self size)
		ifTrue: [ ^true ].

	obj1 := self at: index.
	obj2 := aSecondList at: index.

	result := (obj1 isKindOf: PNVariable) 
		ifTrue: [ 
			((obj2 isKindOf: PNVariable) not & (obj2 isKindOf: PNList) not)  
				ifTrue: [ 
					item := aVariables at: (obj1 name) ifAbsent: [nil].
					item isNil 	ifTrue: [ aVariables at: (obj1 name) put: obj2. true ] 
								ifFalse: [ (item = obj2) ] 
				].
		]
		ifFalse: [
			(obj1 isKindOf: PNList) 
				ifTrue: [ (obj2 isKindOf: PNList ) ifTrue: [ obj1 confrontWithList: obj2 dictionary: aVariables ] ]
				ifFalse: [ ((obj2 isKindOf: PNVariable) not & (obj2 isKindOf: PNList) not & (obj1 = obj2)). "????????" ].
		].

	^result
		ifTrue: [ self confrontWithList: aSecondList atIndex: (index+1) variables: aVariables. ]
		ifFalse: [ false ].