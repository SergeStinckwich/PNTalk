new place testing
compareMult: aMultVar value: aValue result: aResult

	| newMult realMult |
	realMult := content at: aValue.
	aMultVar isEmpty
		ifTrue: [
			newMult := aMultVar copy.
			newMult value: realMult.
			aResult setSuccess; put: newMult.
		]
		ifFalse: [
			(aMultVar value <= realMult)
				ifTrue: [ 
					aResult setSuccess.
				].
		].
	^ aResult