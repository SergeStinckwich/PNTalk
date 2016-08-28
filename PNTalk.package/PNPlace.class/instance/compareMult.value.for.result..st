place testing
compareMult: aMultVar value: aValue for: aContext result: aResult

	| newMult realMult lockedMult |
	realMult := content at: aValue.
	lockedMult := listLocks at: aValue ifAbsent: [0].
	aMultVar isEmpty
		ifTrue: [
			(realMult - lockedMult > 0)
				ifTrue: [
					newMult := aMultVar copy.
					newMult value: (realMult - lockedMult).
					aContext at: 2 put: aValue -> newMult value.
					aResult setSuccess; put: newMult.
					listLocks at: aValue put: realMult.
				].
		]
		ifFalse: [
			(aMultVar value <= (realMult - lockedMult))
				ifTrue: [ 
					aContext at: 2 put: aValue -> aMultVar value.
					aResult setSuccess.
					listLocks at: aValue put: (lockedMult + aMultVar value).
				].
		].
	^ aResult.