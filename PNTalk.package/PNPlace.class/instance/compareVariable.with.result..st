place testing
compareVariable: aVar with: aValue result: aResult

	aVar isList
		ifTrue: [
			(aValue isKindOf: PNList) 
				ifTrue: [ | dictionary |
					dictionary := PNtalkDictionary new.
					(aVar confrontWithList: aValue dictionary: dictionary) 
						ifTrue: [ aResult put: dictionary. ^ true ].
				].
		]
		ifFalse: [
			aVar isEmpty
				ifTrue: [
					aVar value: aValue.
					aResult put: aVar.
					^ true.
				]
				ifFalse: [
					^ (aVar value = aValue)
				].
		].

	^ false.