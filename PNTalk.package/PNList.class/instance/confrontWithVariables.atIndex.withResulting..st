comparing
confrontWithVariables: aVariables atIndex: index withResulting: newList

	| item |
	(self size < index) 
		ifTrue: [ ^newList ].

	item := self at: index.
	
	(item isKindOf: PNVariable)
		ifTrue: [
			(aVariables includesKey: (item name))	
				ifTrue: [ newList add: (aVariables at: (item name))]
				ifFalse: [ newList add: item ].
		]"
		ifTrue: [ (newItem := aVariables at: (item name) ifAbsent: [ newList add: item. nil ]) notNil ifTrue: [ newList add: newItem ] ]"
		ifFalse: [
			(item isKindOf: PNList) 
				ifTrue: [ newList add: (item confrontWithVariables: aVariables) ]
				ifFalse: [ newList add: item ].
		].

	^self confrontWithVariables: aVariables atIndex: (index+1) withResulting: newList.