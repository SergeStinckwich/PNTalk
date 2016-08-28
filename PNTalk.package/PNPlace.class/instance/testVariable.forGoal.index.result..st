new place testing
testVariable: aPair forGoal: aGoal index: anIndex result: aResult
	
	| var mult index ok size value res |
	var := aPair key copy.
	mult := aPair value.
	index := anIndex.
	size := content size.
	ok := index < size.

	[ ok ]
		whileTrue: [
			index := index + 1.
			value := orderedContent at: index.
			(self compareVariable: var with: value result: aResult)
				ifTrue: [
					res := self compareMult: mult value: value result: aResult.
					res success ifTrue: [ listContext at: aGoal put: index. ^ aResult ].
				].
			ok := (index < size).
"			ok := (index <= size)."
		].

	listContext at: aGoal ifAbsent: [ ^ aResult ].
	listContext removeKey: aGoal.
	^ aResult