compiler
processList: aList for: aBlock

	aList isNil ifFalse: [
		aList do: [:item || cond place |
			place := item at: 1.
			(item at: 2) do: [ :pair |
				((pair key isKindOf: PNVariable) | (pair key isKindOf: PNList)) ifFalse: [ pair key: (PNVariable new value: (pair key)) ].
				(pair value isKindOf: PNVariable) ifFalse: [ pair value: (PNVariable new value: (pair value)) ].
				aBlock value: place value: pair.
			].
		].
	].
